//
//  ViewController.m
//  Exploring2
//
//  Created by Digby Andrews on 2016-06-13.
//  Copyright © 2016 Digby Andrews. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *calcAreaLable;
@property (nonatomic) double currentValue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)BtnClicked:(UIButton *)sender
{
    double sumValue;
    char op;
    double lastValue;
    char lastOp;
    
    /*if ([sender.titleLabel.text characterAtIndex:0] == ) {
        <#statements#>
    }*/
    
    
    
    
    
    
    self.currentValue = [self.calcAreaLable.text doubleValue];
    
    
    
    switch ([sender.titleLabel.text characterAtIndex:0]) {
        case '0':
            self.calcAreaLable.text = [NSString stringWithFormat:@"%@", sender.titleLabel.text];
            break;
        case '1':
            self.calcAreaLable.text = [NSString stringWithFormat:@"%@", sender.titleLabel.text];
            break;
        case '2':
            self.calcAreaLable.text = [NSString stringWithFormat:@"%@", sender.titleLabel.text];
            break;
        case '3':
            self.calcAreaLable.text = [NSString stringWithFormat:@"%@", sender.titleLabel.text];
            break;
        case '4':
            self.calcAreaLable.text = [NSString stringWithFormat:@"%@", sender.titleLabel.text];
            break;
        case '5':
            self.calcAreaLable.text = [NSString stringWithFormat:@"%@", sender.titleLabel.text];
            break;
        case '6':
            self.calcAreaLable.text = [NSString stringWithFormat:@"%@", sender.titleLabel.text];
            break;
        case '7':
            self.calcAreaLable.text = [NSString stringWithFormat:@"%@", sender.titleLabel.text];
            break;
        case '8':
            self.calcAreaLable.text = [NSString stringWithFormat:@"%@", sender.titleLabel.text];
            break;
        case '9':
            self.calcAreaLable.text = [NSString stringWithFormat:@"%@", sender.titleLabel.text];
            break;
        case '-':
            self.calcAreaLable.text = [NSString stringWithFormat:@"%@", sender.titleLabel.text];
            break;
        case '+':
            self.calcAreaLable.text = [NSString stringWithFormat:@"%@", sender.titleLabel.text];
            break;
        case '/':
            self.calcAreaLable.text = [NSString stringWithFormat:@"%@", sender.titleLabel.text];
            break;
        case 'x':
            self.calcAreaLable.text = [NSString stringWithFormat:@"%@", sender.titleLabel.text];
            break;
        case '.':
            self.calcAreaLable.text = [NSString stringWithFormat:@"%@", sender.titleLabel.text];
            break;
        case '=':
            self.calcAreaLable.text = [NSString stringWithFormat:@"%@", sender.titleLabel.text];
            break;
            
        default:
            break;
    }
}


@end
