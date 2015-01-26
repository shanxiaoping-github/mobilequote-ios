//
//  StringUtil.m
//  mqsystem
//
//  Created by shanxiaoping on 14-12-27.
//  Copyright (c) 2014年 yicai. All rights reserved.
//

#import "StringUtil.h"

@implementation StringUtil

+(BOOL)isEmpty:(NSString *)str{
    
    if(!str){
        return true;
    }
    if([str isEqualToString:@""]||[str isEqualToString:@" "]){
        return true;
    }
    return false;
}
+(BOOL)isNoteEmpty:(NSString *)str{
    if([StringUtil isEmpty:str]){
        return false;
    }
    return true;
}

@end
