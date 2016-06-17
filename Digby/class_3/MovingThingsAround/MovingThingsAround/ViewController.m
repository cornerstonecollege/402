//
//  ViewController.m
//  MovingThingsAround
//
//  Created by Digby Andrews on 2016-06-15.
//  Copyright © 2016 Digby Andrews. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) UILabel *myLabel;
@property (nonatomic) BOOL isTounching;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"My Beautiful label";
    [label sizeToFit];
    label.center = self.view.center;
    label.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:label];
    self.myLabel = label;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    
    self.isTounching = CGRectContainsPoint(self.myLabel.frame, location);
    if (self.isTounching)
    {
        NSLog(@"Is Touching");
    }
    else
    {
        NSLog(@"Is Not Touching");
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.isTounching)
    {
        UITouch* touch = [touches anyObject];
        CGPoint location = [touch locationInView:self.view];
        
        self.myLabel.center = location;
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.isTounching = NO;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
