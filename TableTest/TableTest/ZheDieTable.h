//
//  ZheDieTable.h
//  TableTest
//
//  Created by Janven Zhao on 14-1-1.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZheDieTable : UITableViewController{

    NSDictionary *_dataSource;
    NSMutableDictionary *isOpen;
}

@property (nonatomic,retain) NSDictionary *dataSource;

@end
