//
//  APSTopButton.m
//  apos-enterprise-ios
//
//  Created by cpz on 13-9-23.
//  Copyright (c) 2013年 cpz. All rights reserved.
//

#import "CommonTopButton.h"

@implementation CommonTopButton

@synthesize isRightButton;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}





- (UIEdgeInsets)alignmentRectInsets {
    UIEdgeInsets insets;
    
    
    double version = [[UIDevice currentDevice].systemVersion doubleValue];//判定系统版本。
    
    if(version <7.0f){

        if (isRightButton) {
            self.titleEdgeInsets = UIEdgeInsetsMake(0, 0.0f, 0, -8.0f);
            insets = UIEdgeInsetsMake(0, 0, 0, 9.0f);
            
        }
        else {
            insets = UIEdgeInsetsMake(0, -8.0f, 0, 0);
            
        }
        return insets;
    }else {
        
        return  [super alignmentRectInsets];
        
    }
    
    
    
 
}




@end
