//
//  ViewController.m
//  TabViews
//
//  Created by Digby Andrews on 2016-06-21.
//  Copyright © 2016 Digby Andrews. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (instancetype) init
{
    self = [super init];
    if (self)
    {
        self.title = @"blah2";
        self.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemSearch tag:2];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
