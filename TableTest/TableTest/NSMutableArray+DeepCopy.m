//
//  NSMutableArray+DeepCopy.m
//  TableTest
//
//  Created by Janven Zhao on 14-1-6.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

#import "NSMutableArray+DeepCopy.h"

@implementation NSMutableArray (DeepCopy)

-(NSMutableArray *)deepMutableCopy{

    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:[self count]];
    for (id value in self) {
        id copyValue;
        if ([value respondsToSelector:@selector(deepMutableCopy)]) {
            copyValue = [value deepMutableCopy];
        }else if ([value respondsToSelector:@selector(mutableCopy)]){
            copyValue = [value mutableCopy];
        }else if ([value respondsToSelector:@selector(copy)]){
            copyValue = [value copy];
        }
        [array addObject:copyValue];
    }
    return array;
}

@end
