//
//  DesignPatterns.m
//  TableTest
//
//  Created by Jian.Zhao on 14-1-22.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

#import "DesignPatterns.h"
#import "Animal.h"
#import "Dog.h"
#import "Cat.h"
#import "HttpRequest.h"
#import "Singelton.h"

@interface DesignPatterns ()

@end

@implementation DesignPatterns

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
//    Dog *dog = [[Dog alloc] init];
//    [dog toString];
//    [dog proA];
//    [dog proB];
    
    
    Singelton *single = [Singelton   getInstance];
    Singelton    *a = [Singelton getInstance];
    if (single == a) {
        NSLog(@"Good");
    }else{
        NSLog(@"Error on Create A Singleton");
    }
    
    /*
     *以下测试 NSOperationQueue && NSoperation
     */
    
    //http://mobile-api2011.elong.com/MobileApiHelp/System/Workbench
    //http://www.cnblogs.com/zhenyulu/articles/36885.html
    _queue = [[NSOperationQueue alloc] init];
    for (int i = 0; i<1; i++) {

        NSURL *url = [NSURL URLWithString:@"http://mobile-api2011.elong.com/MobileApiHelp/System/Workbench"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        HttpRequest *op = [[HttpRequest alloc] initWithReuest:request];
        op.delegate = self;
        [_queue addOperation:op];
    }
    
    
    NSLog(@"%f",round(1/2.0));
    NSLog(@"%f",round(1/3.0));//四舍五入
    
    NSString *string = @"4.78";
    NSLog(@"%d",[string intValue]);

    NSLog(@"%f",ceil(12.00));
    NSLog(@"%f",ceil(11.91));
    NSLog(@"%f",floor(12.01));
    NSLog(@"%f",floor(12.99));
    NSLog(@"%f",round(13.51));//四舍五入
    NSLog(@"%f", pow(2, 100));

}

-(void)viewWillDisappear:(BOOL)animated{

    NSArray *array = [_queue operations];
    if ([array count] != 0) {
        
        [_queue cancelAllOperations];//
        
//        for (HttpRequest *requ in array) {
//            [requ cancel];
//        }
        
    }
}

-(void)receiveError:(NSError *)_error{

    NSLog(@"error is %@",[_error userInfo]);
}
-(void)receiveData:(NSData *)_data{
    
    NSLog(@"_data is %@",_data);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
