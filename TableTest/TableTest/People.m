//
//  People.m
//  TableTest
//
//  Created by Janven Zhao on 14-1-6.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

/*
 *本类的深复制 可以有两种方法实现 1、通过归档 Archived－Data－UnArchived
                                                       2、通过下面本类中的 MutableCopy,若是在容器中,容器的MutableCopy要自己写！
 */

#import "People.h"

@implementation People

-(id)init{

    if (self = [super init]) {
        //

    }
    return self;
}


//编码
- (void)encodeWithCoder:(NSCoder *)aCoder{

    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:_school forKey:@"school"];
    [aCoder encodeInt:_age forKey:@"age"];
    
}

//解码
- (id)initWithCoder:(NSCoder *)aDecoder{

    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.school = [aDecoder decodeObjectForKey:@"school"];
        self.age = [aDecoder decodeIntForKey:@"age"];
    }
    return self;
    
}



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
