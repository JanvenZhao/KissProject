//
//  DesignPatterns.h
//  TableTest
//
//  Created by Jian.Zhao on 14-1-22.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HttpRequest.h"

@interface DesignPatterns : UIViewController<HttpRequestDelegate>{

    NSOperationQueue *_queue;
    
}

@end
