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
#import "HttpAddress.h"
#import "HttpClientManager.h"
#import "HttpEvent.h"
#import "ProjectTypeContant.h"
#import "UserInfo.h"
#import "AppDelegate.h"
#import "MathUtil.h"
#import "JsonFactory.h"
#import "ResponseCode.h"
#import "Product.h"
#import "MBProgressHUD.h"
#import "MBProgressHUDManager.h"
#import "ViewUtil.h"
#import "ProjectTypeContant.h"
#import "MathUtil.h"
#import "ShowUtil.h"
#import "MBProgressHUDManager.h"
/*修改价格*/
#define TOUCH_CHANGER_PRICE @"changer_price"

@interface ProjectDetailViewController ()<HttpCallBack,UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>{
    NSMutableArray* products;
    MBProgressHUD* hud;
    Product* currentProduct;
    //NSString* touchType;
}
@property (strong, nonatomic) IBOutlet UILabel *empty;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
/*底部view*/
@property (strong, nonatomic) IBOutlet UIView *bottomView;
/*当前报价*/
@property (strong, nonatomic) IBOutlet UILabel *currentPrice;
/*上轮报价*/
@property (strong, nonatomic) IBOutlet UILabel *lastPrice;
/*税率*/
@property (strong, nonatomic) IBOutlet UILabel *rate;
/*当前轮次*/
@property (strong, nonatomic) IBOutlet UILabel *cuttentTurn;
/*报价动作*/
@property (strong, nonatomic) IBOutlet UILabel *quote;

/************底部*************/
@property (strong, nonatomic) IBOutlet UIView *bottomView1;
/*当前报价*/
@property (strong, nonatomic) IBOutlet UILabel *currentPrice1;
/*上次报价*/
@property (strong, nonatomic) IBOutlet UILabel *lastPrice1;
/*税率*/
@property (strong, nonatomic) IBOutlet UILabel *rate1;
/*当前轮次*/
@property (strong, nonatomic) IBOutlet UILabel *currentTurn1;
/*报价*/
@property (strong, nonatomic) IBOutlet UILabel *quote1;
/*拒绝*/
@property (strong, nonatomic) IBOutlet UILabel *refund;
/*修改*/
@property (strong, nonatomic) IBOutlet UILabel *modification;

@end

@implementation ProjectDetailViewController
@synthesize projectData=_projectData;
@synthesize type=_type;
@synthesize tableView=_tableView;
@synthesize empty=_empty;


@synthesize bottomView=_bottomView;
@synthesize currentPrice=_currentPrice;
@synthesize lastPrice=_lastPrice;
@synthesize rate=_rate;
@synthesize cuttentTurn=_cuttentTurn;
@synthesize quote=_quote;


@synthesize bottomView1=_bottomView1;
@synthesize currentPrice1=_currentPrice1;
@synthesize lastPrice1=_lastPrice1;
@synthesize rate1=_rate1;
@synthesize currentTurn1=_currentTurn1;
@synthesize quote1=_quote1;
@synthesize refund=_refund;
@synthesize modification=_modification;



