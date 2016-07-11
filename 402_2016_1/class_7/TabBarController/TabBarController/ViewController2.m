//
//  ViewController2.m
//  TabBarController
//
//  Created by CICCC1 on 2016-06-21.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "ViewController2.h"

@implementation ViewController2

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.title = @"Blah 2";
        self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:1];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel *label = [UILabel new];
    label.text = @"kkkkkkkkk";
    [label sizeToFit];
    label.center = self.view.center;
    
    [self.view addSubview:label];
}

@end
