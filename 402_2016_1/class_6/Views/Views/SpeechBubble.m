//
//  SpeechBubble.m
//  Views
//
//  Created by CICCC1 on 2016-06-20.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "SpeechBubble.h"

@interface SpeechBubble ()

@property (nonatomic) UIColor *circleColor;

@end

@implementation SpeechBubble

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor greenColor];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        [self addGestureRecognizer:tapGesture];
        
        UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
        [self addGestureRecognizer:pinchGesture];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGPoint center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path addArcWithCenter:center radius:self.frame.size.width / 2 - 10 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    
    path.lineWidth = 10;
    [self.circleColor setStroke];
    [self.circleColor setFill];
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

- (void) handleTap:(UITapGestureRecognizer *)tapGesture
{
    self.circleColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
    [self setNeedsDisplay];
}

- (void) handlePinch:(UIPinchGestureRecognizer *)pinchGesture
{
    if (pinchGesture.scale < 0.5 || pinchGesture.scale > 1.5)
        return;
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width * pinchGesture.scale, self.frame.size.height * pinchGesture.scale);
    [self setNeedsDisplay];
}

@end
