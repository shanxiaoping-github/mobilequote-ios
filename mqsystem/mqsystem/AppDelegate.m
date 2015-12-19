//
//  AppDelegate.m
//  mqsystem
//
//  Created by shanxiaoping on 14-12-21.
//  Copyright (c) 2014年 yicai. All rights reserved.
//

#import "AppDelegate.h"
#import "StoryContants.h"
#import "StoryMacros.h"
#import "StringUtil.h"
#import "ChuaiGuo.h"
#import <Foundation/Foundation.h>
AppDelegate *instance=nil;
NSMutableDictionary *applacationContext=nil;


@implementation AppDelegate{
    NSMutableDictionary *applacationContext;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    instance = self;
    [self initWindow];
    [AppDelegate startStory:story_login];
    
    
    @try {
        NSString* token = @"0992688b248554a29db7cc236c27d826";
        [ChuaiGuo Begin:token];
    }
    @catch (NSException *exception) {
        return YES;
    }
    @finally {
        return YES;
    }
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/*
 *开启某个story首个controller
 */
+(void)startStory:(NSString *)storyName{
    if(!instance){
        return;
    }
    UIViewController *controller = storyControlleRootController(storyName);
    instance.window.rootViewController=controller;
    [instance.window makeKeyAndVisible];
}
/*
 *开启某个story的某个controller
 */
+(void)startStory:(NSString *)storyName :(NSString *)controllerName{
    if(!instance){
        return;
    }
    UIViewController* controller =
    storyController(storyName, controllerName);
    instance.window.rootViewController=controller;
    [instance.window makeKeyAndVisible];
}
/*
 *初始化窗口
 */
-(void)initWindow{
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
}
+(AppDelegate*)shareIntance{
    return instance;
}
+(void)addAppContext:(id)object{
    [AppDelegate addAppContext:object forkey:[StringUtil getObjectClassName:object]];
}
+(void)addAppContext:(id)object forkey:(NSString *)key{
    
    if (!applacationContext) {
        applacationContext = [NSMutableDictionary dictionary];
        
        
    }
    [applacationContext setObject:object forKey:key];
}
+(id)getAppContext:(NSString *)key{
    if (!applacationContext) {
        return nil;
    }
    return [applacationContext objectForKey:key];
}

- (void)exitApplication {
    UIWindow *window = self.window;
    
    [UIView animateWithDuration:1.0f animations:^{
        window.alpha = 0;
        window.frame = CGRectMake(0, window.bounds.size.width, 0, 0);
    } completion:^(BOOL finished) {
        exit(0);
    }];
    //exit(0);
    
}
@end
