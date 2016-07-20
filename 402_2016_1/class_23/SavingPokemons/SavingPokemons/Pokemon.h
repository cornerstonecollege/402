//
//  Pokemon.h
//  SavingPokemons
//
//  Created by CICCC1 on 2016-07-20.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pokemon : NSObject <NSCoding>

@property (nonatomic, readonly) NSNumber *number;
@property (nonatomic, readonly) NSString *name;

- (instancetype) initWithNumber:(NSNumber *)number andName:(NSString *)name;

@end
