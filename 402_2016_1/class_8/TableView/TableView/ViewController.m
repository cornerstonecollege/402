//
//  ViewController.m
//  TableView
//
//  Created by CICCC1 on 2016-06-22.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) NSArray *strings;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.strings = @[@"Digby", @"Ibo", @"Dennis", @"Manuel", @"Luiz", @"ddsdsds", @"kkkk", @"blah", @"jaca", @"Digby", @"Ibo", @"Dennis", @"Manuel", @"Luiz", @"ddsdsds", @"kkkk", @"blah", @"jaca", @"Digby", @"Ibo", @"Dennis", @"Manuel", @"Luiz", @"ddsdsds", @"kkkk", @"blah", @"jaca"];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,  50, self.view.frame.size.width, self.view.frame.size.height - 50) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier"];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellIdentifier"];
    }
    
    cell.textLabel.text = self.strings[indexPath.row];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.strings.count;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
