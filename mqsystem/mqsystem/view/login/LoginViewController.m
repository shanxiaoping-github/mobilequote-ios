//
//  LoginViewController.m
//  mqsystem
//
//  Created by shanxiaoping on 14-12-27.
//  Copyright (c) 2014年 yicai. All rights reserved.
//

#import "LoginViewController.h"
#import "StringUtil.h"
#import "ShowUtil.h"
#import "StoryContants.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize userNameTextfield=_userNameTextfield;
@synthesize passWordTextfield=_passWordTextfield;


- (void)viewDidLoad {
    [super viewDidLoad];
    _userNameTextfield.returnKeyType=UIReturnKeyDone;
    _passWordTextfield.returnKeyType=UIReturnKeyDone;
    _passWordTextfield.secureTextEntry=YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}



- (IBAction)loginAct:(id)sender {
    
    NSString *userNameStr = _userNameTextfield.text;
    NSString *passWordStr = _passWordTextfield.text;
    
    if ([StringUtil isEmpty:userNameStr]) {
        [ShowUtil showAlert:@"输入提示" message:@"请输入用户名"];
        return;
        
    }
    if([StringUtil isEmpty:passWordStr]){
        [ShowUtil showAlert:@"输入提示" message:@"请输入密码"];
        return;
    }
    [self performSegueWithIdentifier:story_home_step sender:nil];
    
    
}
@end
