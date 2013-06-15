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

@property (nonatomic) NSUInteger startingCardCount; // abstract
- (Deck *)createDeck; // abstract
- (void)updateCell:(UICollectionViewCell *)cell usingCard:(Card *)card animate:(BOOL)animate; // abstract

@end
