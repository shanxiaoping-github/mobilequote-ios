//
//  ProjectDetailViewController.m
//  mqsystem
//
//  Created by shanxiaoping on 15-1-25.
//  Copyright (c) 2015年 yicai. All rights reserved.
//

#import "ProjectDetailViewController.h"
#import "ViewUtil.h"
#import "Product.h"
#import "ProductTableViewCell.h"
#import "MathUtil.h"

@interface ProjectDetailViewController (){
    
    NSMutableArray* products;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation ProjectDetailViewController
@synthesize projectData=_projectData;
@synthesize tableView=_tableView;
- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *backButton = [ViewUtil genTopLeftButtonItemWithImage:@"com_icon_return_img" target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem=backButton;
    
    _tableView.separatorStyle = NO;
    //_tableView.rowHeight=UITableViewAutomaticDimension;
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    products = [NSMutableArray new];
    
    Product *product = [Product new];
    product.productName=@"钢筋";
    product.serialNumber=@"xjeoiqueuqoeuq";
    product.unit=@"宜采";
    product.lastPrice=[[NSNumber alloc]initWithDouble:20.00];
    product.currentPrice=[[NSNumber alloc]initWithDouble:20.00];
    product.currentRank=@"1";
    product.lastRank=@"2";
    product.rule=@"17*20mm";
    product.describe=@"此钢筋特别耐用，物美价廉";
    product.number=[[NSNumber  alloc]initWithDouble:10];
    
    
    Product *product1 = [Product new];
    product1.productName=@"钢筋";
    product1.serialNumber=@"xjeoiqueuqoeuq";
    product1.unit=@"宜采";
    product1.lastPrice=[[NSNumber alloc]initWithDouble:20.00];
    product1.currentPrice=[[NSNumber alloc]initWithDouble:20.00];
    product1.currentRank=@"1";
    product1.lastRank=@"2";
    product1.rule=@"17*20mm";
    product1.describe=@"此钢筋特别耐用，物美价廉";
    product1.number=[[NSNumber  alloc]initWithDouble:10];
    
    [products addObject:product];
    [products addObject:product1];
    
    
    
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
    [_tableView reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [products count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    NSArray *nibView  = [[NSBundle mainBundle] loadNibNamed:@"ProductTableViewCell" owner:nil options:nil];
   // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
   // if (cell == nil) {
   //     cell = [[ProductTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell" ];
   // }
    ProductTableViewCell *productCell = [nibView objectAtIndex:0];
    Product *product =[products objectAtIndex:indexPath.row];
    productCell.productName.text=[@" " stringByAppendingString:product.productName];
    productCell.productNumber.text= [@" 产品编码:" stringByAppendingString:product.serialNumber];
    productCell.productsRule.text=  [@" 规格:" stringByAppendingString:product.rule];
    productCell.unit.text = [@" 单位:" stringByAppendingString:product.unit];

    
    productCell.currentPrice.text = [@" 当前报价:" stringByAppendingString:[MathUtil numberToString:product.currentPrice]];
    
    double number  = [product.number doubleValue];
    double currenPrice = [product.currentPrice doubleValue];
    double totalNumber = number*currenPrice;
    NSString* totalStr =[MathUtil numberToString:[[NSNumber alloc] initWithDouble:totalNumber]];
    productCell.currentTotal.text=[@" 产品小计:" stringByAppendingString:totalStr];
    
    
    productCell.lastPrice.text=[@" 上轮报价:" stringByAppendingString:[MathUtil numberToString:product.lastPrice]];
    
    

    double  lastPrice = [product.lastPrice doubleValue];
    double lastotalNumber = number*lastPrice;
    
    NSString* lastTotalStr =[MathUtil numberToString:[[NSNumber alloc] initWithDouble:lastotalNumber]];
    productCell.currentTotal.text=[@" 上轮小计:" stringByAppendingString:lastTotalStr];
    
    
    productCell.currentRanking.text=[@" 当前排名:" stringByAppendingString:product.currentRank];
    
    productCell.lastRanking.text=[@" 上轮排名:" stringByAppendingString:product.lastRank];
    
  
    return productCell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

   return  UITableViewAutomaticDimension;

}

@end