//
//  MathUtil.h
//  mqsystem
//
//  Created by shanxiaoping on 15-1-26.
//  Copyright (c) 2015年 yicai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MathUtil : NSObject
/*number转nstring*/
+(NSString*)numberToString:(NSNumber*)number;
/*string转number*/
+(NSNumber*)stringToNumber:(NSString*)str;
@end