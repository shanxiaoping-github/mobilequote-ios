//
//  Product.h
//  mqsystem
//
//  Created by shanxiaoping on 15-1-25.
//  Copyright (c) 2015年 yicai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsonFactory.h"
@interface Product : NSObject<JsonData>
@property(nonatomic,strong)NSNumber* number;
@property(nonatomic,strong)NSString* serialNumber;
@property(nonatomic,strong)NSString* productName;
@property(nonatomic,strong)NSString* unit;
@property(nonatomic,strong)NSNumber* lastPrice;
@property(nonatomic,strong)NSNumber* currentPrice;
@property(nonatomic,strong)NSNumber* rate;
@property(nonatomic,strong)NSString* describe;
@property(nonatomic,strong)NSString* rule;
@property(nonatomic,strong)NSString* lastRank;
@property(nonatomic,strong)NSString* currentRank;
@end
