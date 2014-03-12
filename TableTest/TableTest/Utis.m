//
//  Utis.m
//  TableTest
//
//  Created by Jian.Zhao on 14-3-4.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

#import "Utis.h"

#define DateValue(month,day,week) [NSString stringWithFormat:@"%d月%d日 %@",month,day,week]

@implementation Utis

+(BOOL)simpleTestOfString:(id)object{

    if (object && [object isKindOfClass:[NSString class]]) {
        return YES;
    }
    return NO;
}


+(NSArray *)getDateArraysFromNowWithDays:(int)days{

    NSMutableArray *array = [NSMutableArray arrayWithCapacity:days];
    
    //  先定义一个遵循某个历法的日历对象
    NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    for (int i = 0; i<days; i++) {
        //  通过已定义的日历对象，获取某个时间点的NSDateComponents表示，并设置需要表示哪些信息（NSYearCalendarUnit, NSMonthCalendarUnit, NSDayCalendarUnit等）
        NSDateComponents *dateComponents = [greCalendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSWeekCalendarUnit | NSWeekdayCalendarUnit  fromDate:[NSDate dateWithTimeIntervalSinceNow:24*60*60*i]];
        //  Sunday:1, Monday:2, Tuesday:3, Wednesday:4, Thursday, 5 Friday:6, Saturday:7
        NSString *weekDay = nil;
        switch (dateComponents.weekday) {
            case 1:
                weekDay = @"周日";
                break;
            case 2:
                weekDay = @"周一";
                break;
            case 3:
                weekDay = @"周二";
                break;
            case 4:
                weekDay = @"周三";
                break;
            case 5:
                weekDay = @"周四";
                break;
            case 6:
                weekDay = @"周五";
                break;
            case 7:
                weekDay = @"周六";
                break;
            default:
                break;
        }
        
        switch (i) {
            case 0:
                weekDay = @"今天";
                break;
            case 1:
                weekDay = @"明天";
                break;
             case 2:
                weekDay = @"后天";
                break;
            default:
                break;
        }
        
        NSString *value = [NSString stringWithFormat:@"%d月%d日 %@",dateComponents.month,dateComponents.day,weekDay];
        [array addObject:value];
    }
    return array;
}


@end
