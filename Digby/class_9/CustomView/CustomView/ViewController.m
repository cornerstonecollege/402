//
//  ViewController.m
//  CustomView
//
//  Created by Digby Andrews on 2016-06-23.
//  Copyright © 2016 Digby Andrews. All rights reserved.
//

#import "ViewController.h"
#import "SpeechBubbleFunctional.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    SpeechBubbleFunctional *speechBubble = [[SpeechBubbleFunctional alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
    speechBubble.center = self.view.center;
    [self.view addSubview: speechBubble];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
