//
//  ProjectData.m
//  mqsystem
//
//  Created by shanxiaoping on 15-1-25.
//  Copyright (c) 2015年 yicai. All rights reserved.
//

#import "ProjectData.h"
#import "JsonFactory.h"
@implementation ProjectData
@synthesize title=_title;
@synthesize endTime=_endTime;
@synthesize moneType=_moneType;
@synthesize serialNumber=_serialNumber;
@synthesize type=_type;
@synthesize isCurrentQuote=_isCurrentQuote;
@synthesize currentNumber=_currentNumber;
@synthesize rate=_rate;

//currentNumber = 1;
//endTime = "2015-03-31 17:22:34";
//isCurrentQuote = 0;
//moneyType = "\U4eba\U6c11\U5e01";
//name = "5\U4f4d\U5c0f\U6570\U6d4b\U8bd5";
//rate = 17;
//serialNumber = "PUR-C20150331001";
//type = 2;

-(void)parse:(NSDictionary *)object{

    self.type = [object objectForKey:@"type"];
    self.isCurrentQuote =[object objectForKey:@"isCurrentQuote"];
    self.currentNumber = [object objectForKey:@"currentNumber"];
    self.serialNumber = [object objectForKey:@"serialNumber"];
    self.title=[object objectForKey:@"name"];
    self.endTime=[object objectForKey:@"endTime"];
    self.moneType=[object objectForKey:@"moneyType"];
    self.rate=[object objectForKey:@"rate"];
    
}
@end
