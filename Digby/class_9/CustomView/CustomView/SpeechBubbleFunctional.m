//
//  SpeechBubbleFunctional.m
//  CustomView
//
//  Created by Digby Andrews on 2016-06-23.
//  Copyright © 2016 Digby Andrews. All rights reserved.
//

#import "SpeechBubbleFunctional.h"

@implementation SpeechBubbleFunctional

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        UITextView *text = [[UITextView alloc]initWithFrame:CGRectMake(self.frame.size.width *0.3, 10, self.frame.size.width * 0.4 - 10, self.frame.size.height *0.9 - 10)];
        text.backgroundColor = [UIColor clearColor];
        [self addSubview:text];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(250.0, 250.0)];
    [path addQuadCurveToPoint:CGPointMake(self.frame.size.width * 0.5, 0) controlPoint:CGPointMake(0, 0)];
    
    [path addLineToPoint:CGPointMake(self.frame.size.width * 0.5, 0)];
    [path addQuadCurveToPoint:CGPointMake(self.frame.size.width, self.frame.size.height * 0.5) controlPoint:CGPointMake(self.frame.size.width, 0)];
    [path addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height * 0.9)];
    [path addLineToPoint:CGPointMake(0, self.frame.size.height * 0.9)];
    [path addLineToPoint:CGPointMake(0, self.frame.size.height * 0.1)];
    
    [[UIColor blueColor] setFill];
    [path fill];
    
    //[path addCurveToPoint:CGPointMake(0, 0) controlPoint1:CGPointMake(0, self.frame.size.height - 10) controlPoint2:CGPointMake(self.frame.size.width + 10, 0)];
    
    
}

@end
