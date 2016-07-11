//
//  ViewController.m
//  ScroleView
//
//  Created by Digby Andrews on 2016-06-21.
//  Copyright © 2016 Digby Andrews. All rights reserved.
//

#import "ViewController.h"
#import "Circle.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    Circle *triangle = [[Circle alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width * 2, self.view.frame.size.height * 2)];
    triangle.backgroundColor = [UIColor blueColor];
    //triangle.center = self.view.center;
    //self.view addSubview:triangle];

    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    scrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:scrollView];
    scrollView.contentSize = triangle.frame.size;
    
    [scrollView addSubview:triangle];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
