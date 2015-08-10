//
//  Card.m
//  CardDemo
//
//  Created by 王鹏 on 7/29/15.
//  Copyright (c) 2015 dianping.com. All rights reserved.
//

#import "Card.h"

@interface Card ()

@end

@implementation Card

/**
 *  cards is designed for array of matched cards
 *
 *  @param cards
 *
 *  @return 1 stands for match successful and 0 for failure
 */
- (int)match:(NSArray *)cards {
    int score = 0;
    for(Card *card in cards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    return score;
}
@end
