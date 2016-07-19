//
//  Person.h
//  SavingWithNSCoding
//
//  Created by CICCC1 on 2016-07-19.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Person : NSObject <NSCoding>

@property (nonatomic, readonly) NSString *ID;
@property (nonatomic, readonly) NSString *name;

- (instancetype) initWithID:(NSString *)ID name:(NSString *)name;
@end
