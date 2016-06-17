//
//  ViewController.m
//  MovingManyThings
//
//  Created by Dennis Pham on 2016-06-16.
//  Copyright © 2016 Dennis Pham. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) UILabel *oneLabel;
@property (nonatomic) UILabel *twoLabel;
@property (nonatomic) UILabel *threeLabel;
@property(nonatomic)NSMutableArray *labelArray;
@property (nonatomic) UILabel *selectedLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.oneLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    self.oneLabel.text = @"one number";
    [self.oneLabel sizeToFit];
    self.oneLabel.center = self.view.center;
    self.oneLabel.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.oneLabel];
    
    
    self.twoLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, 50, 50)];
    self.twoLabel.text = @"two number";
    [self.twoLabel sizeToFit];
    self.twoLabel.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:self.twoLabel];
    
    self.threeLabel = [[UILabel alloc]initWithFrame:CGRectMake(200, 600, 50, 50)];
    self.threeLabel.text = @"three number";
    [self.threeLabel sizeToFit];
    self.threeLabel.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:self.threeLabel];
    
    self.labelArray = [NSMutableArray array];
    
    [self.labelArray addObject:_oneLabel];
    [self.labelArray addObject:_twoLabel];
    [self.labelArray addObject:_threeLabel];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    for (UILabel *label in self.labelArray)
    {
        if((CGRectContainsPoint(label.frame, location)))
        {
            self.selectedLabel = label;
            break;
        }
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.selectedLabel.center = [touch locationInView:self.view];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.selectedLabel = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
