//
//  HttpRequest.h
//  TableTest
//
//  Created by Jian.Zhao on 14-1-22.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HttpRequestDelegate <NSObject>

@required
-(void)receiveError:(NSError *)_error;
-(void)receiveData:(NSData *)_data;

@end


@interface HttpRequest : NSOperation{

    
    
}
@property(nonatomic,assign)id<HttpRequestDelegate>delegate;
@property (nonatomic,retain) NSURLRequest *request;

-(id)initWithReuest:(NSURLRequest *)aRequest;

@end
