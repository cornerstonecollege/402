//
//  Person.m
//  SavingWithNSCoding
//
//  Created by CICCC1 on 2016-07-19.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.ID forKey:@"ID"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    NSString *name = [aDecoder decodeObjectForKey:@"name"];
    NSString *ID = [aDecoder decodeObjectForKey:@"ID"];
    
    self = [[Person alloc] initWithID:ID name:name];
    return self;
}

- (instancetype)initWithID:(NSString *)ID name:(NSString *)name
{
    self = [super init];
    if (self)
    {
        _name = name;
        _ID = ID;
    }
    
    return self;
}

@end
