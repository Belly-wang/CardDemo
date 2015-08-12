//
//  ViewController.m
//  CardDemo
//
//  Created by 王鹏 on 7/29/15.
//  Copyright (c) 2015 dianping.com. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "Deck.h"
#import "MatchCardGame.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (nonatomic, strong) PlayingCardDeck *playCardDeck;
@property (nonatomic, strong) Deck *deck;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) MatchCardGame *game;

@end

@implementation ViewController

- (Deck *)deck {
    if (!_deck) {
        _deck = [self createDeck];
    }
    return _deck;
}

- (MatchCardGame *)game {
    if (!_game) {
        _game = [[MatchCardGame alloc] initWithCardCount:self.cardButtons.count usingDeck:[self createDeck]];
    }
    return _game;
}

- (Deck *)createDeck {
    return [[PlayingCardDeck alloc] init];
}

- (void)newGame {
    for (UIButton *cardButton in self.cardButtons) {
        [cardButton setTitle:@"" forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[UIImage imageNamed:@"monkey"] forState:UIControlStateNormal];
        cardButton.enabled = YES;
    }
    self.game = nil;
    self.scoreLabel.text = 0;
}

- (IBAction)playAgain:(id)sender {
    [self newGame];
}

- (IBAction)changeCard:(id)sender {
    NSUInteger index = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:index];
    [self updateUI];
}

- (void)endGame {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"游戏结束" message:@"抱歉！你的分数过低，游戏结束。请重新再来吧" delegate:self cancelButtonTitle:@"再来一次" otherButtonTitles:nil, nil];
    [alert show];
    [self newGame];
    
}

- (void)updateUI {
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger index = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:index];
        [cardButton setTitle:[self titleForCard:card]
                    forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroudImageForCard:card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score:%ld", (long)self.game.score];
    if (self.game.score < -100) [self endGame];
}

- (NSString *)titleForCard:(Card *)card {
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroudImageForCard:(Card *)card {
    return card.isChosen ? [UIImage imageNamed:@"font"] : [UIImage imageNamed:@"monkey"];
}

- (void)setCount:(NSInteger)count {
    _count = count;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %ld", (long)self.count];
}


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
