//
//  ProjectTableViewCell.h
//  mqsystem
//
//  Created by shanxiaoping on 15-1-26.
//  Copyright (c) 2015年 yicai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProjectTableViewCell : UITableViewCell

/*标题*/
@property (strong, nonatomic) IBOutlet UILabel *title;
/*截止时间*/
@property (strong, nonatomic) IBOutlet UILabel *endTime;
/*项目编号*/
@property (strong, nonatomic) IBOutlet UILabel *projectNumber;
/*币种*/
@property (strong, nonatomic) IBOutlet UILabel *moneyType;


@end
