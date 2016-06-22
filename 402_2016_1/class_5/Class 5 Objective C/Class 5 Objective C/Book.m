//
//  Book.m
//  Class 5 Objective C
//
//  Created by CICCC1 on 2016-06-17.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "Book.h"

@interface Book ()

@property (nonatomic) NSInteger currentPage;

@end

@implementation Book

+ (instancetype)book
{
    Book *book = [[Book alloc] init];
    return book;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.currentPage = 1;
    }
    
    return self;
}

- (void)readPage:(NSInteger)pageNumber
{
    if (self.nPages >= pageNumber)
    {
        self.currentPage = pageNumber;
        NSLog(@"We changed to page %ld", pageNumber);
    }
    else
    {
        NSLog(@"Impossible! The book is only %ld pages long", self.nPages);
    }
}

@end
