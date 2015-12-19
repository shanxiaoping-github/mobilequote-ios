//
//  Product.m
//  mqsystem
//
//  Created by shanxiaoping on 15-1-25.
//  Copyright (c) 2015年 yicai. All rights reserved.
//

#import "Product.h"

@implementation Product
@synthesize number=_number;
@synthesize serialNumber=_serialNumber;
@synthesize productName=_productName;
@synthesize unit=_unit;
@synthesize lastPrice=_lastPrice;
@synthesize currentPrice=_currentPrice;
@synthesize rate=_rate;
@synthesize describe=_describe;
@synthesize rule=_rule;
@synthesize lastRank=_lastRank;
@synthesize currentRank=_currentRank;

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"productName":@"name",@"rule":@"specifications"};
}
-(BOOL)isChangePrice:(int)quoteNumber{
    if (quoteNumber == 1) {
        return YES;
    }
    float currentPriceFloat = [_currentPrice floatValue];
    float lastPriceFloat = [_lastPrice floatValue];
    if (currentPriceFloat-lastPriceFloat == 0) {
        return NO;
    }
    return YES;
}
@end
