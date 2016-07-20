//
//  PokedexHelper.h
//  SavingPokemons
//
//  Created by CICCC1 on 2016-07-20.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pokemon.h"

@interface PokedexHelper : NSObject <UITableViewDelegate, UITableViewDataSource>

+ (instancetype) sharedInstance;

- (void) addPokemon:(Pokemon *)pokemon;
- (void) saveChanges;

@end
