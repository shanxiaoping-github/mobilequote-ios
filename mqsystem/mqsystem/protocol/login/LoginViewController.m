//
//  LoginViewController.m
//  mqsystem
//
//  Created by shanxiaoping on 14-12-21.
//  Copyright (c) 2014年 yicai. All rights reserved.
//

#import "LoginViewController.h"
#import "StringUtil.h"
#import "ShowUtil.h"
#import "StoryContants.h"


@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize loginTextField=_loginTextField;
@synthesize passWordTextField=_passWordTextField;

- (void)viewDidLoad {
    [super viewDidLoad];
    _loginTextField.returnKeyType=UIReturnKeyDone;
    _passWordTextField.returnKeyType=UIReturnKeyDone;
    _passWordTextField.secureTextEntry=YES;
    

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [_loginTextField resignFirstResponder];
    [_passWordTextField resignFirstResponder];
    return true;
}
/*登录*/
- (IBAction)loginAction:(id)sender {
    NSString *userName = _loginTextField.text;
    NSString *passWord = _passWordTextField.text;
    
    if ([StringUtil isEmpty:userName]) {
        [ShowUtil showAlert:@"提示" message:@"请输入用户名"];
        return;
    }
    if([StringUtil isEmpty:passWord]){
        [ShowUtil showAlert:@"提示" message:@"请输入密码"];
        return;
    }
    [self performSegueWithIdentifier:story_home_step sender:nil];
     
    
}
@end
