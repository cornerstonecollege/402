//
//  DetalViewController.m
//  SaveData
//
//  Created by Digby Andrews on 2016-07-18.
//  Copyright © 2016 Digby Andrews. All rights reserved.
//

#import "DetalViewController.h"

@interface DetalViewController ()
@property (weak, nonatomic) IBOutlet UILabel *LblName;
@property (weak, nonatomic) IBOutlet UILabel *LblAge;
@property (weak, nonatomic) IBOutlet UILabel *LblEmail;
@property (weak, nonatomic) IBOutlet UILabel *LblId;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation DetalViewController

static NSDictionary *person = nil;

+ (void)setPerson:(NSDictionary *)p;
{
    person = p;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (person)
    {
        self.LblName.text = person[@"name"];
        self.LblId.text = person[@"id"];
        self.LblEmail.text = person[@"email"];
        self.LblAge.text = person[@"age"];
        self.imgView.image = [UIImage imageWithData:person[@"image"]];
    }
}

@end
