//
//  ProjectData.h
//  mqsystem
//
//  Created by shanxiaoping on 15-1-25.
//  Copyright (c) 2015年 yicai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProjectData : NSObject
/*标题*/
@property(strong,nonatomic)NSString* title;
/*截止时间*/
@property(strong,nonatomic)NSString* endTime;
/*币种*/
@property(strong,nonatomic)NSString* moneType;
/*序列号*/
@property(strong,nonatomic)NSString* serialNumber;
/*项目类型*/
@property(nonatomic)NSInteger* type;
/*是否已经报价*/
@property(nonatomic)BOOL isCurrentQuote;
@end
