//
//  ViewController.m
//  SplitVewController
//
//  Created by Digby Andrews on 2016-07-04.
//  Copyright © 2016 Digby Andrews. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *pokemonLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *dic = [TableViewController getPokedexInfo];
    NSNumber *key = [TableViewController getOrSetCurrentIndex:[NSNumber numberWithInteger: -1]];
    self.pokemonLabel.text = [dic objectForKey:key];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
