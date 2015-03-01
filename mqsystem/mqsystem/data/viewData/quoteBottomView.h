//
//  quoteBottomView.h
//  mqsystem
//
//  Created by shanxiaoping on 15-2-26.
//  Copyright (c) 2015年 yicai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface quoteBottomView : UIView
/*当前报价*/
@property (strong, nonatomic) IBOutlet UILabel *currentPrice;
/*上轮报价*/
@property (strong, nonatomic) IBOutlet UILabel *lastPrice;
/*税率*/
@property (strong, nonatomic) IBOutlet UILabel *rate;
/*当前轮次*/
@property (strong, nonatomic) IBOutlet UILabel *currentWheel;
/*报价*/
@property (strong, nonatomic) IBOutlet UILabel *quote;

@end
