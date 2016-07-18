//
//  DetailViewController.m
//  SaveStuff
//
//  Created by CICCC1 on 2016-07-18.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblEmail;
@property (weak, nonatomic) IBOutlet UILabel *lblId;
@property (weak, nonatomic) IBOutlet UILabel *lblAge;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation DetailViewController

static NSDictionary *person = nil;

+ (void)setPerson:(NSDictionary *)p
{
    person = p;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (person)
    {
        self.lblName.text = person[@"name"];
        self.lblId.text = person[@"Id"];
        self.lblAge.text = person[@"Age"];
        self.lblEmail.text = person[@"Email"];
        self.imgView.image = [UIImage imageWithData:person[@"image"]];
    }
}

@end
