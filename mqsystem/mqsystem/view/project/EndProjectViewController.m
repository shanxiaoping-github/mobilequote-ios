//
//  EndProjectViewController.m
//  mqsystem
//
//  Created by shanxiaoping on 15-1-14.
//  Copyright (c) 2015年 yicai. All rights reserved.
//

#import "EndProjectViewController.h"
#import "ViewUtil.h"
#import "ProjectData.h"
#import "ProjectCell.h"
#import "StoryContants.h"
#import "ProjectTableViewCell.h"
#import "HttpAddress.h"
#import "HttpClientManager.h"
#import "HttpEvent.h"
#import "UserInfo.h"
#import "AppDelegate.h"
#import "ProjectTypeContant.h"
#import "ResponseCode.h"
#import "ProjectDetailViewController.h"
#import "MBProgressHUDManager.h"
#import "MBProgressHUD.h"
@interface EndProjectViewController ()<UITableViewDataSource,UITableViewDelegate,HttpCallBack>{
  NSMutableArray *projectDatas;
  NSInteger index;
  MBProgressHUD* hud;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) IBOutlet UILabel *empty;
@end

@implementation EndProjectViewController
@synthesize tableView=_tableView;
@synthesize empty=_empty;
- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *backButton = [ViewUtil genTopLeftButtonItemWithImage:@"com_icon_return_img" target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem=backButton;
    
    
    NSArray *array = [NSArray arrayWithObjects:@"询比价",@"招投标", nil];
    UISegmentedControl *segmentedController = [[UISegmentedControl alloc] initWithItems:array];
    segmentedController.segmentedControlStyle = UISegmentedControlSegmentCenter;
    [segmentedController addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = segmentedController;
    segmentedController.selectedSegmentIndex=0;
    
    
    _tableView.separatorStyle = NO;
    _tableView.estimatedRowHeight = 60.f;
    //_tableView.rowHeight=UITableViewAutomaticDimension;
    self.automaticallyAdjustsScrollViewInsets=NO;
    projectDatas = [[NSMutableArray alloc]init];
    index=0;
    [self getProject:0];
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
   // UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"cell"];
   // ProjectCell *projectCell = (ProjectCell*)cell;
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
    if (index==0) {
        productController.type = end_ask_projectType;
    }else{
        productController.type = end_bidd_projectType;
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return  UITableViewAutomaticDimension;
    
}

-(void)segmentAction:(id)sender{
    
     index = [sender selectedSegmentIndex];
    _empty.hidden=NO;
    [projectDatas removeAllObjects];
    [self getProject:index];
}

-(void)getProject:(int) index{
    NSString* url = end_ask_project;
    NSString* type = askProjectType;
    if(index == 0) {
        type = askProjectType;
        url = end_ask_project;
    }else{
        type = biddingProjectType;
        url = end_biding_project;
    }
    UserInfo *userInfo = [AppDelegate getAppContext:@"UserInfo"];
    HttpEvent *endEvent = [HttpEvent new];
    endEvent.actionUrl = url;
    [endEvent addPrama:userInfo.idStr key:@"userId"];
    [endEvent addPrama:type key:@"type"];
    endEvent.callBack=self;
    [HttpClientManager sharedClient].event = endEvent;
    if (hud) {
        [hud show:YES];
    }else{
        hud = [MBProgressHUDManager showLoad:self.view];
    }
    [[HttpClientManager sharedClient] submitHttpEvent];
    
}

-(void)success:(AFHTTPRequestOperation *)operation response:(id)responseObject{
    [hud hide:YES];
    NSDictionary* dic = [JsonFactory creatJsonDataItem:operation.responseString];
    NSNumber* status=[dic objectForKey:@"status"];
    int statusValue = [status intValue];
    if (statusValue==successCode) {
        _empty.hidden=YES;
        NSArray* projectInfo = [dic objectForKey:@"projectInfo"];
        NSArray* datas = [JsonFactory creatJsonDataArrayByArray:responseObject[@"projectInfo"] class:[ProjectData class]];
        [projectDatas addObjectsFromArray:datas];
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
