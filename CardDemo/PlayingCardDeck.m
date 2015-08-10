//
//  PlayingCardDeck.m
//  CardDemo
//
//  Created by 王鹏 on 7/29/15.
//  Copyright (c) 2015 dianping.com. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"
@implementation PlayingCardDeck

- (instancetype)init {
    self = [super init];
    if (self) {
        for(NSString *suit in [PlayingCard validSuits]) {
            for (int rank = 1; rank <= [PlayingCard maxRank]; rank ++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.suit = suit;
                card.rank = rank;
                [self addCard:card];
            }
        }
    }
    return self;
}
@end
