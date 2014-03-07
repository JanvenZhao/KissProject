//
//  HttpRequest.m
//  TableTest
//
//  Created by Jian.Zhao on 14-1-22.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

#import "HttpRequest.h"

@implementation HttpRequest

-(id)initWithReuest:(NSURLRequest *)aRequest{

    if (self = [super init]) {
        //
        self.request = aRequest;
    }
    
    return self;
}

-(void)main {

    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:self.request returningResponse:&response error:&error];
    
    
    
    if (error) {
        [_delegate receiveError:error];
    }else{
        [_delegate receiveData:data];
    }
}



-(void)cancel{

    NSLog(@"The Opration Canceled");
}



@end
