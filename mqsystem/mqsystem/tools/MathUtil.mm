//
//  MathUtil.m
//  mqsystem
//
//  Created by shanxiaoping on 15-1-26.
//  Copyright (c) 2015年 yicai. All rights reserved.
//

#import "MathUtil.h"
#import <Foundation/Foundation.h>

@implementation MathUtil
+(NSString *)numberToString:(NSNumber *)number{
    NSNumberFormatter* numberFormatter = [NSNumberFormatter new];
    return [numberFormatter stringFromNumber:number];
}
+(NSNumber *)stringToNumber:(NSString *)str{
    NSNumberFormatter *numberFormatter = [NSNumberFormatter new];
    return [numberFormatter numberFromString:str];
}
+(BOOL)isNumber:(NSString *)str lastNumber:(NSInteger)lastNumber{
	if (!str) {
		return NO;
	}
	if ([str isEqualToString:@""]||[str isEqualToString:@" "]) {
		return NO;
	}
	int count = 0;
	for (int i = 0; i < str.length;i++) {
		char ch = [str characterAtIndex:i];
		if (!(ch >= 48&&ch <= 57)) {
            if (ch!='.') {
				return NO;
			}else{
				count++;
                if (count > 1) {
                    return NO;
                }
                if (i == str.length - 1) {
                    return NO;
                }
                if (i == 0) {
                    return NO;
                }
                
			}
		}
	}
	return YES;

}

+(BOOL)isNumberforObject:(id)object{
    @try{
        [object doubleValue];
    }@catch(NSException *exception){
        return NO;
    }
    return YES;
}
+(id)getObjectForNSDictionary:(NSDictionary*)dic index:(NSInteger)index{
    NSEnumerator * enumeratorValue = [dic objectEnumerator];
    int i = 0;
    for (NSObject *object in enumeratorValue) {
        if ((i++) == index&&object) {
            return object;
        }
    }
    return nil;
}
+(NSString *)getKeyForNSDictionary:(NSDictionary *)dic index:(NSInteger)index{
    NSEnumerator * enumeratorKey = [dic keyEnumerator];
    int i = 0;
    for (NSString *key in enumeratorKey) {
        if ((i++) == index&&key) {
            return key;
        }
    }
    return @"";
}
+(NSString*)decimalNumberMutiplyWithString:(NSString*)multiplierValue value2:(NSString*)multiplicandValue{
	NSDecimalNumber *multiplierNumber = [NSDecimalNumber decimalNumberWithString:multiplierValue];
	NSDecimalNumber *multiplicandNumber = [NSDecimalNumber decimalNumberWithString:multiplicandValue];
	NSDecimalNumber *product = [multiplicandNumber decimalNumberByMultiplyingBy:multiplierNumber];
	return [product stringValue];
}
+(NSString*)decimalNumberDividingWithString:(NSString*)multiplierValue value2:(NSString*)multiplicandValue{
	NSDecimalNumber *multiplierNumber = [NSDecimalNumber decimalNumberWithString:multiplierValue];
	NSDecimalNumber *multiplicandNumber = [NSDecimalNumber decimalNumberWithString:multiplicandValue];
	NSDecimalNumber *product = [multiplierNumber decimalNumberByDividingBy:multiplicandNumber];
	return [product stringValue];
}
+(NSString *)decimalNumberAddWithString:(NSString *)multiplierValue value2:(NSString *)multiplicandValue{
    NSDecimalNumber *multiplierNumber = [NSDecimalNumber decimalNumberWithString:multiplierValue];
    NSDecimalNumber *multiplicandNumber = [NSDecimalNumber decimalNumberWithString:multiplicandValue];
    NSDecimalNumber *product = [multiplierNumber decimalNumberByAdding:multiplicandNumber];
    return [product stringValue];

}

+(float)decimalNumberTransferFloatWithString:(NSString*)multiplierValue{
	NSDecimalNumber *multiplierNumber = [NSDecimalNumber decimalNumberWithString:multiplierValue];
	return [multiplierNumber floatValue];
}
+(double)decimalNumberTransferDoubleWithString:(NSString*)multiplierValue{
	NSDecimalNumber *multiplierNumber = [NSDecimalNumber decimalNumberWithString:multiplierValue];
	return [multiplierNumber doubleValue];
}
+(NSString*)decimalNumberTransferStringWithDouble:(double)multiplierValue{
	NSDecimalNumber *multiplierNumber = [[NSDecimalNumber alloc]initWithDouble:multiplierValue];
	return [multiplierNumber stringValue];
}
+(NSString*)decimalNumberTransferStringWithFloat:(float)multiplierValue{
	NSDecimalNumber *multiplierNumber = [[NSDecimalNumber alloc]initWithFloat:multiplierValue];
	return [multiplierNumber stringValue];
}
+(float)decimalNumberMutiplyWithFloat:(float)multiplierValue value2:(float)multiplicandValue{
	NSDecimalNumber *multiplierNumber = [[NSDecimalNumber alloc]initWithFloat:multiplierValue];
	NSDecimalNumber *multiplicandNumber = [[NSDecimalNumber alloc]initWithFloat:multiplicandValue];
	NSDecimalNumber *product = [multiplierNumber decimalNumberByMultiplyingBy:multiplicandNumber];
	return [product floatValue];
}
+(double)decimalNumberMutiplyWithDouble:(double)multiplierValue value2:(double)multiplicandValue{
	NSDecimalNumber *multiplierNumber = [[NSDecimalNumber alloc]initWithDouble:multiplierValue];
	NSDecimalNumber *multiplicandNumber = [[NSDecimalNumber alloc]initWithDouble:multiplicandValue];
	NSDecimalNumber *product = [multiplierNumber decimalNumberByMultiplyingBy:multiplicandNumber];
	return [product doubleValue];
}
@end
