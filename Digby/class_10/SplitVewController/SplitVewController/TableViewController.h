//
//  TableViewController.h
//  SplitVewController
//
//  Created by Digby Andrews on 2016-07-04.
//  Copyright © 2016 Digby Andrews. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UIViewController

+ (NSDictionary *) getPokedexInfo;
+ (NSNumber *) getOrSetCurrentIndex: (NSNumber *) idx;

@end
