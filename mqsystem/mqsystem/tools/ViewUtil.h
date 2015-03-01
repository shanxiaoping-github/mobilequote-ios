//
//  ViewUtil.h
//  mqsystem
//
//  Created by shanxiaoping on 14-12-27.
//  Copyright (c) 2014年 yicai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*
 *视图工具类
 */
@interface ViewUtil : NSObject

+ (UIBarButtonItem*) genTopLeftButtonItemWithImage:(NSString*) imageName target:(id) target action:(SEL) action;
/*从nib获取view*/
+(UIView*) getNibView:(NSString*)nibName;

@end
