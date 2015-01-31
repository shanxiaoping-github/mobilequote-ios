//
//  AppDelegate.h
//  mqsystem
//
//  Created by shanxiaoping on 14-12-21.
//  Copyright (c) 2014年 yicai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
/*
 *开始某个story
 */
+(void)startStory:(NSString*)storyName;

+(void)startStory:(NSString*)storyName:(NSString*)controllerName;
/*获取实例*/
+(AppDelegate*)shareIntance;
/*添加上下文对象*/
+(void)addAppContext:(id)object;
+(void)addAppContext:(id)object forkey:(NSString*) key;
+(id)getAppContext:(NSString*)key;
-(void)exitApplication;
@end

