//
//  ViewController.m
//  Exploring
//
//  Created by Dennis Pham on 2016-06-14.
//  Copyright © 2016 Dennis Pham. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UILabel *lblColor;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)changeColorBtnClicked:(UIButton *)sender

{
    int red = arc4random_uniform(256);
    int green = arc4random_uniform(256);
    int blue = arc4random_uniform(256);
    
    self.lblColor.text = [NSString stringWithFormat:@"Red: %x Green: %x Blue: %x", red, green, blue];
    
    UIColor *randomColor = [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
    
    self.view.backgroundColor = randomColor;
}

@end
