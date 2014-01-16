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
#import "ClassExtend.h"

@interface NSDictionary (JSON)

+(NSDictionary *)url:(NSURL *)_url;
-(NSData *)toJson;

@end

@implementation NSDictionary (JSON)

+(NSDictionary *)url:(NSURL *)_url{

    NSData *data = [NSData dataWithContentsOfURL:_url];
    NSError *error;
    id result = [NSJSONSerialization  JSONObjectWithData:data options:NSJSONReadingAllowFragments
                                                   error:&error];
    if (result) {
        return result;
    }
    return nil;
}
-(NSData *)toJson{
    NSError *error;
    id data1 = [NSJSONSerialization dataWithJSONObject:self options:kNilOptions error:&error];
    if (data1) {
        return data1;
    }
    return nil;
}

@end

@interface CopyViewController ()
//延展
-(void)archivedArray:(NSArray *)array;

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



-(void)archivedArray:(NSArray *)array{

    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:array];
    NSMutableArray *arr = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    NSLog(@"%@",arr);
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
//    
//    NSMutableArray *array = [[NSMutableArray alloc] init];
//    for (int i = 0; i<3; i++) {
//        People *p = [[People alloc] init];
//        p.name = [NSString stringWithFormat:@"Name-%d",i];
//        p.school = [NSString stringWithFormat:@"School-%d",i];
//        p.age = i;
//        [array addObject:p];
//        [p release];
//    }

    //
//    //容器类的要自己实现深复制。。。
    //NSMutableArray *copy = [array deepMutableCopy];
    
    //NSLog(@"copy retainCount is %d",[copy retainCount]);
//    
//    for (People *p in copy) {
//        NSLog(@"%p",p);
//    }
//    
//    [self archivedArray:copy];
//    
//
    
//    NSDictionary* information =
//    [NSDictionary dictionaryWithObjectsAndKeys: @"orange",@"apple",@"banana",@"fig",nil];
//    NSData* json = [information toJson];
    
    
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
    
    //
    NSMutableArray *t = [[NSMutableArray alloc] initWithObjects:@"王二",@"李斯",@"张三", nil];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                         @"zhao",@"name",
                         @"Peking",@"school",
                         [NSNumber numberWithInt:29],@"age",
                         [NSNumber numberWithFloat:12.0f],@"height",
                         [NSNumber numberWithBool:YES],@"married",
                         t,@"childs",
                         [NSNumber  numberWithDouble:12.56],@"galary",nil];
    [t release];
    People *peo = [[People alloc] init];
    [peo convertObjectFromGievnDictionary:dic];
    NSLog(@"peo is %@",peo);
    NSDictionary *another = [peo convertDictionaryFromObjet];
    NSLog(@"another is %@",another);
      [peo listAndPritfAllPropers];
    [peo release];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
