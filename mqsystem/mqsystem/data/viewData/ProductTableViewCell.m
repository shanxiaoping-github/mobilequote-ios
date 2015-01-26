//
//  ProductTableViewCell.m
//  mqsystem
//
//  Created by shanxiaoping on 15-1-25.
//  Copyright (c) 2015年 yicai. All rights reserved.
//

#import "ProductTableViewCell.h"

@implementation ProductTableViewCell

@synthesize productName=_productName;
@synthesize unit=_unit;
@synthesize productNumber=_productNumber;
@synthesize productsRule=_productsRule;
@synthesize currentPrice=_currentPrice;
@synthesize currentTotal=_currentTotal;
@synthesize lastPrice=_lastPrice;
@synthesize lastTotal=_lastTotal;
@synthesize currentRanking=_currentRanking;
@synthesize lastRanking=_lastRanking;

- (void)awakeFromNib {
    // Initialization code
    NSLog(@"djakhdkahdaskdgasjdgaksgdjasgdjas");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//+(ProductTableViewCell *)loadNib:(NSString *)nibName{
//   return [[NSBundle mainBundle] loadNibNamed:@"ProductTableViewCell" owner:self options:nil];
//}
@end
