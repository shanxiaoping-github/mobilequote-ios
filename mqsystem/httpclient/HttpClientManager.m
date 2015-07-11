//
//  HttpClientManager.m
//  mqsystem
//
//  Created by shanxiaoping on 15-1-31.
//  Copyright (c) 2015年 yicai. All rights reserved.
//

#import "HttpClientManager.h"
#import "HttpEvent.h"
#import "AFHTTPRequestOperationManager.h"
#import "HttpAddress.h"



@implementation HttpClientManager
@synthesize event=_event;
/*获取单例*/
+(instancetype)sharedClient{
    static HttpClientManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [HttpClientManager new];
    });
    
    
    
    return instance;
}
/*获得地址*/
+(NSString*)getUrl:(NSString*)actionUrl{
    return [baseUser stringByAppendingString:actionUrl];
}
/*提交请求*/
-(void)submitHttpEvent{

    
    if (_event) {
        AFHTTPRequestOperationManager  *afhManager = [AFHTTPRequestOperationManager manager];
        [afhManager GET:[HttpClientManager getUrl:_event.actionUrl] parameters:_event.param success:^(AFHTTPRequestOperation *operation, id responseObject) {
            [_event.callBack success:operation response:responseObject];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error){
            [_event.callBack error:operation error:error];
        }];
        
    }
}
@end
