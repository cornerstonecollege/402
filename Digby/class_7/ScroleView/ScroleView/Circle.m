//
//  Circle.m
//  ScroleView
//
//  Created by Digby Andrews on 2016-06-21.
//  Copyright © 2016 Digby Andrews. All rights reserved.
//

#import "Circle.h"

@implementation Circle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, self.frame.size.height)];
    [path addLineToPoint:CGPointMake(self.frame.size.width / 2 , 0)];
    [path addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height)];
    [path addLineToPoint:CGPointMake(0, self.frame.size.height)];
    
    [[UIColor yellowColor] setFill];
    [path fill];
}

@end
