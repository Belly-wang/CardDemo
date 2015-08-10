//
//  NSString+Integer.m
//  CardDemo
//
//  Created by 王鹏 on 8/5/15.
//  Copyright (c) 2015 dianping.com. All rights reserved.
//

#import "NSString+Integer.h"

@implementation NSString (Integer)

+ (NSString *)stringWithInt:(NSInteger)integer {
    return [NSString stringWithFormat:@"%@", @(integer)];
}

@end
