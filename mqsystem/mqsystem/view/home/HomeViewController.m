//
//  HomeViewController.m
//  mqsystem
//
//  Created by shanxiaoping on 14-12-27.
//  Copyright (c) 2014年 yicai. All rights reserved.
//

#import "HomeViewController.h"
#import "StoryContants.h"

@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize askPriceLable=_askPriceLable;
@synthesize endProjectLable=_endProjectLable;
@synthesize myselfInformationLable=_myselfInformationLable;
@synthesize tenderLable=_tenderLable;
@synthesize seacherProjectLable=_seacherProjectLable;
@synthesize aboutLable=_aboutLable;


- (void)viewDidLoad {
    [super viewDidLoad];
    //self.navigationController.navigationBarHidden=YES;
    
    
    /*询比价手势*/
    UITapGestureRecognizer* recognizer0= [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openAskPriceProject)];
    _askPriceLable.userInteractionEnabled=YES;
    [_askPriceLable addGestureRecognizer:recognizer0];
    
    
    /*结束手势*/
    UITapGestureRecognizer* recognizer1= [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openEndProject)];
    _endProjectLable.userInteractionEnabled=YES;
    [_endProjectLable addGestureRecognizer:recognizer1];
    
    
    /*个人信息*/
    UITapGestureRecognizer* recognizer2= [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openMyself)];
    _myselfInformationLable.userInteractionEnabled=YES;
    [_myselfInformationLable addGestureRecognizer:recognizer2];
    
    /*招投标*/
    UITapGestureRecognizer* recognizer3= [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openTenderProject)];
    _tenderLable.userInteractionEnabled=YES;
    [_tenderLable addGestureRecognizer:recognizer3];
    
    /*搜索项目*/
    UITapGestureRecognizer* recognizer4= [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openSeacherProject)];
    _seacherProjectLable.userInteractionEnabled=YES;
    [_seacherProjectLable addGestureRecognizer:recognizer4];
    
    
    /*关于*/
    UITapGestureRecognizer* recognizer5= [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openAbout)];
    _aboutLable.userInteractionEnabled=YES;
    [_aboutLable addGestureRecognizer:recognizer5];
    
   
    
    
    
  
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*打开询比价项目*/
-(void)openAskPriceProject{
    [self performSegueWithIdentifier:ask_price_step sender:nil];
  
}
/*打开结束的项目*/
-(void)openEndProject{
    [self performSegueWithIdentifier:end_project_step sender:nil];
}
/*打开个人信息*/
-(void)openMyself{
    [self performSegueWithIdentifier:my_self_step sender:nil];
}
/*打开招投标项目*/
-(void)openTenderProject{
    [self performSegueWithIdentifier:tender_project_step sender:nil];
}
/*打开搜索项目*/
-(void)openSeacherProject{
    [self performSegueWithIdentifier:seacher_project_step sender:nil];
}
/*打开关于*/
-(void)openAbout{
    [self performSegueWithIdentifier:about_step sender:nil];
}



-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden=YES;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
