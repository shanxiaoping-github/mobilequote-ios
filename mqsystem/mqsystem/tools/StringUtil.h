//
//  StringUtil.h
//  mqsystem
//
//  Created by shanxiaoping on 14-12-27.
//  Copyright (c) 2014年 yicai. All rights reserved.
//
/*
 *字符串处理类
 */
#import <Foundation/Foundation.h>

@interface StringUtil : NSObject
/*
 *判断字符串是否为空
 */
+(BOOL)isEmpty:(NSString*)str;
/*
 *判断字符串为非空
 */
+(BOOL)isNoteEmpty:(NSString*)str;
/*获得对象类名*/
+(NSString*)getObjectClassName:(id)obj;

@end
