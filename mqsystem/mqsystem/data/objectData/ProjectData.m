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
