//
//  ProjectData.m
//  mqsystem
//
//  Created by shanxiaoping on 15-1-25.
//  Copyright (c) 2015年 yicai. All rights reserved.
//

#import "ProjectData.h"
#import "JsonFactory.h"
@implementation ProjectData
@synthesize title=_title;
@synthesize endTime=_endTime;
@synthesize moneType=_moneType;
@synthesize serialNumber=_serialNumber;
@synthesize type=_type;
@synthesize isCurrentQuote=_isCurrentQuote;
@synthesize currentNumber=_currentNumber;
@synthesize rate=_rate;
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"title":@"name"};
}
@end
