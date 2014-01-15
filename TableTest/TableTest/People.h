//
//  People.h
//  TableTest
//
//  Created by Janven Zhao on 14-1-6.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface People : NSObject<NSCopying,NSMutableCopying,NSCoding>{

    NSString *_name;
    NSString *_school;
    int _age;
    float _height;
    double _galary;
    BOOL _married;
    NSMutableArray *_childs;
}
@property (nonatomic,retain) NSString *name;
@property (nonatomic,retain) NSString *school;
@property (nonatomic) int age;
@property (nonatomic) float height;
@property (nonatomic,assign) double galary;
@property (nonatomic) BOOL married;
@property (nonatomic,retain) NSMutableArray *childs;

@end
