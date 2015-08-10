//
//  MatchCardGame.h
//  CardDemo
//
//  Created by 王鹏 on 8/4/15.
//  Copyright (c) 2015 dianping.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface MatchCardGame : NSObject
@property (nonatomic, readonly) NSInteger score;

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;
- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@end
