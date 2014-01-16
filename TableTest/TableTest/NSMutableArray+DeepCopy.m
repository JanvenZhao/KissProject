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
        id copyValue = nil;
        if ([value respondsToSelector:@selector(deepMutableCopy)]) {
            NSLog(@"value retainCont is %d",[value retainCount]);
            copyValue = [value deepMutableCopy];
            NSLog(@"value retainCont is %d",[value retainCount]);
            NSLog(@"copyValue retainCont is %d",[copyValue retainCount]);

            [array addObject:copyValue];
            NSLog(@"copyValue retainCont is %d",[copyValue retainCount]);

            [copyValue release];
            NSLog(@"copyValue retainCont is %d",[copyValue retainCount]);

            
        }else if ([value respondsToSelector:@selector(mutableCopy)]){
            
            copyValue = [value mutableCopy];
            [array addObject:copyValue];
            [copyValue release];
        }
        if (copyValue == nil) {
            copyValue = [value copy];
            
            [array addObject:copyValue];
            [copyValue release];
        }

    }
    return array;
}

@end
