//
//  HttpClientManager.h
//  mqsystem
//
//  Created by shanxiaoping on 15-1-31.
//  Copyright (c) 2015年 yicai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpEvent.h"
/*客户端发起服务管理*/
@interface HttpClientManager : NSObject
/*httpEvent请求*/
@property(nonatomic,strong)HttpEvent *event;
/*获得单例*/
+(instancetype) sharedClient;
/*提交httpEven事件*/
-(void)submitHttpEvent;


@end
