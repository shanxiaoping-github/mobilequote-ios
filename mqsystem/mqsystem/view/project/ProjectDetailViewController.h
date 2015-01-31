//
//  ProjectDetailViewController.h
//  mqsystem
//
//  Created by shanxiaoping on 15-1-25.
//  Copyright (c) 2015年 yicai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProjectData.h"
/*项目详情－产品列表*/
@interface ProjectDetailViewController : UIViewController
@property(nonatomic,strong)ProjectData *projectData;
@property(nonatomic,strong)NSString* type;


@end
