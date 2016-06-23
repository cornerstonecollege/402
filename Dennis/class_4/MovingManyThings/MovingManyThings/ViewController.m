//
//  ViewController.m
//  MovingManyThings
//
//  Created by Dennis Pham on 2016-06-16.
//  Copyright © 2016 Dennis Pham. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//@property (nonatomic) UILabel *oneLabel;
@property (nonatomic) UILabel *twoLabel;
//@property (nonatomic) UILabel *threeLabel;
@property(nonatomic)NSMutableArray *labelArray;
@property (nonatomic) UILabel *selectedLabel;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    int positionXOne = arc4random_uniform(self.view.frame.size.width);
//    int positionYOne = arc4random_uniform(self.view.frame.size.height);
//    

//
//    int positionXThree = arc4random_uniform(self.view.frame.size.width);
//    int positionYThree = arc4random_uniform(self.view.frame.size.height);
//    
//    self.oneLabel = [[UILabel alloc]initWithFrame:CGRectMake(positionYOne, positionXOne, 50, 50)];
//    self.oneLabel.text = @"one number";
//    [self.oneLabel sizeToFit];
////    self.oneLabel.center = self.view.center;
//    self.oneLabel.backgroundColor = [UIColor redColor];
//    
//    [self.view addSubview:self.oneLabel];
//    
//    
//    self.twoLabel = [[UILabel alloc]initWithFrame:CGRectMake(positionYTwo, positionXTwo, 50, 50)];
//    self.twoLabel.text = @"two number";
//    [self.twoLabel sizeToFit];
//    self.twoLabel.backgroundColor = [UIColor greenColor];
//    
//    [self.view addSubview:self.twoLabel];
//    
//    self.threeLabel = [[UILabel alloc]initWithFrame:CGRectMake(positionYThree, positionXThree, 50, 50)];
//    self.threeLabel.text = @"three number";
//    [self.threeLabel sizeToFit];
//    self.threeLabel.backgroundColor = [UIColor blueColor];
//    
//    [self.view addSubview:self.threeLabel];
    
    self.labelArray = [NSMutableArray array];
    
    int randomLabel = arc4random_uniform(1000000)+999999;
    for (int i = 0 ; i<=randomLabel ; i++)
    {
//        CGFloat red = ( arc4random() % 256 / 256.0 );
//        CGFloat green = ( arc4random() % 256 / 256.0 );
//        CGFloat blue = ( arc4random() % 256 / 256.0 );
        UIColor *color = [UIColor colorWithRed:(arc4random() % 256 / 255.0) green: (arc4random() % 256 / 255.0) blue:(arc4random() % 256 / 255.0) alpha:1];
        
        self.twoLabel = [[UILabel alloc]init];
        
        self.twoLabel.text = [NSString stringWithFormat:@"Label %i", i];
        [self.twoLabel sizeToFit];
        int positionXTwo = arc4random_uniform(self.view.frame.size.width+_twoLabel.frame.size.width)- _twoLabel.frame.size.width /2;
        int positionYTwo = arc4random_uniform(self.view.frame.size.height+_twoLabel.frame.size.height)- _twoLabel.frame.size.height /2;
        self.twoLabel.center= CGPointMake(positionXTwo, positionYTwo);

        self.twoLabel.backgroundColor = color;
        
        [self.view addSubview:self.twoLabel];
        [self.labelArray addObject:_twoLabel];

        
    }
//    [self.labelArray addObject:_oneLabel];
//    [self.labelArray addObject:_twoLabel];
//    [self.labelArray addObject:_threeLabel];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    for (UILabel *label in self.labelArray)
    {
        if((CGRectContainsPoint(label.frame, location)))
        {
            self.selectedLabel = label;
            break;
        }
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.selectedLabel.center = [touch locationInView:self.view];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.selectedLabel = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
