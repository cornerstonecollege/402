//
//  ViewController.m
//  Exploring
//
//  Created by CICCC1 on 2016-06-13.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lblCount;

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

- (IBAction)btnCountClicked:(UIButton *)sender
{
    int value = [self.lblCount.text intValue];
    value++;
    self.lblCount.text = [NSString stringWithFormat:@"%d", value];
}


@end
