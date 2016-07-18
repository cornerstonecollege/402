//
//  ViewController.m
//  SaveData
//
//  Created by Digby Andrews on 2016-07-18.
//  Copyright © 2016 Digby Andrews. All rights reserved.
//

#import "ViewController.h"
#import "DetalViewController.h"

@interface ViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *TextName;
@property (weak, nonatomic) IBOutlet UITextField *TextEmail;
@property (weak, nonatomic) IBOutlet UITextField *TextAge;
@property (weak, nonatomic) IBOutlet UITextField *TextId;
@property (weak, nonatomic) IBOutlet UIImageView *ImgView;
@property (weak, nonatomic) IBOutlet UITableView *TableView;
@property (nonatomic) NSMutableArray *peopleArr;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.TableView.delegate = self;
    self.TableView.dataSource = self;
    self.peopleArr = [NSMutableArray array];
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSInteger nPeople = [userDefault integerForKey:@"nPeople"];
    for (int i = 0; i < nPeople; i++)
    {
         NSString *idx = [NSString stringWithFormat:@"%d",i];
        NSDictionary *p = [userDefault objectForKey:idx];
        [self.peopleArr addObject:p];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.TableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
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
    [DetalViewController setPerson:self.peopleArr[indexPath.row]];
    return indexPath;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}
- (IBAction)TakePicture:(id)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self.navigationController presentViewController:picker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    self.ImgView.contentMode = UIViewContentModeScaleAspectFit;
    self.ImgView.image = info[UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated:YES completion:NULL];
}


- (IBAction)AddPerson:(id)sender
{
    if (![self.TextId.text isEqualToString:@""] && ![self.TextName.text isEqualToString:@""])
    {
        NSMutableDictionary *person = [NSMutableDictionary dictionary];
        [person setObject:self.TextName.text forKey:@"name"];
        [person setObject:self.TextId.text forKey:@"id"];
        [person setObject:self.TextEmail.text forKey:@"email"];
        [person setObject:self.TextAge.text forKey:@"age"];
        
        if (self.ImgView.image)
        {
            NSData *data = [NSData dataWithData:UIImageJPEGRepresentation(self.ImgView.image, 1.0)];
            [person setObject:data forKey:@"image"];
        }
        
        [self.peopleArr addObject:person];
        [self.TableView reloadData];
        
        //save
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSString *idx = [NSString stringWithFormat:@"%lu",self.peopleArr.count -1];
        [userDefaults setObject:person forKey:idx];
        [userDefaults setInteger:self.peopleArr.count forKey:@"nPeople"];
        
    }
}

@end
