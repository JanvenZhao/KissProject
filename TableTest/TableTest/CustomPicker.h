//
//  CustomPicker.h
//  TableTest
//
//  Created by Jian.Zhao on 14-3-12.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PickerDelegate <NSObject>

-(void)dismissTheActionSheet;
-(void)doneTheActionWithResult:(NSString *)string;

@end


@interface CustomPicker : UIView<UIPickerViewDelegate,UIPickerViewDataSource>
{

    NSMutableArray * _date;
    NSMutableArray * _hours;
    NSMutableArray * _mins;
 
    id<PickerDelegate>_delegate;
}

- (id)initWithFrame:(CGRect)frame Delegate:(id)aDelegate;

@end
