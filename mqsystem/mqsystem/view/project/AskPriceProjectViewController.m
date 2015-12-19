//
//  AskPriceProjectViewController.m
//  mqsystem
//
//  Created by shanxiaoping on 15-1-14.
//  Copyright (c) 2015年 yicai. All rights reserved.
//

#import "AskPriceProjectViewController.h"
#import "ViewUtil.h"
#import "UserInfo.h"
#import "ProjectData.h"
#import "StoryContants.h"
#import "ProjectTableViewCell.h"
#import "HttpEvent.h"
#import "HttpAddress.h"
#import "HttpClientManager.h"
#import "AppDelegate.h"
#import "ProjectTypeContant.h"
#import "ProjectData.h"
#import "ResponseCode.h"
#import "ProjectDetailViewController.h"
#import "MBProgressHUDManager.h"
#import "MBProgressHUD.h"
@interface AskPriceProjectViewController ()<UITableViewDelegate,UITableViewDataSource,HttpCallBack>{
    NSMutableArray* projectDatas;
    MBProgressHUD* hud;
    
    
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UILabel *empty;

@end
@implementation AskPriceProjectViewController
@synthesize tableView=_tableView;
@synthesize empty=_empty;


- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *backButton = [ViewUtil genTopLeftButtonItemWithImage:@"com_icon_return_img" target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem=backButton;
    self.automaticallyAdjustsScrollViewInsets=NO;
    _tableView.separatorStyle = NO;
    _tableView.estimatedRowHeight = 60.f;
    
    
    
    projectDatas = [[NSMutableArray alloc]init];
    
    
    
//    ProjectData *data1 = [ProjectData new];
//    data1.title=@" 房屋建筑";
//    data1.endTime=@"  截止时间：2015-01-20 16:40";
//    data1.moneType=@"  人民币";
//    data1.serialNumber=@"  137198318361";
//
//    
//     ProjectData *data2 = [ProjectData new];
//    
//    data2.title=@" 房屋建筑";
//    data2.endTime=@"  截止时间：2015-01-20 16:40";
//    data2.moneType=@"  人民币";
//    data2.serialNumber=@"  137198318361";
//     ProjectData *data3 = [ProjectData new];
//    
//    data3.title=@" 房屋建筑";
//    data3.endTime=@"  截止时间：2015-01-20 16:40";
//    data3.moneType=@"  人民币";
//    data3.serialNumber=@"  137198318361";
//    
//    [projectDatas addObject:data1];
//    [projectDatas addObject:data2];
//    [projectDatas addObject:data3];
    
    UserInfo *userInfo = [AppDelegate getAppContext:@"UserInfo"];
    HttpEvent *askEvent = [HttpEvent new];
    askEvent.actionUrl= askproject;
    [askEvent addPrama:userInfo.idStr key:@"userId"];
    [askEvent addPrama:askProjectType key:@"type"];
    askEvent.callBack=self;
    
    [HttpClientManager sharedClient].event = askEvent;
    hud = [MBProgressHUDManager showLoad:self.view];
    
    [[HttpClientManager sharedClient] submitHttpEvent];
    
    

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
    [_tableView reloadData];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [projectDatas count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray* nibView =[[NSBundle mainBundle] loadNibNamed:@"ProjectTableViewCell" owner:nil options:nil];
    ProjectTableViewCell*  projectCell = [nibView objectAtIndex:0];
   
    ProjectData *data = [projectDatas objectAtIndex:indexPath.row];
    projectCell.title.text = [@" " stringByAppendingString:data.title];
    projectCell.endTime.text = [@" 截止时间:" stringByAppendingString:data.endTime];
    projectCell.projectNumber.text =[@" 项目编号:" stringByAppendingString:data.serialNumber];
    projectCell.moneyType.text=[@" 币种:" stringByAppendingString:data.moneType?data.moneType:@"人民币"];
    return  projectCell;
    


}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ProjectData *data = [projectDatas objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:product_Step sender:data];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
   ProjectDetailViewController* productController =  [segue destinationViewController];
    productController.projectData = sender;
    productController.type =askProjectType;
   
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return  UITableViewAutomaticDimension;
    
}
-(void)success:(AFHTTPRequestOperation *)operation response:(id)responseObject{
    [hud hide:YES];
    NSNumber* stautsNumber = responseObject[@"status"];
    NSString* status = [stautsNumber stringValue];
    if([status isEqualToString:@"0"]) {
        _empty.hidden=YES;
        NSArray* projectArray = [JsonFactory creatJsonDataArrayByArray:responseObject[@"projectInfo"] class:[ProjectData class]];
        [projectDatas addObjectsFromArray:projectArray];
        [_tableView reloadData];
    }else{
        _empty.hidden=NO;
        _empty.text=@"暂无项目";
    }
}
-(void)error:(AFHTTPRequestOperation *)operation error:(NSError *)error{
    [hud hide:YES];
}

@end
