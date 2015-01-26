//
//  AskPriceProjectViewController.m
//  mqsystem
//
//  Created by shanxiaoping on 15-1-14.
//  Copyright (c) 2015年 yicai. All rights reserved.
//

#import "AskPriceProjectViewController.h"
#import "ViewUtil.h"
#import "ProjectCell.h"
#import "ProjectData.h"
#import "StoryContants.h"
#import "ProjectTableViewCell.h"
@interface AskPriceProjectViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSMutableArray *projectDatas;
    
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
@implementation AskPriceProjectViewController
@synthesize tableView=_tableView;



- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *backButton = [ViewUtil genTopLeftButtonItemWithImage:@"com_icon_return_img" target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem=backButton;
    _tableView.separatorStyle = NO;
    //_tableView.rowHeight=UITableViewAutomaticDimension;
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    
    projectDatas = [[NSMutableArray alloc]init];
    ProjectData *data1 = [ProjectData new];
    data1.title=@" 房屋建筑";
    data1.endTime=@"  截止时间：2015-01-20 16:40";
    data1.moneType=@"  人民币";
    data1.serialNumber=@"  137198318361";

    
     ProjectData *data2 = [ProjectData new];
    
    data2.title=@" 房屋建筑";
    data2.endTime=@"  截止时间：2015-01-20 16:40";
    data2.moneType=@"  人民币";
    data2.serialNumber=@"  137198318361";
     ProjectData *data3 = [ProjectData new];
    
    data3.title=@" 房屋建筑";
    data3.endTime=@"  截止时间：2015-01-20 16:40";
    data3.moneType=@"  人民币";
    data3.serialNumber=@"  137198318361";
    
    [projectDatas addObject:data1];
    [projectDatas addObject:data2];
    [projectDatas addObject:data3];
    


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
    
    NSArray* nibView =[[NSBundle mainBundle] loadNibNamed:@" ProjectTableViewCell" owner:nil options:nil];
    ProjectTableViewCell*  projectCell = [nibView objectAtIndex:0];
   
   // UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"cell"];
   //ProjectCell *projectCell = (ProjectCell*)cell;
   ProjectData *data = [projectDatas objectAtIndex:indexPath.row];
   projectCell.title.text = data.title;
   projectCell.endTime.text = data.endTime;
   projectCell.projectNumber.text = data.serialNumber;
   projectCell.moneyType.text=data.moneType;
   return  projectCell;
    


}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ProjectData *data = [projectDatas objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:product_Step sender:data];

}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    return  UITableViewAutomaticDimension;
//
//}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return  UITableViewAutomaticDimension;
    
}

@end
