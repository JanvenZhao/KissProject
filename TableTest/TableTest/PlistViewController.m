//
//  PlistViewController.m
//  TableTest
//
//  Created by 艺龙员工 on 13-12-28.
//  Copyright (c) 2013年 艺龙员工. All rights reserved.
//

#import "PlistViewController.h"

@interface PlistViewController ()

@end

@implementation PlistViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        /*
         @ plist 文件分为 Array和Dictionary 两种格式
         创建以及初始化的时候注意，若是用Array方法初始化Dictionary类型的Plist会得到一个NULL
         */
        
        //[self readDataFromPlist];
        
        /*
        
        NSMutableArray *array = [[NSMutableArray alloc] init];
        [array addObject:@"A"];
        [array addObject:@"B"];
        [array addObject:@"C"];
        [array addObject:@"D"];
        NSLog(@"%@",array);
        NSLog(@"The Last Object is %@",[array lastObject]);
        NSLog(@"The First Object is %@",[array objectAtIndex:0]);
        NSLog(@"The Revers is %@",[[array reverseObjectEnumerator] allObjects]);
        
        NSMutableArray *arrayB = [NSMutableArray arrayWithArray:array];
        [arrayB removeObject:@"D"];
        NSLog(@"%@",array);
        [arrayB exchangeObjectAtIndex:0 withObjectAtIndex:[arrayB count]-1];
        
        */
        
        //String
        
        NSString *num = @"asdsadfsdafasdDASFDSAfSDF";
        
        BOOL ye = [[NSPredicate predicateWithFormat:@"SELF MATCHES '[A-Za-z]*'"] evaluateWithObject:num];
        
        if (ye) {
            NSLog(@"全是字母");
        }else{
            NSLog(@"不完全是字幕呀");
        }
        
        for (int i = 0; i < [num length]; i++) {
            NSString *a = [num substringWithRange:NSMakeRange(i, 1)];
            if ([[NSPredicate predicateWithFormat:@"SELF MATCHES '([a-zA-Z])'"] evaluateWithObject:a]) {
                NSLog(@"%@",[num substringWithRange:NSMakeRange(i, 1)]);
            }else{
            
                NSLog(@" 不是字母 %@",[num substringWithRange:NSMakeRange(i, 1)]);

            }
        }
        
        
        
    }
    return self;
}

-(void)readDataFromPlist{

    NSString *resource_path = [[NSBundle mainBundle] pathForResource:@"PackingList" ofType:@"plist"];
    NSLog(@"resource_path is  %@",resource_path);
    
    _myPackingList = [[NSMutableArray alloc] initWithContentsOfFile:resource_path];
    NSLog(@"detch The Array is %@",self.myPackingList);
    
    /*
     分析plist的层级关系
     */
    for (int i = 0; i<[self.myPackingList count]; i++) {
        NSDictionary *dic = [self. myPackingList objectAtIndex:i];
        NSLog(@"Current title is %@",[dic objectForKey:@"title"]);
        NSArray *categorys = [dic objectForKey:@"Categorys"];
        if ([categorys count] > 0) {
            for (NSDictionary *category  in categorys) {
                NSLog(@"category name is %@",[category objectForKey:@"name"]);
                NSArray *items = [category objectForKey:@"items"];
                for (NSString *item in items) {
                    NSLog(@"%@",item);
                }
            }
        }
    }
    
    //
    //添加一项内容
    [self.myPackingList addObject:@"someThing Add"];
    
    //获取应用程序沙盒的Documents目录
    NSArray *paths= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *plistPath1 = [paths objectAtIndex:0];
    //得到完整的文件名
    NSString *filename=[plistPath1 stringByAppendingPathComponent:@"test.plist"];
    NSFileManager *manager = [NSFileManager defaultManager];
    
    if (![manager fileExistsAtPath:filename]) {
        [manager createFileAtPath:filename contents:nil attributes:nil];
        [self.myPackingList writeToFile:filename atomically:YES];
    }else{
        NSError *error;
        [manager removeItemAtPath:filename error:&error];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
//    alert = [[UIAlertView alloc] initWithTitle:@"" message:@"some Tips" delegate:Nil
//                                          cancelButtonTitle:nil otherButtonTitles:nil, nil];
//    [alert show];
//    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(dismissTheAlert) userInfo:nil repeats:NO];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 0, 44, 44)];
    [button setTitle:@"确认" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
  //  [button setTitleColor:[UIColor greenColor] forState:UIControlStateDisabled];
    [button setEnabled:NO];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    [self.navigationItem setRightBarButtonItem:item animated:YES];
    
    
}

-(void)dismissTheAlert{
    [alert dismissWithClickedButtonIndex:0 animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
