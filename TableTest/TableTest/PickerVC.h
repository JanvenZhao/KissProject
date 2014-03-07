//
//  PickerVC.h
//  TableTest
//
//  Created by Jian.Zhao on 14-3-7.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {

    CustomPicker_Default,//默认
    CustomPicker_One,

}CustomPickerType;



@interface PickerVC : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>{

    UIPickerView *_picker;
    
    NSMutableArray * _date;
    NSMutableArray * _hours;
    NSMutableArray * _mins;
}

@end
