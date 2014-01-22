//
//  AnimalTestPro.h
//  TableTest
//
//  Created by Jian.Zhao on 14-1-22.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

#import <Foundation/Foundation.h>

//使用类的Protocol 最好指明 是 optional or required----------

//本类不提供实现，接受Protocol 的Class Implement

@protocol AnimalTestPro <NSObject>

@optional
-(void)proA;
-(void)proB;

@end
