//
//  JsonFactory.h
//  apos-enterprise-ios
//
//  Created by shanxiaoping on 14-12-8.
//  Copyright (c) 2014年 cpz. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JsonData <NSObject>
@required
-(void)parse:(NSDictionary*) object;
@optional
-(NSDictionary*)page;

@end

@interface JsonFactory : NSObject

+(NSArray*)creatJsonDataArray:(NSString*)jsonStr className:(Class)className;
+(NSArray*)creatJsonDataArray:(NSArray*)jsonArray class:(Class)className;

+(NSDictionary*)creatJsonDataItem:(NSString*)jsonStr;
+(id<JsonData>)creatJsonDataItem:(NSString*)jsonStr className:(Class)className;
+(id<JsonData>)creatJsonDataItem:(NSDictionary*)jsonItem class:(Class)className;

+(NSString*)pageJsonDataItem:(id<JsonData>)dataItem;
+(NSString*)pageJsonDataArry:(NSArray*)datas;
@end
