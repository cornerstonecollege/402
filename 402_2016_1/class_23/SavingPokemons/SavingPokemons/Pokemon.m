//
//  Pokemon.m
//  SavingPokemons
//
//  Created by CICCC1 on 2016-07-20.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "Pokemon.h"

@implementation Pokemon

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"nameKey"];
    [aCoder encodeObject:self.number forKey:@"numberKey"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    NSString *name = [aDecoder decodeObjectForKey:@"nameKey"];
    NSNumber *number = [aDecoder decodeObjectForKey:@"numberKey"];
    
    self = [[Pokemon alloc] initWithNumber:number andName:name];
    return self;
}

- (instancetype)initWithNumber:(NSNumber *)number andName:(NSString *)name
{
    self = [super init];
    
    if (self)
    {
        _number = number;
        _name = name;
    }
    
    return self;
}

@end
