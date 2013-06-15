//
//  PlayingCardGameViewController.m
//  Matchismo
//
//  Created by Mads Bielefeldt on 30/05/13.
//  Copyright (c) 2013 GN Resound. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "PlayingCardCollectionViewCell.h"

@implementation PlayingCardGameViewController

- (NSUInteger) startingCardCount
{
    return 12;
}

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

- (void)updateCell:(UICollectionViewCell *)cell usingCard:(Card *)card animate:(BOOL)animate
{
    if ([cell isKindOfClass:[PlayingCardCollectionViewCell class]]) {
        PlayingCardView *playingCardView = ((PlayingCardCollectionViewCell *)cell).playingCardView;
        
        if ([card isKindOfClass:[PlayingCard class]]) {
            PlayingCard *playingCard = (PlayingCard *)card;
            
            playingCardView.rank = playingCard.rank;
            playingCardView.suit = playingCard.suit;
            playingCardView.alpha = playingCard.isUnplayable ? 0.3 : 1.0;

            if (playingCardView.faceUp != playingCard.isFaceUp) {
                if (animate)
                {
                    [UIView transitionWithView:playingCardView
                                      duration:0.5
                                       options:UIViewAnimationOptionTransitionFlipFromLeft
                                    animations:^{
                                        playingCardView.faceUp = playingCard.isFaceUp;
                                    }
                                    completion:nil];
                }
                else
                {
                    playingCardView.faceUp = playingCard.isFaceUp;
                }
            }
        }
    }
}

@end
