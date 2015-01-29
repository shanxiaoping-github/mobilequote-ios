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
    NSMutableArray *list = [NSMutableArray new];
    
    NSArray* jsonList = [jsonStr objectFromJSONString];
    for(int i=0;i<[jsonList count];i++) {
        NSDictionary *item = [jsonList objectAtIndex:i];
        id<JsonData> jsonObj =  [className new];
        [jsonObj parse:item];
        [list addObject:jsonObj];
        
    }
    return list;
    
}

@end
