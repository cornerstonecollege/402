//
//  ViewController.m
//  BasicAPI
//
//  Created by CICCC1 on 2016-08-09.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSArray *json;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    NSURLSession *urlSession = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:@"http://localhost:8888/api"];
    NSURLSessionTask *task = [urlSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        self.json = [NSJSONSerialization JSONObjectWithData:data
                                         options:NSJSONReadingMutableContainers
                                         error:nil];
        [self.tableView reloadData];
    }];
    
    [task resume];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.json.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }
    
    NSInteger userId = [self.json[indexPath.row][@"id"] integerValue];
    NSString *userName = self.json[indexPath.row][@"name"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"#%ld - %@",
                           userId,
                           userName];
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
