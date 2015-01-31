//
//  UserInfo.m
//  mqsystem
//
//  Created by shanxiaoping on 15-1-31.
//  Copyright (c) 2015年 yicai. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo
@synthesize idStr=_idStr;
@synthesize userName=_userName;
@synthesize realName=_realName;

-(void)parse:(NSDictionary *)object{
    self.idStr=[object objectForKey:@"id"];
    self.userName=[object objectForKey:@"userName"];
    self.realName=[object objectForKey:@"realName"];
}
@end
