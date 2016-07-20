//
//  ViewController.m
//  SavingPokemons
//
//  Created by CICCC1 on 2016-07-20.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "ViewController.h"
#import "Pokemon.h"
#import "PokedexHelper.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UITextField *txtNumber;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.delegate = [PokedexHelper sharedInstance];
    self.tableView.dataSource = [PokedexHelper sharedInstance];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)addPokemonToPokedex:(id)sender
{
    NSNumber *pokemonNumber = [NSNumber numberWithInt:[self.txtNumber.text intValue]];
    Pokemon *pokemon = [[Pokemon alloc] initWithNumber:pokemonNumber andName:self.txtName.text];
    [[PokedexHelper sharedInstance] addPokemon:pokemon];
    [self.tableView reloadData];
}


@end
