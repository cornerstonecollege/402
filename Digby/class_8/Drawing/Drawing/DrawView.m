//
//  DrawView.m
//  Drawing
//
//  Created by Digby Andrews on 2016-06-22.
//  Copyright © 2016 Digby Andrews. All rights reserved.
//

#import "DrawView.h"

@interface DrawView ()

@property (nonatomic) UIBezierPath *path;
@property (nonatomic) CGPoint finalPoint;
//@property (nonatomic) UIColor *colorLine;

@end

@implementation DrawView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    {
        //self.backgroundColor = [UIColor yellowColor];
        //self.colorLine = [UIColor redColor];
        self.path = [UIBezierPath bezierPath];
    }
    return self;
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
- (void)drawRect:(CGRect)rect
{
    if (self.path.empty)
    {
        return;
    }
    [self.path addLineToPoint:self.finalPoint];
    self.path.lineWidth = 10;
    [[UIColor redColor] setStroke];
    [self.path stroke];
}

@end
