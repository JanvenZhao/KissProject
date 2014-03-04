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


@interface NSArray (description)

@end

@implementation NSArray (description)

-(void)description{

    for (id object in self) {
        NSLog(@"id->%@,  retainCout is %d",[object name],[object retainCount]);
    }
    
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

    NSLog(@"%d",[array retainCount]);
    [array description];
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:array];
    NSLog(@"%d",[array retainCount]);
    [array description];

    NSMutableArray *arr = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    NSLog(@"%d",[arr retainCount]);

    [arr description];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
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
//    [self archivedArray:array];
//    [array release];
//    array = nil;
//
//    if (array) {
//        NSLog(@"Error");
//    }
    
    //容器类的要自己实现深复制。。。
//    NSMutableArray *copy = [array deepMutableCopy];
//
//    NSLog(@"copy retainCount is %d",[copy retainCount]);
//        
//        for (People *p in copy) {
//            NSLog(@"%p",p);
//        }
    
 

    //[self customObjectWithDic];
 
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setFrame:CGRectMake(0, 100, 320, 40)];
    [btn setTitle:@"Tap" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(tapAndPopActionSheet) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
}

-(void)customObjectWithDic{

    
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

-(void)tapAndPopActionSheet{

    sheet = [[UIActionSheet alloc] initWithTitle:@"\n\n\n\n\n\n\n\n\n\n\n\n\n"
                                                        delegate:self
                                               cancelButtonTitle:nil
                                          destructiveButtonTitle:nil
                                               otherButtonTitles:nil,nil];
    sheet.tag = 100;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setFrame:CGRectMake(10, 0, 64, 44)];
    [btn setTitle:@"Cancel" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(dismissTheAction) forControlEvents:UIControlEventTouchUpInside];
    [sheet addSubview:btn];
    
   // [sheet addButtonWithTitle:@"Cancel----"];
    UIDatePicker *picker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 44, 320, 216)];
    [picker setDate:[NSDate date]];
    [sheet addSubview:picker];
    
    [sheet   showInView:self.view];
    
}

-(void)dismissTheAction{

    [sheet dismissWithClickedButtonIndex:0 animated:YES];
    
}


@end
