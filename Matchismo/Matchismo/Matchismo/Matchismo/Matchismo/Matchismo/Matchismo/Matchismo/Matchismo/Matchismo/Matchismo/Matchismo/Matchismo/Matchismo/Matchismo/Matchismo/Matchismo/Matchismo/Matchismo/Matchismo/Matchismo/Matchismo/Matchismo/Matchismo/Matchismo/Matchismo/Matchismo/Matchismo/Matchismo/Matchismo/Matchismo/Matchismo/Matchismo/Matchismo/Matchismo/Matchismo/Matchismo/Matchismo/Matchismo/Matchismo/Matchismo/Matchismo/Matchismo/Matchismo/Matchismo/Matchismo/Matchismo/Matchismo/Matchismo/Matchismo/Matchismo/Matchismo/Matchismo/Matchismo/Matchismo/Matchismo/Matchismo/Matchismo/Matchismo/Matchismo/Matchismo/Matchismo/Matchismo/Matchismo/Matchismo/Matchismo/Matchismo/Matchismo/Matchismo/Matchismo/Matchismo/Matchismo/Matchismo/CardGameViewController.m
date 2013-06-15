//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Mads Bielefeldt on 27/05/13.
//  Copyright (c) 2013 GN Resound. All rights reserved.
//

#import "CardGameViewController.h"
#import "CardMatchingGame.h"
#import "GameResult.h"

@interface CardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) GameResult *gameResult;
@property (weak, nonatomic) IBOutlet UICollectionView *cardCollectionView;

@end

@implementation CardGameViewController

- (CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:self.startingCardCount
                                                          usingDeck:[self createDeck]];
    return _game;
}
                         
- (Deck *)createDeck
{
    return nil; // abstract
}

//- (void)setCardButtons:(NSArray *)cardButtons
//{
//    _cardButtons = cardButtons;
//    [self updateUI];
//}

- (void)updateUI
{
//    for (UIButton *cardButton in [self cardButtons]) {
//        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
//        [cardButton setTitle:card.contents forState:UIControlStateSelected];
//        [cardButton setTitle:card.contents forState:UIControlStateSelected | UIControlStateDisabled];
//
//        cardButton.selected = card.isFaceUp;
//        cardButton.enabled = !card.isUnplayable;
//        cardButton.alpha = card.isUnplayable ? 0.3 : 1.0;
//    }
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}

- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)flipCard:(UIButton *)sender
{
//    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipCount++;
    [self updateUI];
    self.gameResult.score = self.game.score;
}

- (IBAction)deal
{
    self.game = nil;
    self.gameResult = nil;
    self.flipCount = 0;
    [self updateUI];
}

- (GameResult *)gameResult
{
    if (!_gameResult) _gameResult = [[GameResult alloc] init];
    return _gameResult;
}

@end
