//
//  ClassExtend.m
//  TableTest
//
//  Created by Jian.Zhao on 14-1-15.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

#import "ClassExtend.h"
#import <objc/runtime.h>

@implementation ClassExtend

@end

#define PROPETTY_ENCODE_INT  @"Ti"
#define PROPETTY_ENCODE_FLOAT @"Tf"
#define PROPETTY_ENCODE_DOUBLE @"fd"
#define PROPETTY_ENCODE_CHAR @"Tc"


@implementation NSObject (Utility)

//1. 利用反射取得NSObject的属性，并存入到数组中
- (NSMutableDictionary *)getPropertyList{
    
    NSMutableDictionary *propertyDic = [NSMutableDictionary dictionary];
    NSString *className = NSStringFromClass([self class]);
    const char *cClassName = [className UTF8String];
    id theClass = objc_getClass(cClassName);
    
    u_int count;
    objc_property_t *properties = class_copyPropertyList(theClass, &count);
    for (int i = 0; i < count ; i++)
    {
        const char* propertyName = property_getName(properties[i]);
        const char* propertyType = property_getAttributes(properties[i]);
        [propertyDic setObject:[NSString stringWithUTF8String:propertyType] forKey:[NSString stringWithUTF8String:propertyName]];
    }
    free(properties); 
    return propertyDic;
}

//2. 把一个实体对象，封装成字典Dictionary
- (NSDictionary *)convertDictionaryFromObjet{
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    NSDictionary *propertyList = [self getPropertyList];
    for (NSString *key in [propertyList allKeys]) {
        
        id value = [self valueForKey:key];
        if (value == nil) {
            value = [NSNull null];
        }
        //判断属性的类型，若为object对象，直接setObject 其他封装再set
        NSString *p_typep = [propertyList objectForKey:key];
        if ([p_typep rangeOfString:@"@"].location == NSNotFound) {
            //
            NSString *sign = [p_typep substringWithRange:NSMakeRange(0, 2)];
            if ([sign isEqualToString:PROPETTY_ENCODE_INT]) {
                //int
                value = [NSNumber   numberWithInt:(int)value];
            }else if ([sign isEqualToString:PROPETTY_ENCODE_FLOAT]){
                //float
                if (![value respondsToSelector:@selector(floatValue)]) {
                    continue;
                }
                value = [NSNumber numberWithFloat:[value floatValue]];
                
            }else if ([sign isEqualToString:PROPETTY_ENCODE_DOUBLE]){
                //double
                if (![value respondsToSelector:@selector(doubleValue)]) {
                    continue;
                }
                value = [NSNumber numberWithDouble:[value doubleValue]];
                
            }else if ([sign isEqualToString:PROPETTY_ENCODE_CHAR]){
                //char
                value = [NSNumber numberWithChar:[value charValue]];
            }
        }
        [dict setObject:value forKey:key];
    }
    return [dict autorelease];
}
//3. 从一个字典中还原成一个实体对象
- (void)convertObjectFromGievnDictionary:(NSDictionary*) dict{
    
    for (NSString *key in [dict allKeys]) {
        id value = [dict objectForKey:key];
        
        if (value==[NSNull null]) {
            continue;
        }
        if ([value isKindOfClass:[NSDictionary class]]) {
            
            id subObj = [self valueForKey:key];
            if (subObj)
                [subObj convertObjectFromGievnDictionary:value];
            
        }else{
            [self setValue:value forKey:key];
        }
    }
}
//4. 返回一个对象的类型名称
- (NSString *)className{
    return [NSString stringWithUTF8String:object_getClassName(self)];
}

//5.列举所有的属性以及相应类型的编码类型

-(void)listAndPritfAllPropers{

    NSString *className = NSStringFromClass([self class]);
    const char *name = [className UTF8String];
    id class = objc_getClass(name);
    unsigned int outCount,i;
    objc_property_t *properties = class_copyPropertyList(class, &outCount);
    for (i=0; i<outCount; i++) {
        objc_property_t property = properties[i];
        NSLog(@"%s",property_getName(property));
        NSLog(@"%s",property_getAttributes(property));
        /*
         NSString *sel = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
         SEL selector = NSSelectorFromString(sel);
         id value = [user performSelector:selector];
         NSLog(@"%@",value);
         */
    }
    free(properties);
}
@end