//
//  ViewController.m
//  TableTest
//
//  Created by 艺龙员工 on 13-12-28.
//  Copyright (c) 2013年 艺龙员工. All rights reserved.
//

#import "ViewController.h"
#import "RootViewController.h"
#import "CalendarsRemindersViewController.h"
#import "PlistViewController.h"
#import "ZheDieTable.h"
#import "CustomTextField.h"
#import "CopyViewController.h"
#import "SortViewController.h"
#import "DesignPatterns.h"
#import "DrawViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        _exampleArray = [NSArray arrayWithObjects:@"两列Table",@"带字母索引",@"plist读写",@"TableView展开折叠",@"自定义TextField",@"复制",@"排序",@"设计模式",@"动画画圆",nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.exampleArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    cell.textLabel.text = [self.exampleArray objectAtIndex:indexPath.row];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

#pragma  mark
#pragma  mark UITableDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSString *title = [self.exampleArray objectAtIndex:indexPath.row];
    
    if (indexPath.row == 0) {
        RootViewController *table = [[RootViewController alloc] init];
        table.title = title;
        [self.navigationController pushViewController:table animated:YES];
    }else if (indexPath.row == 1){
        CalendarsRemindersViewController *view = [[CalendarsRemindersViewController   alloc] init];
        view.title = title;
        [self.navigationController pushViewController:view animated:YES];
    }else if (indexPath.row == 2){
        PlistViewController *plist = [[PlistViewController alloc] init];
        plist.title = title;
        [self.navigationController pushViewController:plist animated:YES];
    }else if (indexPath.row == 3){
        ZheDieTable *table = [[ZheDieTable alloc] init];
        table.title = title;
        [self.navigationController pushViewController:table animated:YES];
    }else if (indexPath.row == 4){
        CustomTextField *text = [[CustomTextField     alloc] init];
        text.title = title;
        [self.navigationController pushViewController:text animated:YES];
    }else if (indexPath.row == 5){
        CopyViewController *copy = [[CopyViewController alloc] init];
        copy.title = title;
        [self.navigationController pushViewController:copy animated:YES];
    }else if (indexPath.row == 6){
        SortViewController *sort = [[SortViewController alloc] init];
        sort.title = title;
        [self.navigationController pushViewController:sort animated:YES];
    }else if (indexPath.row == 7){
        DesignPatterns *design = [[DesignPatterns alloc] init];
        design.title = title;
        [self.navigationController pushViewController:design animated:YES];
    }else if (indexPath.row == 8){
        DrawViewController *draw = [[DrawViewController alloc] init];
        draw.title = title;
        [self.navigationController pushViewController:draw animated:YES];
    }
}

@end
