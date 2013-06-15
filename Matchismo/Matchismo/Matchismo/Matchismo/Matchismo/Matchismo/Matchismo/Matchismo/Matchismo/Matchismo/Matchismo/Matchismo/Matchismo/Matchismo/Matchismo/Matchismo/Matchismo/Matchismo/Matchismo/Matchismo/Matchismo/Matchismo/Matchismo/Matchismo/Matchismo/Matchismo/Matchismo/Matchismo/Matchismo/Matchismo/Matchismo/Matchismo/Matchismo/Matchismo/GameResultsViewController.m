//
//  GameResultsViewController.m
//  Matchismo
//
//  Created by Mads Bielefeldt on 27/05/13.
//  Copyright (c) 2013 GN Resound. All rights reserved.
//

#import "GameResultsViewController.h"
#import "GameResult.h"

@interface GameResultsViewController ()

@property (weak, nonatomic) IBOutlet UITextView *display;

@end

@implementation GameResultsViewController

- (void)setup
{
    // initialisation that can't wait until viewDidLoad
}

- (void)awakeFromNib
{
    [self setup];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    [self setup];
    return self;
}

- (void)updateUI
{
    NSString *displayText = @"";
    
    for (GameResult *result in [GameResult allGameResults]) {
        displayText = [displayText stringByAppendingFormat:@"Score: %d (%@, %0g\n", result.score, result.end, round(result.duration)];
    }
    
    self.display.text = displayText;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
