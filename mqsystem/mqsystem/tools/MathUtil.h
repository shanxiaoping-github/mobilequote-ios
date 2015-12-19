//
//  MathUtil.h
//  mqsystem
//
//  Created by shanxiaoping on 15-1-26.
//  Copyright (c) 2015年 yicai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MathUtil : NSObject
/*number转nstring*/
+(NSString*)numberToString:(NSNumber*)number;
/*string转number*/
+(NSNumber*)stringToNumber:(NSString*)str;
/*判断是否是数字*/
+(BOOL)isNumber:(NSString *)str lastNumber:(NSInteger)lastNumber;
//是否是数字
+(BOOL)isNumberforObject:(id)object;
//获取字典每个下标的对象
+(id)getObjectForNSDictionary:(NSDictionary*)dic index:(NSInteger)index;
//获取字典每个下标的key
+(NSString*)getKeyForNSDictionary:(NSDictionary*)dic index:(NSInteger)index;
+(NSString*)decimalNumberMutiplyWithString:(NSString*)multiplierValue value2:(NSString*)multiplicandValue;
+(NSString*)decimalNumberDividingWithString:(NSString*)multiplierValue value2:(NSString*)multiplicandValue;
+(NSString*)decimalNumberAddWithString:(NSString*)multiplierValue value2:(NSString*)multiplicandValue;
+(float)decimalNumberTransferFloatWithString:(NSString*)multiplierValue;
+(double)decimalNumberTransferDoubleWithString:(NSString*)multiplierValue;
+(NSString*)decimalNumberTransferStringWithDouble:(double)multiplierValue;
+(NSString*)decimalNumberTransferStringWithFloat:(float)multiplierValue;

+(float)decimalNumberMutiplyWithFloat:(float)multiplierValue value2:(float)multiplicandValue;
+(double)decimalNumberMutiplyWithDouble:(double)multiplierValue value2:(double)multiplicandValue;

@end
