//
//  Singelton.m
//  TableTest
//
//  Created by Jian.Zhao on 14-1-22.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

#import "Singelton.h"

@implementation Singelton


-(id)init{

    if (self = [super init]) {
        //
    }
    return self;
}

+(Singelton *)getInstance{
    static Singelton *_singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _singleton = [[Singelton  alloc] init];
    });
    return _singleton;
}

@end
