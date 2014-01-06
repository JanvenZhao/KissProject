//
//  People.m
//  TableTest
//
//  Created by Janven Zhao on 14-1-6.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

#import "People.h"

@implementation People

-(id)copyWithZone:(NSZone *)zone{
//浅复制
    People *per = [[self class] allocWithZone:zone];
    per.name = _name;
    per.school = _school;
    per.age = _age;
    return per;
    
}

-(id)mutableCopyWithZone:(NSZone *)zone{
//深复制
    People *per = [[self class] allocWithZone:zone];
    //实现深复制 必须使用 MutableCopy ,因为本来声明的属性使用的NSString，此处再次使用copy的话，仍然是指针复制
    per.name = [_name mutableCopy];
    per.school = [_school mutableCopy];
    per.age = _age;
    return per;
}

@end
