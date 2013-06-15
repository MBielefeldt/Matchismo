//
//  CardGameViewController.h
//  Matchismo
//
//  Created by Mads Bielefeldt on 27/05/13.
//  Copyright (c) 2013 GN Resound. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Deck.h"

@interface CardGameViewController : UIViewController

- (Deck *)createDeck; // abstract

@property (nonatomic) NSUInteger startingCardCount; // abstract

@end
