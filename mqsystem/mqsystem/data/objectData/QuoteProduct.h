//
//  QuoteProduct.h
//  mqsystem
//
//  Created by shanxiaoping on 15-3-2.
//  Copyright (c) 2015年 yicai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsonFactory.h"
@interface QuoteProduct : NSObject
/*序列号*/
@property(nonatomic,strong)NSString* serialNumber;
/*当前单价*/
@property(nonatomic,strong)NSString* price;
/*产品税率*/
@property(nonatomic,strong)NSString* rate;
-(NSDictionary *)page;
@end
