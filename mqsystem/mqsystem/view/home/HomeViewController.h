//
//  HomeViewController.h
//  mqsystem
//
//  Created by shanxiaoping on 14-12-27.
//  Copyright (c) 2014年 yicai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController
/*询比价标签*/
@property (strong, nonatomic) IBOutlet UILabel *askPriceLable;

/*招投标标签*/
@property (strong, nonatomic) IBOutlet UILabel *tenderLable;
/*我的信息*/
@property (strong, nonatomic) IBOutlet UILabel *myselfInformationLable;

/*截止的项目*/
@property (strong, nonatomic) IBOutlet UILabel *endProjectLable;
/*搜索项目*/
@property (strong, nonatomic) IBOutlet UILabel *seacherProjectLable;
/*关于*/
@property (strong, nonatomic) IBOutlet UILabel *aboutLable;
@end
