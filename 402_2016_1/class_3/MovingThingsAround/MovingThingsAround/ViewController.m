//
//  ViewController.m
//  MovingThingsAround
//
//  Created by CICCC1 on 2016-06-15.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) UILabel *myLabel;
@property (nonatomic) BOOL isTouching;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.myLabel = [[UILabel alloc] init];
    self.myLabel.text = @"My beautiful label";
    [self.myLabel sizeToFit];
    self.myLabel.center = self.view.center;
    self.myLabel.backgroundColor = [UIColor redColor];

    [self.view addSubview:self.myLabel];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    
    self.isTouching = CGRectContainsPoint(self.myLabel.frame, location);
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.isTouching)
    {
        UITouch *touch = [touches anyObject];
        CGPoint location = [touch locationInView:self.view];
        
        self.myLabel.center = location;
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.isTouching = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
