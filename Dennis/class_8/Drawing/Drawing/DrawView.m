//
//  DrawView.m
//  Drawing
//
//  Created by Dennis Pham on 2016-06-22.
//  Copyright © 2016 Dennis Pham. All rights reserved.
//

#import "DrawView.h"

@interface DrawView ()

@property(nonatomic) UIColor *colorLine;
@property (nonatomic) UIBezierPath *path;
@property (nonatomic) CGPoint finalPoint;

@end

@implementation DrawView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.backgroundColor = [UIColor yellowColor];
        self.colorLine = [UIColor redColor];
        self.path = [UIBezierPath bezierPath];
        
//        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        
//        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    if(self.path.empty)
        return;
    
    [self.path addLineToPoint:self.finalPoint];
    self.path.lineWidth = 10;
    [self.colorLine setStroke];
    
    [self.path stroke];
    
    
    
    
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    [path moveToPoint:CGPointMake(0, self.frame.size.width)];
//    [path addLineToPoint:CGPointMake(self.frame.size.width/ 2, 0)];
//    [path addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height)];
//    [path addLineToPoint:CGPointMake(0, self.frame.size.height)];
    
//    [self.traingeColor setFill];
//    [path fill];
//    
//}
//
//-(void) handleTap:(UITapGestureRecognizer *)tapGesture
//{
//    [self setNeedsDisplay];
//    self.traingeColor = [UIColor colorWithRed: arc4random_uniform(256)/255.0 green: arc4random_uniform(256)/255.0 blue:(256)/255.0 alpha: 1.0];
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint point = [[touches anyObject] locationInView:self];
    [self.path moveToPoint:point];
    
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self setNeedsDisplay];
    CGPoint point = [[touches anyObject] locationInView:self];
    self.finalPoint = point;
    
    
    
    
}
@end
