//
//  TableViewController.m
//  SplitViewController
//
//  Created by CICCC1 on 2016-07-04.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }

    cell.textLabel.text = [[TableViewController getPokedexInfo]  objectForKey:[NSNumber numberWithInteger:indexPath.row]];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[TableViewController getPokedexInfo]  count];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [TableViewController getOrSetCurrentIndex:[NSNumber numberWithInteger:indexPath.row]];
}

+ (NSDictionary *) getPokedexInfo
{
    static NSDictionary *pokedexInfo;
    if (!pokedexInfo)
    {
        pokedexInfo = @{
                         @0 : @"bulbasaur",
                         @1 : @"ivysaur",
                         @2 : @"venosaur",
                         @3 : @"squirtle",
                         @4 : @"wartotle",
                         @5 : @"blastoise",
                         @6 : @"charmander",
                         @7 : @"charmeleon",
                         @8 : @"charizard"
                         };
    }
    
    return pokedexInfo;
}

+ (NSNumber *)getOrSetCurrentIndex:(NSNumber *)idx
{
    static NSNumber *index;
    if (!index)
        index = [NSNumber numberWithInteger:0];
    if ([idx integerValue] >= 0)
    {
        index = idx;
    }
    
    return index;
}


@end
