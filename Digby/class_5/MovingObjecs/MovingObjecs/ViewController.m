//
//  ViewController.m
//  MovingObjecs
//
//  Created by Digby Andrews on 2016-06-17.
//  Copyright © 2016 Digby Andrews. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) NSMutableArray *labelArr;
@property (nonatomic) UILabel *currentLable;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.labelArr = [NSMutableArray array];
    
    int ranNumOfLabels = arc4random_uniform(500)+100;
    
    for (int i = 0; i <= ranNumOfLabels; i++)
    {
        UILabel *tempLabel = [[UILabel alloc] init];
        tempLabel.text = [NSString stringWithFormat:@"Label Number %i", i+1 ];
        tempLabel.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
        CGPoint randPoint;
        [tempLabel sizeToFit];
        randPoint.x = (CGFloat)arc4random_uniform(self.view.frame.size.width - tempLabel.frame.size.width) + tempLabel.frame.size.width / 2;
        randPoint.y = (CGFloat)arc4random_uniform(self.view.frame.size.height- tempLabel.frame.size.height) + tempLabel.frame.size.height / 2;
        tempLabel.center = randPoint;
        
        [self.labelArr addObject:tempLabel];
        [self.view addSubview:tempLabel];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    
    for (long i = self.labelArr.count - 1; i >= 0; i--)
    {
        UILabel *label = self.labelArr[i];
        if (CGRectContainsPoint(label.frame, location))
        {
            self.currentLable = label;
            break;
        }
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    if (location.x > self.currentLable.frame.size.width /2 && location.x < self.view.frame.size.width - self.currentLable.frame.size.width / 2)
    {
        if (location.y > self.currentLable.frame.size.height /2 && location.y < self.view.frame.size.height - self.currentLable.frame.size.height / 2)
        {
            self.currentLable.center = location;
        }
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.currentLable = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
