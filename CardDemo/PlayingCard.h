//
//  PlayingCard.h
//  CardDemo
//
//  Created by 王鹏 on 7/29/15.
//  Copyright (c) 2015 dianping.com. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (nonatomic, strong) NSString *suit;
@property (nonatomic) NSUInteger rank;//与unsigned int 类似，但是NSUinteger是typdef的。

+ (NSArray *)validSuits;
+ (NSArray *)rankStrings;
+ (NSUInteger)maxRank;
@end
