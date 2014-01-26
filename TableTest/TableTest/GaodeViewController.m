//
//  GaodeViewController.m
//  TableTest
//
//  Created by Jian.Zhao on 14-1-24.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

#import "GaodeViewController.h"
#import "HttpRequest.h"
#import <MapKit/MapKit.h>
#import "Annotation.h"
#import "ClassExtend.h"
#import "GaoDePoint.h"

@interface GaodeViewController ()

@end

//下面的city赋值为010 代表北京 输入空 或者不传 默认为全国范围内的搜索

//地理编码
#define REQUEST_Address(address)  [NSString stringWithFormat:@"http://restapi.amap.com/v3/geocode/geo?address=%@&key=c84af8341b1cc45c801d6765cda96087&city=",address]
//输入提示（moren）
#define REQUEST_INPUT(input) [NSString stringWithFormat:@"http://restapi.amap.com/v3/assistant/inputtips?keywords=%@&key=c84af8341b1cc45c801d6765cda96087&city=",input]
//输入提示后查询
#define REQUEST_QUERY_AFTERINPUT(query) [NSString stringWithFormat:@"http://restapi.amap.com/v3/place/text?keywords=%@&key=c84af8341b1cc45c801d6765cda96087&page=1&offset=10",query]


/**
 POI
 http://restapi.amap.com/v3/place/around?keywords=%E9%85%92%E5%BA%97&location=116.405467,39.907761&key=c84af8341b1cc45c801d6765cda96087&radius=500&city=%E5%8C%97%E4%BA%AC&page=1&offset=10&callback=AMap._91584_
 **/

@implementation GaodeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    
    
    
    _queue = [[NSOperationQueue alloc] init];
    
    NSString *address = REQUEST_Address(@"济南火车站");
    
    NSURL *url = [NSURL URLWithString:[address stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    HttpRequest *op = [[HttpRequest alloc] initWithReuest:request];
    op.delegate = self;
    [_queue addOperation:op];
    
    
    /*
     CLLocation *orig=[[[CLLocation alloc] initWithLatitude:[mainDelegate.latitude_self doubleValue]  longitude:[mainDelegate.longitude_self doubleValue]] autorelease];
     CLLocation* dist=[[[CLLocation alloc] initWithLatitude:[tmpNewsModel.latitude doubleValue] longitude:[tmpNewsModel.longitude doubleValue] ] autorelease];
     
     CLLocationDistance kilometers=[orig distanceFromLocation:dist]/1000;
     NSLog(@"距离:",kilometers);
     */

//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 10)];
//    view.backgroundColor = [UIColor redColor];
//    
//    UISearchBar *bar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
//    bar.barStyle = UIBarStyleDefault;
//    bar.delegate = self;
//   // bar.inputAccessoryView = view;
//    [bar setScopeButtonTitles:[NSArray arrayWithObjects:@"One",@"Two",@"Three",@"Four",nil]];
//    
//    [bar setShowsScopeBar:YES];
//    [bar sizeToFit];
//    
//    [bar setAutocapitalizationType:UITextAutocapitalizationTypeNone];
//    
//    [self.view addSubview:bar];
    
    //UISearchDisplayController *display = [[UISearchDisplayController alloc] initWithSearchBar:bar contentsController:self];
    
    
    map = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    map.delegate = self;
    [self.view addSubview:map];
    
    
}

-(void)receiveData:(NSData *)_data{
    
    // NSLog(@"_data is %@",_data);
    NSError *error;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:_data options:NSJSONReadingAllowFragments error:&error];
    NSLog(@"%@",dic);
    /*
     status ----1,success    0,error
     info---OK, or  other explanation
     count --- arrays count 
     geocodes --- datas array
     */
    
    NSString *status = [dic objectForKey:@"status"];
    NSString *msg = [dic objectForKey:@"info"];
    
    if ([status isEqualToString:@"1"]) {
        
        NSArray *data = [dic objectForKey:@"geocodes"];
        if ([data count] != 0) {
            
            //
            NSMutableArray *annotions = [[NSMutableArray alloc] initWithCapacity:[data count]];
            
            for (NSDictionary *dic  in data) {
                GaoDePoint *point = [[GaoDePoint alloc] init];
                [point convertObjectFromGievnDictionary:dic];
                
                NSRange range =[point.location rangeOfString:@","];
                CLLocationDegrees latitude = [[point.location substringToIndex:range.location] doubleValue];
                CLLocationDegrees longtitude = [[point.location substringFromIndex:range.location+1] doubleValue];
                CLLocationCoordinate2D coordinat = CLLocationCoordinate2DMake(latitude, longtitude);
                point.coordinate = coordinat;
                [annotions addObject:point];
                
            }
            [map addAnnotations:annotions];
            
        }
        
        
    }else{
        NSLog(@"It is Wrong ---------Reason is %@",msg);
    }
    
    
    
}
-(void)receiveError:(NSError *)_error{
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{

    if (![annotation isKindOfClass:[Annotation class]]) {
        return nil;
    }
    //
    
    static NSString *identifier = @"PinIdentifier";
    MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (annotationView == nil) {
        annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
    }
    return annotationView;
}


@end
