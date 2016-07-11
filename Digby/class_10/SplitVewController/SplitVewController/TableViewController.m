//
//  TableViewController.m
//  SplitVewController
//
//  Created by Digby Andrews on 2016-07-04.
//  Copyright © 2016 Digby Andrews. All rights reserved.
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
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }
    
    cell.textLabel.text = [[TableViewController getPokedexInfo] objectForKey:[NSNumber numberWithInteger:indexPath.row]];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[TableViewController getPokedexInfo] count];
}

+ (NSDictionary *) getPokedexInfo
{
    static NSDictionary * pokedexInfo;
    if (!pokedexInfo)
    {
        pokedexInfo = @{
                         @0 : @"Bulbasaur",
                         @1 : @"Ivysaur",
                         @2 : @"Venosaur",
                         @3 : @"Squirtle",
                         @4 : @"Wartotle",
                         @5 : @"Blastoise",
                         @6 : @"Charmander",
                         @7 : @"Charmeleon",
                         @8 : @"Charizard"
                         };
    }
    return pokedexInfo;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [TableViewController getOrSetCurrentIndex:[NSNumber numberWithInteger:indexPath.row]];
}

+ (NSNumber *) getOrSetCurrentIndex: (NSNumber *) idx
{
    static NSNumber *index;
    if (!index)
    {
        index = [NSNumber numberWithInteger:0];
    }
    if ([idx integerValue] >= 0)
    {
        index = idx;
    }
    return index;
}

@end
