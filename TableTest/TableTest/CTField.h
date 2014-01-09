//
//  CTField.h
//  TableTest
//
//  Created by Janven Zhao on 14-1-5.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    
    CT_Setting_edit = 0,
    CT_PackingLib_edit
}CT_Type;


@interface CTField : UITextField{

    CT_Type _type;
}
@property (nonatomic,assign) CT_Type type;

- (id)initWithFrame:(CGRect)frame andType:(CT_Type)aType;

@end
