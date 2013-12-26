//
//  CalendarsRemindersViewController.m
//  TableTest
//
//  Created by 艺龙员工 on 13-12-21.
//  Copyright (c) 2013年 艺龙员工. All rights reserved.
//

#import "CalendarsRemindersViewController.h"
#import "pinyin.h"
@interface CalendarsRemindersViewController ()

@end

@implementation CalendarsRemindersViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self initData];
    }
    return self;
}

-(void)initData{

    _dataSource = [[NSMutableArray alloc] initWithObjects:@"中国",@"韩国",@"泰国",@"台湾",@"新加坡",@"香港",@"马拉西亚",@"菲律宾",@"美国",@"日本",@"澳门",@"越南",@"英国",@"欧盟",@"澳大利亚",@"加拿大",@"印度",@"俄罗斯",nil];
    _searchArray = [[NSMutableArray alloc] init];
}


-(BOOL)searchResult:(NSString *)contactName searchText:(NSString *)searchT
{
	//NSLog(@"contactName = %@", contactName);
	//NSLog(@"searchT = %@", searchT);
	NSComparisonResult result = [contactName compare:searchT options:NSCaseInsensitiveSearch
                                               range:NSMakeRange(0, searchT.length)];
    
	if (result == NSOrderedSame)
	{
        NSLog(@" Receive");
		return YES;
	}
	else
	{
		return NO;
	}
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //Do someThing Special
    
    CGRect frame = CGRectMake(0,0, 320, [UIScreen mainScreen].bounds.size.height);
    defaultTable = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    defaultTable.delegate = self;
    defaultTable.dataSource = self;
    [self.view addSubview:defaultTable];
    
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [_searchBar setBarStyle:UIBarStyleDefault];
    _searchBar.showsCancelButton = YES;
    _searchBar.placeholder =  @"国家或货币的关键字";
    _searchBar.delegate = self;
	_searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
	_searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
    defaultTable.tableHeaderView = _searchBar;
    
    dispalyController = [[UISearchDisplayController alloc] initWithSearchBar:_searchBar contentsController:self];
    dispalyController.searchResultsDataSource = self;
    dispalyController.searchResultsDelegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (tableView == defaultTable) {
        return [self.dataSource count];
    }else{
        return [self.searchArray count];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *cellIdentifyer = @"Cell";
    UITableViewCell *cell = [tableView   dequeueReusableHeaderFooterViewWithIdentifier:cellIdentifyer];
    if (cell == Nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifyer];
    }
    if (tableView == defaultTable) {
        cell.textLabel.text = [self.dataSource objectAtIndex:indexPath.row];
    }else{
        cell.textLabel.text = [self.searchArray objectAtIndex:indexPath.row];
    }
    return cell;
}

#pragma  mark
#pragma  mark UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (tableView == defaultTable) {
        //
        NSLog(@"You Selected is %@",[self.dataSource objectAtIndex:indexPath.row]);
        
    }else{
        
        NSLog(@"You Selected is %@",[self.searchArray objectAtIndex:indexPath.row]);
        
        [dispalyController setActive:NO animated:YES];
    }
    
}

#pragma mark
#pragma mark UISearBarDelegate

-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{

    if ([self.searchArray count] != 0) {
        [self.searchArray removeAllObjects];
    }
    [dispalyController.searchResultsTableView reloadData];
    return YES;
}

// called when keyboard search button pressed

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{

    [searchBar resignFirstResponder];
    
}

#pragma mark
#pragma mark UISearDisplayControllerDelegate

// called when text changes (including clear)
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{

    NSLog(@"searchText is %@",searchText);
    
    if ([self.searchArray count] != 0) {
        [self.searchArray removeAllObjects];
    }
    
    
    for (NSString *string in self.dataSource) {
        
        //NSString *a = [NSString stringWithCString:[string UTF8String] encoding:NSUTF8StringEncoding];
        //NSLog(@"a ---  %@",a);
        
        NSString *name = @"";
		for (int i = 0; i < [string length]; i++)
		{
			if([name length] < 1)
			{
				name = [NSString stringWithFormat:@"%c",pinyinFirstLetter([string characterAtIndex:i])];
			}
			else
			{
				name = [NSString stringWithFormat:@"%@%c",name,pinyinFirstLetter([string characterAtIndex:i])];
			}
		}
        
        if ([self searchResult:name searchText:searchText]) {
            [self.searchArray addObject:string];
        }
    }
    NSLog(@"%@",self.searchArray);
    [dispalyController.searchResultsTableView reloadData];
}



@end