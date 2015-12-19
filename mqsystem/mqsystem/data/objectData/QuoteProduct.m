//
//  QuoteProduct.m
//  mqsystem
//
//  Created by shanxiaoping on 15-3-2.
//  Copyright (c) 2015年 yicai. All rights reserved.
//
/*报价产品*/
#import "QuoteProduct.h"
@implementation QuoteProduct
@synthesize serialNumber=_serialNumber;
@synthesize price=_price;
@synthesize rate=_rate;
-(NSDictionary *)page{
    NSMutableDictionary* dic = [NSMutableDictionary dictionary];
    [dic setValue:_serialNumber forKey:@"serialNumber"];
    [dic setValue:_price forKey:@"price"];
    [dic setValue:_rate forKey:@"rate"];
    return dic;
}
@end
