//
//  PersonArchiverHelper.m
//  SavingWithNSCoding
//
//  Created by CICCC1 on 2016-07-19.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "PersonArchiverHelper.h"

@interface PersonArchiverHelper ()

@property (nonatomic) NSMutableArray<Person *> *peopleArr;

@end

@implementation PersonArchiverHelper

+ (instancetype)sharedObject
{
    static PersonArchiverHelper *instance;
    
    if (!instance)
    {
        instance = [[PersonArchiverHelper alloc] init];
    }
    
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _peopleArr = [NSKeyedUnarchiver unarchiveObjectWithFile:[self path]];
        
        if (!_peopleArr)
        {
            _peopleArr = [NSMutableArray array];
        }
    }
    
    return self;
}

- (void)addPerson:(Person *)thePerson
{
    [self.peopleArr addObject:thePerson];
}

- (void)saveChanges
{
    [NSKeyedArchiver archiveRootObject:self.peopleArr toFile:[self path]];
}

- (NSString *) path
{
    NSArray *directories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDirectory = [directories firstObject];
    NSString *filepath = [docDirectory stringByAppendingPathComponent:@"people.archiver"];
    return filepath;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }
    
    cell.textLabel.text = self.peopleArr[indexPath.row].name;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.peopleArr.count;
}

@end
