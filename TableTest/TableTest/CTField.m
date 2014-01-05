//
//  CTField.m
//  TableTest
//
//  Created by Janven Zhao on 14-1-5.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

#import "CTField.h"

@implementation CTField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

//控制清楚按钮的位置
//-(CGRect)clearButtonRectForBounds:(CGRect)bounds{
//
//     return CGRectMake(bounds.origin.x + bounds.size.width - 20, bounds.origin.y + bounds.size.height -20, 16, 16);
//    
//}
//
//控制placeHolder的位置
-(CGRect)placeholderRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x+100, bounds.origin.y+10, bounds.size.width -100, bounds.size.height-10);//更好理解些
    return inset;
}
//控制显示文本的位置
-(CGRect)textRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x+40, bounds.origin.y+10, bounds.size.width -40, bounds.size.height-10);//更好理解些
    return inset;
    
}
//控制编辑文本的位置
-(CGRect)editingRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x +40, bounds.origin.y+10, bounds.size.width -40, bounds.size.height-10);
    return inset;
}
//控制左视图位置
- (CGRect)leftViewRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x +10, bounds.origin.y+9, 23,23.5);
    return inset;
}

//控制placeHolder的颜色、字体
- (void)drawPlaceholderInRect:(CGRect)rect
{
    [[UIColor blueColor] setFill];
    
    [[self placeholder] drawInRect:rect withFont: [UIFont systemFontOfSize:20]];
}


@end
