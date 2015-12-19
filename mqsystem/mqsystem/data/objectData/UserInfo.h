//
//  UserInfo.h
//  mqsystem
//
//  Created by shanxiaoping on 15-1-31.
//  Copyright (c) 2015年 yicai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsonFactory.h"
/*用户信息*/
@interface UserInfo : NSObject
@property(nonatomic,strong)NSString* idStr;
@property(nonatomic,strong)NSString* userName;
@property(nonatomic,strong)NSString* realName;

@end
