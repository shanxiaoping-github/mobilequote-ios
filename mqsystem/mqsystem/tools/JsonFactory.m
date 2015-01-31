//
//  JsonFactory.m
//  apos-enterprise-ios
//
//  Created by shanxiaoping on 14-12-8.
//  Copyright (c) 2014年 cpz. All rights reserved.
//

#import "JsonFactory.h"
#import "JSONKit.h"
@implementation JsonFactory

+(NSArray *)creatJsonDataArray:(NSString *)jsonStr className:(Class)className{
    
    
    NSArray* jsonList = [jsonStr objectFromJSONString];
    return [JsonFactory creatJsonDataArray:jsonList class:className];
}
+(NSArray *)creatJsonDataArray:(NSArray *)jsonArray class:(Class)className{
    NSMutableArray *list = [NSMutableArray new];

    for(int i=0;i<[jsonArray count];i++) {
        NSDictionary *item = [jsonArray objectAtIndex:i];
        id<JsonData> jsonObj =  [className new];
        [jsonObj parse:item];
        [list addObject:jsonObj];
        
    }
    return list;

}

+(NSDictionary *)creatJsonDataItem:(NSString *)jsonStr{
    NSData* jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *item = [jsonData objectFromJSONData];
    return item;
}
+(id<JsonData>)creatJsonDataItem:(NSString *)jsonStr className:(Class)className{
     NSDictionary* item = [JsonFactory creatJsonDataItem:jsonStr];
    id<JsonData> jsonObj = [className new];
    [jsonObj parse:item];
    return jsonObj;

}
+(id<JsonData>)creatJsonDataItem:(NSDictionary *)jsonItem class:(Class)className{
    id<JsonData> jsonObj = [className new];
    [jsonObj parse:jsonItem];
    return jsonObj;
}




@end
