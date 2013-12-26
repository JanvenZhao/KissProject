//
//  CustomCell.h
//  TableTest
//
//  Created by 艺龙员工 on 13-12-21.
//  Copyright (c) 2013年 艺龙员工. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell<UIGestureRecognizerDelegate>{

    BOOL resetDelete;
    
    //滑动删除显示的View
    UIView *right_display;
    BOOL delete_display;//View是否呈现
    
    BOOL _textLabelScrollowed;
}

@property (nonatomic,assign) BOOL textLabelScrollowed;//是否支持滑动的时候 textlabel 偏移,默认是 YES

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier WithResetDelete:(BOOL)reset;


@end
