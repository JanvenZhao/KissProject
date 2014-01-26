//
//  GaoDePoint.h
//  TableTest
//
//  Created by Jian.Zhao on 14-1-24.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface GaoDePoint : NSObject<MKAnnotation>

/*
 "formatted_address": "山东省济南市市中区火车站",
 "province": "山东省",
 "citycode": "0531",
 "city": "济南市",
 "district": "市中区",
 "township": [],
 "neighborhood": {
 "name": [],
 "type": []
 },
 "building": {
 "name": [],
 "type": []
 },
 "adcode": "370103",
 "street": [],
 "number": [],
 "location": "116.993355,36.667897",
 "level": "公交站台、地铁站"
 */

@property (nonatomic,retain) NSString *formatted_address;  //格式化地址
@property (nonatomic,retain) NSString *province;    //省名称
@property (nonatomic,retain) NSString *citycode;    //城市代码
@property (nonatomic,retain) NSString *city;            //城市
@property (nonatomic,retain) NSString *district;    //区域名称

@property (nonatomic,retain) NSArray *township;  //乡镇名称
@property (nonatomic,retain) NSDictionary *neighborhood; //社区名称
@property (nonatomic,retain) NSDictionary *building;    //楼名称

@property (nonatomic,retain) NSString *adcode;          //区域编码
@property (nonatomic,retain) NSString *location;        //经纬度坐标   (first argument 纬度         second 经度)

@property (nonatomic,retain) NSArray *street;       //街道
@property (nonatomic,retain) NSArray *number;       //门牌号

@property (nonatomic,retain) NSString *level;   //匹配级别字符串


@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly, copy) NSString *title;

- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate;

@end
