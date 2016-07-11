//
//  TableViewController.h
//  SplitViewController
//
//  Created by CICCC1 on 2016-07-04.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UIViewController

+ (NSDictionary *) getPokedexInfo;
+ (NSNumber *) getOrSetCurrentIndex:(NSNumber *)idx;

@end
