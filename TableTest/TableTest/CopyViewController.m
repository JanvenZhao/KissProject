//
//  CopyViewController.m
//  TableTest
//
//  Created by Janven Zhao on 14-1-6.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

#import "CopyViewController.h"
#import "People.h"
#import "NSMutableArray+DeepCopy.h"

@interface CopyViewController ()
//延展
-(void)des;

@end

@implementation CopyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)des{

    NSLog(@"This is Extend Methord");
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i = 0; i<3; i++) {
        People *p = [[People alloc] init];
        p.name = [NSString stringWithFormat:@"Name-%d",i];
        p.school = [NSString stringWithFormat:@"School-%d",i];
        p.age = i;
        [array addObject:p];
    }
    
    //容器类的要自己实现深复制。。。
    NSMutableArray *copy = [array deepMutableCopy];
    
    for (People *p in copy) {
        NSLog(@"%p",p);
    }
    
    [self des];
    
//    NSMutableString *string = [NSMutableString stringWithFormat:@"You"];
//    NSLog(@"%p",string);
//    NSString *mu_copy = [string copy];
//    NSLog(@"%p",mu_copy);
//
//    NSMutableString *mu_muCopy = [string mutableCopy];
//    NSLog(@"%p",mu_muCopy);
//
//    
//    NSString *i_string = [NSString stringWithFormat:@"Me"];
//    NSLog(@"%p",i_string);
//
//    NSMutableString *mu_s_copy = [i_string mutableCopy];
//    NSLog(@"%p",mu_s_copy);
//
//    NSString *i_copy = [i_string copy];
//    NSLog(@"%p",i_copy);

    
    NSNumber *num = @10;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
