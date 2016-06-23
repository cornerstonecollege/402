//
//  SpeechBubbleFunctional.m
//  CustomView
//
//  Created by CICCC1 on 2016-06-23.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "SpeechBubbleFunctional.h"

@implementation SpeechBubbleFunctional

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.backgroundColor = [UIColor clearColor];
        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 10, self.frame.size.width - 10, self.frame.size.height * 0.9 - 10)];
        textView.backgroundColor = [UIColor clearColor];
        [self addSubview:textView];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, self.frame.size.height * 0.1)];
    
    [path addQuadCurveToPoint:CGPointMake(self.frame.size.width * 0.1, 0) controlPoint:CGPointMake(0, 0)];
    
    [path addLineToPoint:CGPointMake(self.frame.size.width, 0)];
    [path addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height * 0.9)];
    [path addLineToPoint:CGPointMake(0, self.frame.size.height * 0.9)];
    
    [path addLineToPoint:CGPointMake(0, self.frame.size.height * 0.1)];
    
    [[UIColor lightGrayColor] setFill];
    [path fill];
}

@end
