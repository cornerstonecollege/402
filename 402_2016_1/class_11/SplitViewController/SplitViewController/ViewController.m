//
//  ViewController.m
//  SplitViewController
//
//  Created by CICCC1 on 2016-07-04.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblPokemonName;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSDictionary * dic = [TableViewController getPokedexInfo];
    NSNumber *key = [TableViewController getOrSetCurrentIndex:[NSNumber numberWithInteger:-1]];
    self.lblPokemonName.text = [dic objectForKey:key];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
