//
//  PersonArchiverHelper.h
//  SavingWithNSCoding
//
//  Created by CICCC1 on 2016-07-19.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface PersonArchiverHelper : NSObject <UITableViewDelegate, UITableViewDataSource>

+ (instancetype) sharedObject;

- (void) addPerson:(Person *)thePerson;
- (void) saveChanges;

@end
