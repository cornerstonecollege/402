//
//  ViewController.m
//  SaveStuff
//
//  Created by CICCC1 on 2016-07-18.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *txtId;
@property (weak, nonatomic) IBOutlet UITextField *txtAge;
@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (nonatomic) NSMutableArray *peopleArr;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.peopleArr = [NSMutableArray array];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger nPeople = [userDefaults integerForKey:@"nPeople"];
    for (int i = 0; i < nPeople; i++)
    {
        NSString *idx = [NSString stringWithFormat:@"%d", i];
        NSDictionary *p = [userDefaults objectForKey:idx];
        [self.peopleArr addObject:p];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }
    
    cell.textLabel.text = self.peopleArr[indexPath.row][@"name"];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.peopleArr count];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [DetailViewController setPerson:self.peopleArr[indexPath.row]];
    return indexPath;
}

- (IBAction)takePicture:(id)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self.navigationController presentViewController:picker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    self.imgView.image = info[UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)addPerson:(id)sender
{
    if (![self.txtId.text isEqualToString:@""] && ![self.txtName.text isEqualToString:@""])
    {
        NSMutableDictionary *person = [NSMutableDictionary dictionary];
        [person setObject:self.txtName.text forKey:@"name"];
        [person setObject:self.txtId.text forKey:@"identity"];
        [person setObject:self.txtEmail.text forKey:@"email"];
        [person setObject:self.txtAge.text forKey:@"age"];
        if (self.imgView.image)
        {
            NSData *data = [NSData dataWithData:UIImageJPEGRepresentation(self.imgView.image, 1.0)];
            [person setObject:data forKey:@"image"];
        }
        
        [self.peopleArr addObject:person];
        [self.tableView reloadData];
        
        // saving
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSString *idx = [NSString stringWithFormat:@"%lu", self.peopleArr.count - 1];
        [userDefaults setObject:person forKey:idx];
        [userDefaults setInteger:self.peopleArr.count forKey:@"nPeople"];
    }
}


@end
