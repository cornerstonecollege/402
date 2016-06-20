//
//  ViewController.m
//  Views
//
//  Created by CICCC1 on 2016-06-20.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "ViewController.h"
#import "SpeechBubble.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    SpeechBubble *bubble = [[SpeechBubble alloc] initWithFrame:CGRectMake(self.view.center.x - 50, self.view.center.y - 50, 100, 100)];
    //bubble.backgroundColor = [UIColor redColor];
    [self.view addSubview:bubble];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
