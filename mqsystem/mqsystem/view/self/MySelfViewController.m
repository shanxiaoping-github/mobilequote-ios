//
//  MySelfViewController.m
//  mqsystem
//
//  Created by shanxiaoping on 15-1-14.
//  Copyright (c) 2015年 yicai. All rights reserved.
//

#import "MySelfViewController.h"
#import "ViewUtil.h"
#import "UserInfo.h"
#import "AppDelegate.h"
#import "ShowUtil.h"

@interface MySelfViewController ()<UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UILabel *realName;

@end

@implementation MySelfViewController
@synthesize realName=_realName;

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *backButton = [ViewUtil genTopLeftButtonItemWithImage:@"com_icon_return_img" target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem=backButton;
    
    UserInfo *userInfo =[AppDelegate getAppContext:@"UserInfo"];
    _realName.text = userInfo.realName;
    

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden=NO;
}
/*退出软件*/
- (IBAction)outApp:(id)sender {
    [ShowUtil showAlert:@"退出软件" message:@"确定要退出软件" delegate:self cancelButtonTtile:@"取消"otherButtonTitles:@"确定"];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==1) {
        [[AppDelegate shareIntance] exitApplication];
    }
}
@end
