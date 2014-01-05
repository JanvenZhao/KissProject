//
//  ZheDieTable.m
//  TableTest
//
//  Created by Janven Zhao on 14-1-1.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

#import "ZheDieTable.h"

@interface ZheDieTable ()

@end

@implementation ZheDieTable

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
        NSArray *a = [NSArray arrayWithObjects:@"奥古斯丁",@"奥地利",@"澳大利亚",nil];
        NSArray *b = [NSArray arrayWithObjects:@"保利",@"宝马",@"保加利亚", nil];
        
        _dataSource = [NSDictionary dictionaryWithObjectsAndKeys:a,@"A",b,@"B",nil];
        
        isOpen = [[NSMutableDictionary alloc] init];
        
        for (int i = 0; i < [[self.dataSource allKeys] count]; i++) {
            NSString *string = [[self.dataSource allKeys] objectAtIndex:i];
            [isOpen setValue:[NSNumber  numberWithBool:YES] forKey:string];
        }
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
    return [[self.dataSource allKeys] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSString *key = [[self.dataSource allKeys] objectAtIndex:section];
    
    BOOL yes = [[isOpen objectForKey:key] boolValue];
    if (yes) {
        return 0;
    }else{
        return [[self.dataSource objectForKey:key] count];
    }
    
}

//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//
//    return [[self.dataSource allKeys] objectAtIndex:section];
//}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 50;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    v.backgroundColor = [UIColor lightGrayColor];
    v.alpha = 0.5;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    NSString *string = [[self.dataSource allKeys] objectAtIndex:section];
    [btn setTitle:string forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(0, 0, 320, 50)];
    btn.tag = section;
    [btn.titleLabel setTextAlignment:NSTextAlignmentLeft];
    [btn addTarget:self action:@selector(displayTheContent:) forControlEvents:UIControlEventTouchUpInside];
    
    [v addSubview:btn];
    return v;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == Nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    NSString *key = [[self.dataSource allKeys] objectAtIndex:indexPath.section];
    cell.textLabel.text = [[self.dataSource objectForKey:key] objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)displayTheContent:(id)sender{
    
    UIButton *btn = (UIButton *)sender;
    NSString *key = [(UIButton *)sender titleLabel].text;

    BOOL yes = [[isOpen objectForKey:key] boolValue];
    [isOpen setValue:[NSNumber numberWithBool:!yes] forKey:key];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:btn.tag] withRowAnimation:UITableViewRowAnimationFade];    
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

@end
