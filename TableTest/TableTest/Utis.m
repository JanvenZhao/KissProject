//
//  Utis.m
//  TableTest
//
//  Created by Jian.Zhao on 14-3-4.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

#import "Utis.h"

@implementation Utis

+(BOOL)simpleTestOfString:(id)object{

    if (object && [object isKindOfClass:[NSString class]]) {
        return YES;
    }
    return NO;
}

@end
