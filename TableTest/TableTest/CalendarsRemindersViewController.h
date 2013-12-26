//
//  CalendarsRemindersViewController.h
//  TableTest
//
//  Created by 艺龙员工 on 13-12-21.
//  Copyright (c) 2013年 艺龙员工. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalendarsRemindersViewController : UIViewController<UISearchBarDelegate,UISearchDisplayDelegate,UITableViewDataSource,UITableViewDelegate>{

    NSMutableArray *_dataSource;//默认
    NSMutableArray *_searchArray;
    
    UITableView *defaultTable;
    UISearchBar *_searchBar;
    UISearchDisplayController *dispalyController;
}
@property (nonatomic,retain)    NSMutableArray *dataSource;
@property (nonatomic,retain)    NSMutableArray *searchArray;

@end
