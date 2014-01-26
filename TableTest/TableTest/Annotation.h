//
//  Annotation.h
//  TableTest
//
//  Created by Jian.Zhao on 14-1-26.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Annotation : NSObject<MKAnnotation>

@property (nonatomic,copy) NSString *subTitle;

@end
