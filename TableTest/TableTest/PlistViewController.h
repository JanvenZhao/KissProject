//
//  PlistViewController.h
//  TableTest
//
//  Created by 艺龙员工 on 13-12-28.
//  Copyright (c) 2013年 艺龙员工. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlistViewController : UIViewController{

    UIAlertView *alert;
    
}

@property (nonatomic,retain) NSMutableDictionary *origin_Dic;
@property (nonatomic,retain) NSMutableArray *myPackingList;

@end
