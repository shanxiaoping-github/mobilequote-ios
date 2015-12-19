//
//  Product.h
//  mqsystem
//
//  Created by shanxiaoping on 15-1-25.
//  Copyright (c) 2015年 yicai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsonFactory.h"
@interface Product : NSObject
@property(nonatomic,strong)NSString* number;
@property(nonatomic,strong)NSString* serialNumber;
@property(nonatomic,strong)NSString* productName;
@property(nonatomic,strong)NSString* unit;
@property(nonatomic,strong)NSString* lastPrice;
@property(nonatomic,strong)NSString* currentPrice;
@property(nonatomic,strong)NSString* rate;
@property(nonatomic,strong)NSString* describe;
@property(nonatomic,strong)NSString* rule;
@property(nonatomic,strong)NSString* lastRank;
@property(nonatomic,strong)NSString* currentRank;
/*是否价格有变动*/
-(BOOL)isChangePrice:(int)quoteNumber;
@end
