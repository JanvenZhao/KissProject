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
    
//    NSArray *array = [NSArray arrayWithObjects:@"1",@"12",@"44",@"3",@"10", nil];
//    NSLog(@"Before is %@",array);
    //NSLog(@"After is %@",[array sortedArrayUsingComparator:cmptr]);
    //NSLog(@"After is %@",[array sortedArrayUsingFunction:customSort context:nil]);
    
    //NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"price" ascending:NO];//其中，price为数组中的对象的属性，这个针对数组中存放对象比较更简洁方便
    //NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:&sortDescriptor count:1];
 
    //elong  打车部分代码
    
    NSLog(@"%f",[UIScreen mainScreen].bounds.size.height);
    
    BOOL is4inch;
    is4inch = ( [[UIScreen mainScreen] bounds].size.height == 568)?YES:NO;
    
    float topDistance = 40+20+44;
    
    float height;
    height = (is4inch)?100:78;
    
    float space = 5;//小间隔
    
    float big_Space = 50;
    
    float second_Width = (320-space)/2;
    
    CGRect frame;
    
    NSArray *array = [NSArray arrayWithObjects:@"即时打车 ＞",@"接机",@"送机",@"日租/时租 ＞",@"接机",@"送机",nil];
    
    UIEdgeInsets oncall_insets = UIEdgeInsetsMake(height/3, 20,height/3,158);
    UIEdgeInsets air_intes = UIEdgeInsetsMake(height/3, 20,0, 70);
    
    for (int i = 0; i<6; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];

        if (i==0) {
            frame = CGRectMake(0, topDistance, 320, height);
            [btn setTitleEdgeInsets:oncall_insets];
            
        }else if (i == 1||i == 2){
            frame = CGRectMake((i-1)*(second_Width+space), topDistance+height+space, second_Width, height);
            
            [btn setTitleEdgeInsets:air_intes];

        }else if (i == 3){
            frame = CGRectMake(0, topDistance+height*2+space+big_Space, 320, height);
            [btn setTitleEdgeInsets:oncall_insets];
            btn.enabled = NO;
            
        }else{
            frame = CGRectMake((i-4)*(second_Width+space), topDistance+height*3+space*2+big_Space, second_Width, height);
            [btn setTitleEdgeInsets:air_intes];
            btn.enabled = NO;
        }
        
        //
        [btn setFrame:frame];
        [btn.titleLabel setFont:[UIFont boldSystemFontOfSize:25.0f]];
        NSString *imageName = (is4inch)?[NSString stringWithFormat:@"T%d_4.png",i]:[NSString stringWithFormat:@"T%d",i];
        
        [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [btn setTitle:[array objectAtIndex:i] forState:UIControlStateNormal];

        [self.view addSubview:btn];
    }
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
