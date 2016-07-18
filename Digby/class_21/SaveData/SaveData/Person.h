//
//  Person.h
//  SaveData
//
//  Created by Digby Andrews on 2016-07-18.
//  Copyright © 2016 Digby Andrews. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Person : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *identity;
@property (nonatomic, copy) NSString *email;
@property (nonatomic) NSInteger age;
@property (nonatomic) UIImage *photoID;

@end
