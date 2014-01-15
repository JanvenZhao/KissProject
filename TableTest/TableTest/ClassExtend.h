//
//  ClassExtend.h
//  TableTest
//
//  Created by Jian.Zhao on 14-1-15.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassExtend : NSObject

@end

@interface NSObject (Utility)

- (NSDictionary *)convertDictionary;
- (void)convertObjectFromGievnDictionary:(NSDictionary*) dict;
-(void)listAndPritfAllPropers;

@end
