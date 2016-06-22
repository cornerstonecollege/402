//
//  main.m
//  Class 5 Objective C
//
//  Created by CICCC1 on 2016-06-17.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        NSDictionary *dictionary = @{
                                     @"house" : @"a building in which people live; residence for human beings.",
                                     @"car" : @"an automobile.",
                                     @3 : @"Blah"
                                     };
        
        NSLog(@"Value 1 is %@ Value 2 is %@ Value 3 is %@", dictionary[@"house"], dictionary[@"car"], dictionary[@3]);
        
        Book *myBook = [Book book];
        myBook.nPages = 300;
        [myBook readPage:200];
        [myBook readPage:500];
        
    }
    return 0;
}
