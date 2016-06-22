//
//  ViewController.m
//  Drawing
//
//  Created by Dennis Pham on 2016-06-22.
//  Copyright © 2016 Dennis Pham. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    DrawView *drawView = [[DrawView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width)];
        drawView.center = self.view.center;
        [self.view addSubview:drawView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
