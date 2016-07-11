//
//  ViewController.m
//  Views
//
//  Created by Digby Andrews on 2016-06-20.
//  Copyright © 2016 Digby Andrews. All rights reserved.
//

#import "ViewController.h"
#import "SpeechBubble.h"

@interface ViewController ()
@property (nonatomic) NSMutableArray *bubbleArr;
@property (nonatomic) SpeechBubble *bubble;
@property (nonatomic) BOOL isTouching;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.bubbleArr = [NSMutableArray array];
    self.bubble = [[SpeechBubble alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.bubble.center = self.view.center;
    [self.view addSubview:self.bubble];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    
    self.isTouching = CGRectContainsPoint(self.bubble.frame, location);
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    
    self.bubble.center = location;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.isTouching = NO;
}


@end
