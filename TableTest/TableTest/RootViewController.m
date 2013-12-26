//
//  RootViewController.m
//  TableTest
//
//  Created by 艺龙员工 on 13-12-20.
//  Copyright (c) 2013年 艺龙员工. All rights reserved.
//

#import "RootViewController.h"
#import "CustomCell.h"

@interface RootViewController ()

@end

static int leftIndex = 0;//左侧选择的Index，默认选择为0

#define LEFT_TABLE_WIDTH 100
#define RIGHT_TABLE_WIDTH 220

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        _leftArrays = [NSMutableArray arrayWithObjects:@"美国",@"中国",@"俄罗斯",@"法国",nil];
        _rightDic = [NSMutableDictionary dictionaryWithCapacity:[_leftArrays count]];
        
        for (int i = 0; i<[_leftArrays count]; i++) {
            switch (i) {
                case 0:
                    [_rightDic setObject:[NSArray arrayWithObjects:@"洛杉矶",@"加利福尼亚",@"华盛顿",@"纽约", nil] forKey:@"美国"];
                    break;
                case 1:
                    [_rightDic setObject:[NSArray arrayWithObjects:@"北京",@"上海",@"深圳",@"广州", nil] forKey:@"中国"];
                    break;
                case 2:
                    [_rightDic setObject:[NSArray arrayWithObjects:@"莫斯科",@"圣彼得堡",@"叶卡捷林堡",nil] forKey:@"俄罗斯"];
                    break;
                case 3:
                    [_rightDic setObject:@[@"巴黎",@"马赛",@"里昂"] forKey:@"法国"];
                    break;
                default:
                    break;
            }
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    int height = 0;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0) {
        //height = 64;//搞不懂ios7 frame为啥变化，下面的代码导致的原因
        self.edgesForExtendedLayout = UIRectEdgeNone; //    ! ! important ! !
    }
    table_left = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, LEFT_TABLE_WIDTH, self.view.bounds.size.height) style:UITableViewStylePlain];
    table_left.delegate = self;
    table_left.dataSource = self;
    [self.view addSubview:table_left];
    
    table_right = [[UITableView alloc] initWithFrame:CGRectMake(LEFT_TABLE_WIDTH,height, RIGHT_TABLE_WIDTH, self.view.bounds.size.height) style:UITableViewStylePlain];
    table_right.delegate = self;
    table_right.dataSource = self;
    //table_right.backgroundColor = [UIColor redColor];
    [self.view addSubview:table_right];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 
#pragma UITableViewDataSource

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{

    return YES;
}
//自定义的删除在 Cell中
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{

    return UITableViewCellEditingStyleNone;
}

/**
 -------
 */

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (tableView == table_left) {
        return [self.leftArrays count];
    }else{
        return [[self.rightDic objectForKey:[self.leftArrays objectAtIndex:leftIndex]] count];//默认
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (tableView == table_left) {
        static NSString *cellIditifyer = @"Left_CELL";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIditifyer];
        if (cell == Nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIditifyer];
        }
        cell.textLabel.text = [self.leftArrays objectAtIndex:indexPath.row];
        cell.textLabel.adjustsFontSizeToFitWidth = YES;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        if (indexPath.row == leftIndex) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }else{
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        
        return cell;
    }else{
        static NSString *cellIditifyer = @"Right_CELL";
        CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIditifyer];
        if (cell == Nil) {
            cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIditifyer WithResetDelete:YES];
            //[cell setTextLabelScrollowed:NO];
        }
        NSString *string = [self.leftArrays objectAtIndex:leftIndex];
        cell.textLabel.text = [[self.rightDic objectForKey:string] objectAtIndex:indexPath.row];
        return cell;
        
    }
}


#pragma  mark
#pragma  UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (tableView == table_left) {
        //左边点选
        leftIndex = indexPath.row;
        [table_left reloadData];
        [table_right reloadData];
    }
}



@end
