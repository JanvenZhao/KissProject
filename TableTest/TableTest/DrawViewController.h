//
//  DrawViewController.h
//  TableTest
//
//  Created by Jian.Zhao on 14-1-23.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DrawCircle;
@interface DrawViewController : UIViewController{

    DrawCircle *circle;
    NSTimer *_timer;
}

@end