- (void)viewDidLoad {
    [super viewDidLoad];
    /*返回左*/
    UIBarButtonItem *backButton = [ViewUtil genTopLeftButtonItemWithImage:@"com_icon_return_img" target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem=backButton;
    self.navigationItem.title=_projectData.title;
    
    /*列表初始*/
    _tableView.separatorStyle = NO;
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    
    /*数据初始*/
    products = [NSMutableArray new];
    [self getProjectDetail:_type turn:[MathUtil numberToString:_projectData.currentNumber]];
    
    //设置类型
    //int turn = [_projectData.currentNumber intValue];
    //[self setProjectType:turn];
    
    
    // Do any additional setup after loading the view.
}
/*设置类型*/
-(void)setProjectType:(int)currenTurn {
    if ([_type isEqualToString:biddingProjectType]) {//可报价
        _bottomView.hidden = NO;
        _bottomView1.hidden = YES;
        
        /*报价总和*/
        _currentPrice.text = [self totalPrice:0];
        if ([_projectData.currentNumber intValue]==1) {
            
            _lastPrice.text=@"暂无";
        }else{
            _lastPrice.text = [self totalPrice:1];
        }
        /*税率*/
        NSString* rateString = [MathUtil numberToString:_projectData.rate];
        _rate.text =[rateString stringByAppendingString:@"%"];
        /*轮次*/
        NSString* turnString = [MathUtil numberToString:_projectData.currentNumber];
        _cuttentTurn.text = [[@"第" stringByAppendingString:turnString]stringByAppendingString:@"轮"];
        /*报价情形*/
        if ([_projectData.currentNumber intValue]==currenTurn) {
            _quote.hidden = NO;
            if (currenTurn==1&&_projectData.isCurrentQuote) {
                _quote.text = @"修改";
            }
            if (currenTurn>1&&_projectData.isCurrentQuote) {
                
            
            }
            /**/
            UITapGestureRecognizer* recognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(quoteAction)];
            _quote.userInteractionEnabled = YES;
            [_quote addGestureRecognizer:recognizer];
            
            
        }else{
            _quote.hidden=YES;
        }
        
        
    }else if([_type isEqualToString:end_ask_projectType]){//询比价截止
        _bottomView.hidden = YES;
        _bottomView1.hidden = YES;
        
    }else if([_type isEqualToString:end_bidd_projectType]){//招投标截止
        _bottomView.hidden = YES;
        _bottomView1.hidden = YES;
        
    }else if([_type isEqualToString:askProjectType]){//询价
        
        _bottomView.hidden = YES;
        _bottomView1.hidden = NO;
        
    }
}

/*计算总价*/
-(NSString*)totalPrice:(int)type{
    float total= 0;
    for (int i=0; i<[products count]; i++) {
        Product* product = [products objectAtIndex:i];
        switch (type) {
            case 0:
                total+=[product.currentPrice floatValue];
                break;
                
            case 1:
                total+=[product.lastPrice floatValue];
                break;
        }
        
    }
    NSNumber* numberTotal = [[NSNumber alloc] initWithFloat:total];
    
    return [MathUtil numberToString:numberTotal];

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
/*报价处理*/
-(void)quoteAction{
    NSLog(@"dddddddddd");
}
/*修改当前报价*/
-(void)changePrice:(id)sender{
    if ([_type isEqualToString:end_ask_projectType]||[_type isEqualToString:end_bidd_projectType]) {
        
        return;
    }
    UITapGestureRecognizer* tapRecognizer = (UITapGestureRecognizer*)sender;
    Product* product = [products objectAtIndex:tapRecognizer.view.tag];
    currentProduct = product;
    [ShowUtil showAlert:@"修改当前报价" message:nil delegate:self cancelButtonTtile:@"取消" otherButtonTitles:@"确定" style:UIAlertViewStylePlainTextInput];
}

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

    ProductTableViewCell *productCell = [nibView objectAtIndex:0];
    Product *product =[products objectAtIndex:indexPath.row];
    productCell.productName.text=[@" " stringByAppendingString:product.productName==nil?@"":product.productName];
    productCell.productNumber.text= [@" 产品编码:" stringByAppendingString:product.serialNumber==nil?@"":product.serialNumber];
    productCell.productsRule.text=  [@" 规格:" stringByAppendingString:product.rule==nil?@"":product.rule];

    NSString* numberStr = [[product.number stringValue]stringByAppendingString:product.unit];
    productCell.unit.text = [@" 单位:" stringByAppendingString:product.unit==nil?@"":numberStr];

    
    productCell.currentPrice.text = [@" 当前报价:" stringByAppendingString:[MathUtil numberToString:product.currentPrice]];
    
    UITapGestureRecognizer* changePrice =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changePrice:)];
    changePrice.view.tag = indexPath.row;
   
    
    
    productCell.currentPrice.userInteractionEnabled=YES;
    [productCell.currentPrice addGestureRecognizer:changePrice];
    
    
    
    
    
    double number  = [product.number doubleValue];
    double currenPrice = [product.currentPrice doubleValue];
    double totalNumber = number*currenPrice;
    NSString* totalStr =[MathUtil numberToString:[[NSNumber alloc] initWithDouble:totalNumber]];
    productCell.currentTotal.text=[@" 产品小计:" stringByAppendingString:totalStr];
    
    
    productCell.lastPrice.text=[@" 上轮报价:" stringByAppendingString:[MathUtil numberToString:product.lastPrice]];
    
    

    double lastPrice = [product.lastPrice doubleValue];
    double lastotalNumber = number*lastPrice;
    
    NSString* lastTotalStr =[MathUtil numberToString:[[NSNumber alloc] initWithDouble:lastotalNumber]];
    productCell.lastTotal.text=[@" 上轮小计:" stringByAppendingString:lastTotalStr];
    
    
    productCell.currentRanking.text=[@" 当前排名:" stringByAppendingString:product.currentRank==nil?@"":product.currentRank];
    
    productCell.lastRanking.text=[@" 上轮排名:" stringByAppendingString:product.lastRank==nil?@"":product.lastRank];
    
  
    return productCell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  UITableViewAutomaticDimension;
}

