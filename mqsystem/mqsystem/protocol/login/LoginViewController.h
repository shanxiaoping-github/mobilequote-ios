//
//  LoginViewController.h
//  mqsystem
//
//  Created by shanxiaoping on 14-12-21.
//  Copyright (c) 2014年 yicai. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
 *登录界面
 */
@interface LoginViewController : UIViewController<UITextFieldDelegate>

/*用户名*/
@property (strong, nonatomic) IBOutlet UITextField *loginTextField;
/*密码*/
@property (strong, nonatomic) IBOutlet UITextField *passWordTextField;
/*登录*/
- (IBAction)loginAction:(id)sender;
@end
