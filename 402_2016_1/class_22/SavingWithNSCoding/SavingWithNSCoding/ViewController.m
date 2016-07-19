//
//  ViewController.m
//  SavingWithNSCoding
//
//  Created by CICCC1 on 2016-07-19.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "PersonArchiverHelper.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *txtID;
@property (weak, nonatomic) IBOutlet UITextField *txtName;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.delegate = [PersonArchiverHelper sharedObject];
    self.tableView.dataSource = [PersonArchiverHelper sharedObject];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)addPersonClicked:(id)sender
{
    Person *p = [[Person alloc] initWithID:self.txtID.text name:self.txtName.text];
    [[PersonArchiverHelper sharedObject] addPerson:p];
    [self.tableView reloadData];
}

@end
