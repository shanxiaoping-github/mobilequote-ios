//
//  TimeUtil.h
//  mqsystem
//
//  Created by shanxiaoping on 15-3-2.
//  Copyright (c) 2015年 yicai. All rights reserved.
//
/*时间处理*/
#import <Foundation/Foundation.h>
#define DATA1 @"yyyy-MM-dd HH:mm:ss"

@interface TimeUtil : NSObject
/*时间转为字符串形式*/
+(NSString*)nsDataToString:(NSData*)data format:(NSString*)formatString;
/*字符串转为日期*/
+(NSDate*)stringToNsData:(NSString*)dataString format:(NSString*)formatString;
/*判断两个日期的大小 */
+(NSInteger)compareData:(NSDate*)data1 toData:(NSDate*)data2;


@end
