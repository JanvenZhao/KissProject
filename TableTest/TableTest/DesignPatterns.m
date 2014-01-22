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
    /*
    _queue = [[NSOperationQueue alloc] init];
    for (int i = 0; i<10; i++) {
        NSURL *url = [NSURL URLWithString:@"http://www.cnblogs.com/zhenyulu/articles/36885.html"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        HttpRequest *op = [[HttpRequest alloc] initWithReuest:request];
        op.delegate = self;
        [_queue addOperation:op];
    }
    */
}

//-(void)viewWillDisappear:(BOOL)animated{
//
//    NSArray *array = [_queue operations];
//    if ([array count] != 0) {
//        
////        [_queue cancelAllOperations];//用下面的取消 方式更好！并发1000+毫无压力。。。
////        [_queue waitUntilAllOperationsAreFinished];
//        
//        for (HttpRequest *requ in array) {
//            [requ cancel];
//        }
//        
//    }
//}

-(void)receiveError:(NSError *)_error{

    
}
-(void)receiveData:(NSData *)_data{
    
   // NSLog(@"_data is %@",_data);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
