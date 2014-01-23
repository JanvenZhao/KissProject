//
//  DrawCircle.h
//  TableTest
//
//  Created by Jian.Zhao on 14-1-23.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawCircle : UIView

@property (nonatomic) float minimumValue;
@property (nonatomic) float maximumValue;
@property (nonatomic) float currentValue;
@property (nonatomic) int lineWidth;

@property (nonatomic,strong) UIColor *unfilledColor;
@property (nonatomic,strong) UIColor *filledColor;


-(void)setTheProgressWithGivenValue:(float)value;

@end
