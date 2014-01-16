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
#import "NSMutableArray+DeepCopy.h"

@implementation People

-(id)init{

    if (self = [super init]) {
        //
       _name = @"";
         _school = @"";
         _age = 0;
         _height = 0.0f;
         _galary = 0;
         _married = NO;
         _childs = [[NSMutableArray alloc] init];

    }
    return self;
}

-(void)dealloc{
    
    //...
    [_name release];
    [_school release];
    [_childs release];
    [super dealloc];
}

//编码
- (void)encodeWithCoder:(NSCoder *)aCoder{

    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:_school forKey:@"school"];
    [aCoder encodeInt:_age forKey:@"age"];
    [aCoder encodeFloat:_height forKey:@"height"];
    [aCoder encodeDouble:_galary forKey:@"galary"];
    [aCoder encodeBool:_married forKey:@"married"];
    [aCoder encodeObject:_childs forKey:@"childs"];
}

//解码
- (id)initWithCoder:(NSCoder *)aDecoder{

    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.school = [aDecoder decodeObjectForKey:@"school"];
        self.age = [aDecoder decodeIntForKey:@"age"];
        self.height = [aDecoder decodeFloatForKey:@"height"];
        self.galary = [aDecoder decodeDoubleForKey:@"galary"];
        self.married = [aDecoder decodeBoolForKey:@"married"];
        self.childs = [aDecoder decodeObjectForKey:@"childs"];
    }
    return self;
    
}



-(id)copyWithZone:(NSZone *)zone{
//浅复制
    People *per = [[self class] allocWithZone:zone];
    per.name = _name;
    per.school = _school;
    per.age = _age;
    per.height = _height;
    per.galary = _galary;
    per.married = _married;
    per.childs = _childs;
    return per;
    
}

-(id)mutableCopyWithZone:(NSZone *)zone{
//深复制
    People *per = [[self class] allocWithZone:zone];
    
    //实现深复制 必须使用 MutableCopy ,因为本来声明的属性使用的NSString，此处再次使用copy的话，仍然是指针复制
   
    per.name = [self safeMutableCopy:_name];
    per.school = [self safeMutableCopy:_school];
    
    /*The Same With The Over
     per.name = [[_name mutableCopy] autorelease];
     per.school = [[_school mutableCopy] autorelease];
     */

    //弱引用，无需release 这种方式 和上面的方式都可以,不推荐！
    /*
    per->_name = [_name mutableCopy];
    per->_school = [_school mutableCopy];
    */
    
    per.age = _age;
    per.height = _height;
    per.galary = _galary;
    per.married = _married;
    per.childs = [_childs deepMutableCopy];//注意这个，若其中包含的是自定义Model的话 要手动实现深复制
    return per;
}

-(NSString *)safeMutableCopy:(NSString *)origin{
 
    NSString *string = [origin mutableCopy];
    return [string autorelease];
    
}

@end
