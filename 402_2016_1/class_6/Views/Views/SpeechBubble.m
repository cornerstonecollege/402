//
//  SpeechBubble.m
//  Views
//
//  Created by CICCC1 on 2016-06-20.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "SpeechBubble.h"

@implementation SpeechBubble

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
    CGPoint center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path addArcWithCenter:center radius:self.frame.size.width / 2 - 10 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    
    path.lineWidth = 10;
    [[UIColor greenColor] setStroke];
    [[UIColor greenColor] setFill];
    [path fill];
    [path stroke];
    
    CGPoint lastPoint = CGPointMake(self.frame.size.width, self.frame.size.height);
    
    [path moveToPoint:lastPoint];
    [path addLineToPoint:center];
    [path addLineToPoint:CGPointMake(center.x, center.y * 1.5)];
    [path addLineToPoint:lastPoint];
    
    [path closePath];
    [path fill];
}

@end
