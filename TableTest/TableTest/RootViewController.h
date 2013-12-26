//
//  RootViewController.h
//  TableTest
//
//  Created by 艺龙员工 on 13-12-20.
//  Copyright (c) 2013年 艺龙员工. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{

    UITableView *table_left;
    UITableView *table_right;
    
}

@property (nonatomic,strong) NSMutableArray *leftArrays;
@property (nonatomic,strong) NSMutableDictionary *rightDic;

@end
