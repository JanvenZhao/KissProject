//
//  GaoDePoint.m
//  TableTest
//
//  Created by Jian.Zhao on 14-1-24.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

#import "GaoDePoint.h"

@implementation GaoDePoint

-(id)init{

    if (self = [super init]) {
        //
    }
    return self;
}
- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate{

    _coordinate = newCoordinate;
    
}


@end
