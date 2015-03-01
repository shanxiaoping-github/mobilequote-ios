//
//  ViewUtil.m
//  mqsystem
//
//  Created by shanxiaoping on 14-12-27.
//  Copyright (c) 2014年 yicai. All rights reserved.
//

#import "ViewUtil.h"
#import <Foundation/Foundation.h>
#import "CommonTopButton.h"
@implementation ViewUtil
+ (UIBarButtonItem*) genTopLeftButtonItemWithImage:(NSString*) imageName target:(id) target action:(SEL) action; {
    
    UIImage* image= [UIImage imageNamed:imageName];
    CGRect frame_1= CGRectMake(0, 0, image.size.width, image.size.height);
    CommonTopButton* meButton= [[CommonTopButton alloc] initWithFrame:frame_1];
    [meButton setBackgroundImage:image forState:UIControlStateNormal];
    [meButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* barButtonItem= [[UIBarButtonItem alloc] initWithCustomView:meButton];
    return barButtonItem;
}
/*获取nibview*/
+ (UIView*) getNibView:(NSString *)nibName{
    NSArray* nibView =[[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil];
    return [nibView objectAtIndex:0];
}

@end