-(void)getProjectDetail:(NSString*)type turn:(NSString*)turn{
    HttpEvent *productEvent  = [HttpEvent new];
    NSString *url = bind_project_detail;
    if ([_type isEqualToString:askProjectType]) {
        url = ask_project_detail;
    }else if([_type isEqualToString:biddingProjectType]){
        url = bind_project_detail;
    }else if([_type isEqualToString:end_bidd_projectType]){
        url = end_bind_project_detail;
    }else if ([_type isEqualToString:end_ask_projectType]){
        url = end_ask_project_detail;
    }
    productEvent.actionUrl = url;
    UserInfo* userInfo =[AppDelegate getAppContext:@"UserInfo"];
    [productEvent addPrama:userInfo.idStr key:@"userId"];
    [productEvent addPrama:_projectData.serialNumber key:@"serialNumber"];

    [productEvent addPrama:turn key:@"currenTurn"];

    [productEvent addPrama:_type key:@"type"];

    
    productEvent.callBack = self;
    [HttpClientManager sharedClient].event = productEvent;
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
    NSNumber* status = [dic objectForKey:@"status"];
    int statusValue = [status intValue];
    if (statusValue == successCode) {
      _empty.hidden=YES;
      NSArray* array = [dic objectForKey:@"productsInfo"];
      NSArray* productsArrays =  [JsonFactory creatJsonDataArray:array class:[Product class]];
      [products addObjectsFromArray:productsArrays];
      [_tableView reloadData];
      /*设置类型*/
      [self setProjectType:[_projectData.currentNumber intValue]];
      
    }else{
        _empty.hidden=NO;
        _empty.text=@"暂无产品";
    }
}
-(void)error:(AFHTTPRequestOperation *)operation error:(NSError *)error{
    [hud hide:YES];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==1) {
        UITextField *tf=[alertView textFieldAtIndex:0];
        [self changeDispose:tf.text];
    }
}
/*修改当前报价*/
-(void)changeDispose:(NSString*)changePrice{
    if (![MathUtil isNumber:changePrice]) {
        [MBProgressHUDManager showMessage:@"请输入合法的数值" view:self.view];
    }else{
        NSNumber* afterNumber = [MathUtil stringToNumber:changePrice];
        currentProduct.currentPrice = afterNumber;
        [_tableView reloadData];
        
        [self setProjectType:[_projectData.currentNumber intValue]];
    }
    
    
}
@end
