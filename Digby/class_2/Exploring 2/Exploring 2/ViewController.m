//
//  ViewController.m
//  Exploring 2
//
//  Created by Digby Andrews on 2016-06-14.
//  Copyright © 2016 Digby Andrews. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblColor;
@property (weak, nonatomic) IBOutlet UILabel *hex;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)changeColorClicked:(id)sender
{
    NSLog(@"Clicked");
    int red = arc4random_uniform(256);
    int green = arc4random_uniform(256);
    int blue = arc4random_uniform(256);
    
    self.lblColor.text = [NSString stringWithFormat:@"Red: %i Green %i Blue: %i", red, green, blue];
    self.hex.text = [NSString stringWithFormat:@"#%x%x%x", red, green, blue];
    UIColor *randomColor = [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
    self.view.backgroundColor = randomColor;
}
@end
