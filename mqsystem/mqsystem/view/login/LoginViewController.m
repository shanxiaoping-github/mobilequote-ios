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
#import "HttpAddress.h"
#import "HttpEvent.h"
#import "HttpClientManager.h"
#import "JsonFactory.h"
#import "ResponseCode.h"
#import "ShowUtil.h"
#import <UIKit/UIKit.h>
#import "UserInfo.h"
#import "AppDelegate.h"
#import "MBProgressHUDManager.h"
#import "MBProgressHUD.h"
@interface LoginViewController ()<HttpCallBack>{
    MBProgressHUD* hud;
}

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
    
     //登录
    HttpEvent *loginEvent =[HttpEvent new];
    loginEvent.actionUrl=login;
    [loginEvent addPrama:userNameStr key:@"userName"];
    [loginEvent addPrama:passWordStr key:@"passWord"];
    loginEvent.callBack=self;
    HttpClientManager* httpClient = [HttpClientManager sharedClient];
    httpClient.event = loginEvent;
    hud = [MBProgressHUDManager showLoad:@"登录中..." view:self.view];
    [httpClient submitHttpEvent];
    
    
    
}
-(void)success:(AFHTTPRequestOperation *)operation response:(id)responseObject{
    [hud hide:YES];
    NSDictionary* result=[JsonFactory creatJsonDataItem:operation.responseString];
    NSNumber *status=[result objectForKey:@"status"];
    int statusValue = [status intValue];
    if (statusValue == login_success) {
        NSDictionary* userItem = [result objectForKey:@"userInfo"];
        UserInfo* userInfo=[JsonFactory creatJsonDataItem:userItem class:[UserInfo class]];
        [AppDelegate addAppContext:userInfo];
        
        [self performSegueWithIdentifier:story_home_step sender:nil];
    }else if(statusValue == login_did){
        [MBProgressHUDManager showMessage:@"已登录" view:self.view];
    }else{
        [MBProgressHUDManager showMessage:@"用户名和密码错误" view:self.view];
    }
}
-(void)error:(AFHTTPRequestOperation *)operation error:(NSError *)error{
    [hud hide:YES];
}
@end
