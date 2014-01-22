//
//  Dog.m
//  TableTest
//
//  Created by Jian.Zhao on 14-1-22.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

#import "Dog.h"
#import "AnimalTestPro.h"

@implementation Dog

-(void)toString{
    [super toString];
    NSLog(@"%@",NSStringFromClass([super class]));
    NSLog(@"%@",NSStringFromClass([self class]));
    
    NSLog(@"汪星人------");
}


-(void)proA{

    NSLog(@"This is a pro");
}

-(void)proB{

    
}

@end
