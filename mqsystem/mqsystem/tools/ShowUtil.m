//
//  ShowUtil.m
//  mqsystem
//
//  Created by shanxiaoping on 14-12-27.
//  Copyright (c) 2014年 yicai. All rights reserved.
//

#import "ShowUtil.h"
@implementation ShowUtil

+(UIAlertView*)showAlert:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTtile:(NSString *)cancleStr otherButtonTitles:(NSString *)otherStr{
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancleStr otherButtonTitles:otherStr, nil];
    
    [alertView show];
    return alertView;
    
}

+(UIAlertView*)showAlert:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTtile:(NSString *)cancleStr otherButtonTitles:(NSString *)otherStr style:(UIAlertViewStyle) style{
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancleStr otherButtonTitles:otherStr, nil];
    alertView.alertViewStyle = style;
    [alertView show];
    return alertView;
    
}

+(UIAlertView*)showAlert:(NSString *)title message:(NSString *)message{
    return [ShowUtil showAlert:title message:message delegate:nil cancelButtonTtile:@"确定" otherButtonTitles:nil];
}

+(UIAlertView *)showAlert:(NSString *)message{
    return [ShowUtil showAlert:nil message:message delegate:nil cancelButtonTtile:nil otherButtonTitles:nil];
}

@end

