//
//  HttpEvent.m
//  mqsystem
//
//  Created by shanxiaoping on 15-1-31.
//  Copyright (c) 2015年 yicai. All rights reserved.
//

#import "HttpEvent.h"

@implementation HttpEvent
@synthesize actionUrl=_actionUrl;
@synthesize param=_param;
@synthesize callBack=_callBack;
-(void)addPrama:(NSString *)value key:(NSString *)key{
    if (!_param) {
        self.param = [NSMutableDictionary dictionary];
    }
    [_param setValue:value forKey:key];
}
@end
