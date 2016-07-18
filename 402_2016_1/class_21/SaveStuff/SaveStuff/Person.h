//
//  Person.h
//  SaveStuff
//
//  Created by CICCC1 on 2016-07-18.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Person : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *identity;
@property (nonatomic, copy) NSString *email;
@property (nonatomic) NSInteger age;
@property (nonatomic) UIImage *photoId;

@end
