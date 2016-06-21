//
//  ViewController.m
//  ScrollViewController
//
//  Created by CICCC1 on 2016-06-21.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "ViewController.h"
#import "Circle.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    Circle *circle = [[Circle alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width * 2, self.view.frame.size.height * 2)];
    circle.backgroundColor = [UIColor blueColor];
    //circle.center = self.view.center;
    //[self.view addSubview:circle];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    scrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:scrollView];
    
    scrollView.contentSize = circle.frame.size;
    [scrollView addSubview:circle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
