//
//  PlayingCardCollectionViewCell.h
//  Matchismo
//
//  Created by Mads Bielefeldt on 30/05/13.
//  Copyright (c) 2013 GN Resound. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayingCardView.h"

@interface PlayingCardCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet PlayingCardView *playingCardView;

@end
