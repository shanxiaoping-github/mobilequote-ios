//
//  ProjectCell.h
//  mqsystem
//
//  Created by shanxiaoping on 15-1-25.
//  Copyright (c) 2015年 yicai. All rights reserved.
//
/*项目cell*/
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ProjectCell :UITableViewCell
/*标题*/
@property (strong, nonatomic) IBOutlet UILabel *title;
/*截止时间*/
@property (strong, nonatomic) IBOutlet UILabel *endTime;
/*项目编号*/
@property (strong, nonatomic) IBOutlet UILabel *projectNumber;
/*币种*/
@property (strong, nonatomic) IBOutlet UILabel *moneyType;
@end
