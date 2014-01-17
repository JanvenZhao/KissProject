//
//  SortViewController.m
//  TableTest
//
//  Created by Jian.Zhao on 14-1-17.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

#import "SortViewController.h"

@interface SortViewController ()

@end

@implementation SortViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//sortedArrayUsingComparator
NSComparator cmptr = ^(id obj1, id obj2){
    if ([obj1 integerValue] > [obj2 integerValue]) {
        return (NSComparisonResult)NSOrderedDescending;
    }
    
    if ([obj1 integerValue] < [obj2 integerValue]) {
        return (NSComparisonResult)NSOrderedAscending;
    }
    return (NSComparisonResult)NSOrderedSame;
};


//sortedArrayUsingFunction
NSInteger customSort(id obj1, id obj2,void* context){
    if ([obj1 integerValue] > [obj2 integerValue]) {
        return (NSComparisonResult)NSOrderedDescending;
    }
    
    if ([obj1 integerValue] < [obj2 integerValue]) {
        return (NSComparisonResult)NSOrderedAscending;
    }
    return (NSComparisonResult)NSOrderedSame;
}
//


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSArray *array = [NSArray arrayWithObjects:@"1",@"12",@"44",@"3",@"10", nil];
    NSLog(@"Before is %@",array);
    //NSLog(@"After is %@",[array sortedArrayUsingComparator:cmptr]);
    //NSLog(@"After is %@",[array sortedArrayUsingFunction:customSort context:nil]);
    
    //NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"price" ascending:NO];//其中，price为数组中的对象的属性，这个针对数组中存放对象比较更简洁方便
    //NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:&sortDescriptor count:1];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
