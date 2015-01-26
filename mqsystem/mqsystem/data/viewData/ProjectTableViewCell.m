//
//  ProjectTableViewCell.m
//  mqsystem
//
//  Created by shanxiaoping on 15-1-26.
//  Copyright (c) 2015年 yicai. All rights reserved.
//

#import "ProjectTableViewCell.h"

@implementation ProjectTableViewCell

@synthesize title=_title;
@synthesize endTime=_endTime;
@synthesize projectNumber=_projectNumber;
@synthesize moneyType=_moneyType;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
