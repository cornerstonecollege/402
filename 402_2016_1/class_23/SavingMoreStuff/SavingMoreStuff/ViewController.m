//
//  ViewController.m
//  SavingMoreStuff
//
//  Created by CICCC1 on 2016-07-20.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *txtTypedInfo;
@property (weak, nonatomic) IBOutlet UILabel *lblSavedInfo;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *savedInfo = [userDefaults objectForKey:@"savedInfoKey"];
    if (!savedInfo)
    {
        self.lblSavedInfo.text = @"None";
    }
    else
    {
        self.lblSavedInfo.text = savedInfo;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)saveInfo:(id)sender
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:self.txtTypedInfo.text forKey:@"savedInfoKey"];
    self.lblSavedInfo.text = self.txtTypedInfo.text;
}

@end
