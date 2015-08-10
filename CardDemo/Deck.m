//
//  Deck.m
//  CardDemo
//
//  Created by 王鹏 on 7/29/15.
//  Copyright (c) 2015 dianping.com. All rights reserved.
//

#import "Deck.h"

@interface Deck ()
@property (nonatomic, strong) NSMutableArray *cards;
@end

@implementation Deck

- (NSMutableArray *)cards {
    if(!_cards) _cards = [[NSMutableArray alloc] init];//这样保证每次调用self.cards的时候先判断cards是否为空，在这里进行初始化另一种说法叫做惰性实例化，就是在用到的时候再初始化，不必提前初始化即不必提前在init中初始化
    return _cards;
}

- (void)addCard:(Card *)card atTop:(BOOL)atTop {
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    }else {
        [self.cards addObject:card];
    }
}

- (void)addCard:(Card *)card {
    [self addCard:card atTop:NO];
}

- (Card *)drawRandomCard {
    Card *randomCard = nil;
    if ([self.cards count]) {//保证数组不为空
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObject:randomCard];
    }
    return randomCard;
}

@end
