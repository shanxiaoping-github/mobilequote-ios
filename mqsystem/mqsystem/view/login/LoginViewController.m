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

@interface LoginViewController ()<HttpCallBack>

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
    [httpClient submitHttpEvent];
    
    
    
}
-(void)success:(AFHTTPRequestOperation *)operation response:(id)responseObject{
    
    NSDictionary* result=[JsonFactory creatJsonDataItem:operation.responseString];
    NSNumber *status=[result objectForKey:@"status"];
    int statusValue = [status intValue];
    //UIAlertView* alertView=nil;
    
    
    if (statusValue == login_success) {
        NSDictionary* userItem = [result objectForKey:@"userInfo"];
        UserInfo* userInfo=[JsonFactory creatJsonDataItem:userItem class:[UserInfo class]];
        [AppDelegate addAppContext:userInfo];
        [self performSegueWithIdentifier:story_home_step sender:nil];
        
       // alertView = [ShowUtil showAlert:@"登录成功"];
    }else if(statusValue == login_did){
        //alertView = [ShowUtil showAlert:@"已登录"];
        
    }else if(statusValue ==login_faile){
       // alertView = [ShowUtil showAlert:@"登录失败"];
        
    }
    
//    [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(dismissAler:) userInfo:alertView repeats:NO];
    
 //   [self performSegueWithIdentifier:story_home_step sender:nil];
}
-(void)error:(AFHTTPRequestOperation *)operation error:(NSError *)error{
}
//-(void)dismissAler:(UIAlertView*)alerView{
//    [alerView dismissWithClickedButtonIndex:nil animated:NO];
//    //alerView=nil;
//}
@end
