//
//  ShowUtil.h
//  mqsystem
//
//  Created by shanxiaoping on 14-12-27.
//  Copyright (c) 2014年 yicai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/*
 *show工具类
 */
@interface ShowUtil : NSObject

/*
 *显示提示框
 */
+(UIAlertView*)showAlert:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTtile:(NSString *)cancleStr otherButtonTitles:(NSString *)otherStr style:(UIAlertViewStyle) style;

/*
 *显示提示框
 */
+(UIAlertView*)showAlert:(NSString*)title
         message:(NSString*)message
         delegate:(id)delegate
         cancelButtonTtile:(NSString*)cancleStr
         otherButtonTitles:(NSString*)otherStr;
/*
 *显示显示框
 */
+(UIAlertView*)showAlert:(NSString*)title message:(NSString*)message;
+(UIAlertView*)showAlert:(NSString*)message;
@end
