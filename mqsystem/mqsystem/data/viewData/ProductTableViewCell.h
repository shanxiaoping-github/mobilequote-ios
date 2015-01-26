//
//  ProductTableViewCell.h
//  mqsystem
//
//  Created by shanxiaoping on 15-1-25.
//  Copyright (c) 2015年 yicai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductTableViewCell : UITableViewCell
/*产品标题*/
@property (strong, nonatomic) IBOutlet UILabel *productName;
/*单位*/
@property (strong, nonatomic) IBOutlet UILabel *unit;
/*产品序列号*/
@property (strong, nonatomic) IBOutlet UILabel *productNumber;
/*产品规格*/
@property (strong, nonatomic) IBOutlet UILabel *productsRule;
/*当前报价*/
@property (strong, nonatomic) IBOutlet UILabel *currentPrice;
/*当前小计*/
@property (strong, nonatomic) IBOutlet UILabel *currentTotal;
/*上次报价*/
@property (strong, nonatomic) IBOutlet UILabel *lastPrice;
/*上次小计*/
@property (strong, nonatomic) IBOutlet UILabel *lastTotal;
/*当前排名*/
@property (strong, nonatomic) IBOutlet UILabel *currentRanking;
/*上次排名*/
@property (strong, nonatomic) IBOutlet UILabel *lastRanking;
//+(ProductTableViewCell*)loadNib:(NSString*)nibName;
@end
