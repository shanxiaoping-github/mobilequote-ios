//
//  UserInfo.m
//  mqsystem
//
//  Created by shanxiaoping on 15-1-31.
//  Copyright (c) 2015年 yicai. All rights reserved.
//

#import "UserInfo.h"
#import "MJExtension.h"
@implementation UserInfo
@synthesize idStr=_idStr;
@synthesize userName=_userName;
@synthesize realName=_realName;
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"idStr":@"id"};
}

@end
