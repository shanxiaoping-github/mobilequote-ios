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

@end

