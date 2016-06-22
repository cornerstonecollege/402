//
//  Book.h
//  Class 5 Objective C
//
//  Created by CICCC1 on 2016-06-17.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject

@property (nonatomic) NSInteger nPages;
@property (nonatomic) NSString *nameAuthor;

+ (instancetype) book;

- (void) readPage:(NSInteger)pageNumber;

@end