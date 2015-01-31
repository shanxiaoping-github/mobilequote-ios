//
//  ProjectData.h
//  mqsystem
//
//  Created by shanxiaoping on 15-1-25.
//  Copyright (c) 2015年 yicai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsonFactory.h"

@interface ProjectData : NSObject<JsonData>

/*标题*/
@property(strong,nonatomic)NSString* title;
/*截止时间*/
@property(strong,nonatomic)NSString* endTime;
/*币种*/
@property(strong,nonatomic)NSString* moneType;
/*序列号*/
@property(strong,nonatomic)NSString* serialNumber;
/*项目类型*/
@property(nonatomic)NSNumber* type;
/*是否已经报价*/
@property(nonatomic)BOOL isCurrentQuote;
/*当前报价次数*/
@property(nonatomic,strong)NSNumber* currentNumber;
/*税率*/
@property(nonatomic,strong)NSNumber* rate;
@end
