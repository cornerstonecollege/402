//
//  PokedexHelper.m
//  SavingPokemons
//
//  Created by CICCC1 on 2016-07-20.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "PokedexHelper.h"

@interface PokedexHelper ()

@property (nonatomic) NSMutableArray<Pokemon *> *pokedex;

@end

@implementation PokedexHelper

+ (instancetype)sharedInstance
{
    static PokedexHelper *instance;
    if (!instance)
    {
        instance = [[PokedexHelper alloc] init];
    }
    
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _pokedex = [NSKeyedUnarchiver unarchiveObjectWithFile:[self path]];
        
        if (!_pokedex)
        {
            _pokedex = [NSMutableArray array];
        }
    }
    
    return self;
}

- (void)addPokemon:(Pokemon *)pokemon
{
    [self.pokedex addObject:pokemon];
}

- (void)saveChanges
{
    [NSKeyedArchiver archiveRootObject:self.pokedex toFile:[self path]];
}

- (NSString *) path
{
    NSArray *directories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *directory = [directories firstObject];
    NSString *path = [directory stringByAppendingPathComponent:@"pokedex.archiver"];
    return path;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.pokedex.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }
    
    cell.textLabel.text = self.pokedex[indexPath.row].name;
    return cell;
}

@end
