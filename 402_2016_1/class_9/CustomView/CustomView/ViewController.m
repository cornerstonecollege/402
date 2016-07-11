//
//  ViewController.m
//  CustomView
//
//  Created by CICCC1 on 2016-06-23.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "ViewController.h"
#import "SpeechBubbleFunctional.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SpeechBubbleFunctional *speechBubble = [[SpeechBubbleFunctional alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    speechBubble.center = self.view.center;
    [self.view addSubview:speechBubble];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
