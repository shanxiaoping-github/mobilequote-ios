//
//  StoryMacros.h
//  mqsystem
//
//  Created by shanxiaoping on 14-12-21.
//  Copyright (c) 2014年 yicai. All rights reserved.
//

#ifndef mqsystem_StoryMacros_h
#define mqsystem_StoryMacros_h
#define storyController(SRNAME,CLNAME) \
[[UIStoryboard storyboardWithName:SRNAME bundle:nil] instantiateViewControllerWithIdentifier:CLNAME]

#define storyControlleRootController(SRNAME) \
[[UIStoryboard storyboardWithName:SRNAME bundle:nil] instantiateInitialViewController]

#endif
