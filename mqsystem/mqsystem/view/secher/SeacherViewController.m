//
//  SeacherViewController.m
//  mqsystem
//
//  Created by shanxiaoping on 15-1-14.
//  Copyright (c) 2015年 yicai. All rights reserved.
//

#import "SeacherViewController.h"
#import "ViewUtil.h"

@interface SeacherViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>{
    NSMutableArray *projectDatas;
}

@end

@implementation SeacherViewController
@synthesize tableView=_tableView;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView.separatorStyle = NO;
    self.automaticallyAdjustsScrollViewInsets=NO;
    UIBarButtonItem *backButton = [ViewUtil genTopLeftButtonItemWithImage:@"com_icon_return_img" target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem=backButton;
   
    projectDatas = [NSMutableArray new];
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
-(void)back{
     [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden=NO;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return UITableViewAutomaticDimension;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   return  [projectDatas count];
}
-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    NSLog(@"djkaljdlasd");
}
@end
