//
//  GaodeViewController.h
//  TableTest
//
//  Created by Jian.Zhao on 14-1-24.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HttpRequest.h"
#import <MapKit/MapKit.h>
@interface GaodeViewController : UIViewController<MKMapViewDelegate,UISearchBarDelegate,HttpRequestDelegate>{

    NSOperationQueue *_queue;
    MKMapView *map;
}

@end
