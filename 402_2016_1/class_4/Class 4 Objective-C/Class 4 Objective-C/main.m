//
//  main.m
//  Class 4 Objective-C
//
//  Created by CICCC1 on 2016-06-16.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        NSArray *array1 = @[@"Luiz", @"Ibo", @"Manuel"];
        NSMutableArray *array2 = [NSMutableArray arrayWithArray:array1];
        [array2 addObject:@"Dennis"];
        [array2 addObject:@"Digby"];
        
        NSLog(@"%@", array1);
        NSLog(@"%@", array2);
    }
    return 0;
}
