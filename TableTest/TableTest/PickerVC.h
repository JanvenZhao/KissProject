//
//  PickerVC.h
//  TableTest
//
//  Created by Jian.Zhao on 14-3-7.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickerVC : UIViewController<UIActionSheetDelegate,UITableViewDataSource,UITableViewDelegate>{
    
    UITableView *_tableView;
}

@end
