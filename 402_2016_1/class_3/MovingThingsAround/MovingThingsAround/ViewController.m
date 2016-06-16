//
//  ViewController.m
//  MovingThingsAround
//
<<<<<<< HEAD
//  Created by Dennis Pham on 2016-06-15.
//  Copyright © 2016 Dennis Pham. All rights reserved.
=======
//  Created by CICCC1 on 2016-06-15.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
>>>>>>> 6e6f70c2bb5df0d8a13a4a099ac21e106ea93aef
//

#import "ViewController.h"

@interface ViewController ()

<<<<<<< HEAD
@property(nonatomic)UILabel *myLabel;
@property(nonatomic) BOOL isTouching;
=======
@property (nonatomic) UILabel *myLabel;
@property (nonatomic) BOOL isTouching;
>>>>>>> 6e6f70c2bb5df0d8a13a4a099ac21e106ea93aef

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
<<<<<<< HEAD
    self.myLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
=======
    self.myLabel = [[UILabel alloc] init];
>>>>>>> 6e6f70c2bb5df0d8a13a4a099ac21e106ea93aef
    self.myLabel.text = @"My beautiful label";
    [self.myLabel sizeToFit];
    self.myLabel.center = self.view.center;
    self.myLabel.backgroundColor = [UIColor redColor];
<<<<<<< HEAD
    
    [self.view addSubview:self.myLabel];
    

    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
=======

    [self.view addSubview:self.myLabel];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
>>>>>>> 6e6f70c2bb5df0d8a13a4a099ac21e106ea93aef
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    
    self.isTouching = CGRectContainsPoint(self.myLabel.frame, location);
<<<<<<< HEAD
    if (self.isTouching)
    {
        NSLog(@"touching");
        
    }else{
        NSLog(@"not touching");
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if(self.isTouching)
    {
        UITouch *touch = [touches anyObject];
        CGPoint location = [touch locationInView:self.view];
=======
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.isTouching)
    {
        UITouch *touch = [touches anyObject];
        CGPoint location = [touch locationInView:self.view];
        
>>>>>>> 6e6f70c2bb5df0d8a13a4a099ac21e106ea93aef
        self.myLabel.center = location;
    }
}

<<<<<<< HEAD
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
=======
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
>>>>>>> 6e6f70c2bb5df0d8a13a4a099ac21e106ea93aef
{
    self.isTouching = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
<<<<<<< HEAD
    
=======
>>>>>>> 6e6f70c2bb5df0d8a13a4a099ac21e106ea93aef
}

@end
