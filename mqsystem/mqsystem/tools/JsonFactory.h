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
-(NSString*)page;

@end

@interface JsonFactory : NSObject
+(NSArray*)creatJsonDataArray:(NSString*)jsonStr className:(Class)className;
@end
