//
//  DrawView.m
//  Drawing
//
//  Created by CICCC1 on 2016-06-22.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "DrawView.h"

@interface DrawView ()

@property (nonatomic) UIColor *colorLine;
@property (nonatomic) UIBezierPath *path;
@property (nonatomic) CGPoint finalPoint;

@end

@implementation DrawView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor yellowColor];
        self.colorLine = [UIColor redColor];
        self.path = [UIBezierPath bezierPath];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect
{
    if (self.path.empty)
        return;
    
    [self.path addLineToPoint:self.finalPoint];
    self.path.lineWidth = 5;
    [self.colorLine setStroke];
    [self.path stroke];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint point = [[touches anyObject] locationInView:self];
    [self.path moveToPoint:point];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self setNeedsDisplay];
    CGPoint point = [[touches anyObject] locationInView:self];
    self.finalPoint = point;
}


@end
