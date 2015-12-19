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
#import "MBProgressHUD.h"
#import "MBProgressHUDManager.h"
#import "ViewUtil.h"
#import "ProjectTypeContant.h"
#import "MathUtil.h"
#import "ShowUtil.h"
#import "TimeUtil.h"
#import "QuoteProduct.h"
#import "StringUtil.h"
#import "HttpAddress.h"
/*修改价格*/
//#define TOUCH_CHANGER_PRICE @"changer_price"

/*获得产品*/
#define GET_PRODUCT_TYPE @"getProductype"
/*招投标报价*/
#define GET_BIDDING_QUOTE @"biddingQuotetype"
/*修改价格*/
#define GET_MODIFICATION @"modificationType"
/*询价操作*/
//#define GET_ASKPRICE_OPERATE @"askPriceOperate"
/*询价拒绝*/
#define GET_ASK_REFUND @"askPriceRefund"
/*询价修改*/
#define GET_ASK_MODIFY @"askPriceModify"
/*询价报价*/
#define GET_ASK_QUOTE  @"askPriceQuote"
@interface ProjectDetailViewController ()<HttpCallBack,UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>{
    NSMutableArray* products;
    MBProgressHUD* hud;
    Product* currentProduct;
    NSString* getType;
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
    self.navigationItem.leftBarButtonItem = backButton;
    self.navigationItem.title=_projectData.title;
    
    /*列表初始*/
    _tableView.separatorStyle = NO;
    _tableView.estimatedRowHeight  = 60.f;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    /*数据初始*/
    products = [NSMutableArray new];
    [self getProjectDetail:_type turn:_projectData.currentNumber];
}
/*设置类型*/
-(void)setProjectType:(int)currenTurn {
    if ([_type isEqualToString:biddingProjectType]) {//可报价
        _bottomView.hidden = NO;
        _bottomView1.hidden = YES;
        /*报价总和*/
        _currentPrice.text = [self totalPrice:0];
        if ([_projectData.currentNumber intValue] == 1) {
            _lastPrice.text=@"暂无";
        }else{
            _lastPrice.text = [self totalPrice:1];
        }
        /*税率*/
        _rate.text =[_projectData.rate stringByAppendingString:@"%"];
        /*轮次*/
        _cuttentTurn.text = [[@"第" stringByAppendingString:_projectData.currentNumber]stringByAppendingString:@"轮"];
        /*报价情形*/
        _quote.text = @"报价";
        if ([_projectData.currentNumber intValue] == currenTurn) {
            _quote.hidden = NO;
            if(currenTurn == 1&&_projectData.isCurrentQuote) {
                _quote.text = @"修改";
            }
            if(currenTurn > 1&&_projectData.isCurrentQuote) {
                _quote.backgroundColor=[UIColor darkGrayColor];
            }
            UITapGestureRecognizer* recognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(quoteAction)];
            _quote.userInteractionEnabled = YES;
            [_quote addGestureRecognizer:recognizer];
        }else{
            _quote.hidden = YES;
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
        /*当前询价*/
        _currentPrice1.text = [self totalPrice:0];
        /*上轮报价*/
        if ([_projectData.currentNumber intValue]==1) {
            _lastPrice1.text=@"暂无";
        }else{
            _lastPrice1.text = [self totalPrice:1];
        }
        /*税率*/
        _rate1.text =[_projectData.rate stringByAppendingString:@"%"];
        /*轮次*/
        _currentTurn1.text = [[@"第" stringByAppendingString:_projectData.currentNumber]stringByAppendingString:@"轮"];
        
        /*询价情形*/
        if ([_projectData.currentNumber intValue] == currenTurn) {
            if ([_projectData.currentNumber intValue] > 1) {
                _refund.hidden = NO;
                _modification.hidden = NO;
                _quote1.hidden = YES;
                if (_projectData.isCurrentQuote) {
                    _refund.backgroundColor=[UIColor darkGrayColor];
                    _modification.backgroundColor = [UIColor darkGrayColor];
                }
                /*拒绝*/
                UITapGestureRecognizer* refundRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(refundAction)];
                _refund.userInteractionEnabled = YES;
                [_refund addGestureRecognizer:refundRecognizer];
                /*修改*/
                UITapGestureRecognizer* modificationRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(askModificationAction)];
                _modification.userInteractionEnabled = YES;
                [_modification addGestureRecognizer:modificationRecognizer];
                
            }else{
                _refund.hidden = YES;
                _modification.hidden = YES;
                _quote1.hidden = NO;
                if(_projectData.isCurrentQuote) {
                  _quote1.text = @"修改";
                }else{
                  _quote1.text = @"报价";
                }
                UITapGestureRecognizer* recognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(askAction)];
                _quote1.userInteractionEnabled = YES;
                [_quote1 addGestureRecognizer:recognizer];
            }
        }else{
            _refund.hidden=YES;
            _modification.hidden=YES;
            _quote.hidden=YES;
        }
    }
}

/*计算总价*/
-(NSString*)totalPrice:(int)type{
    NSString* total= @"0";
    for (int i=0; i<[products count]; i++) {
        Product* product = [products objectAtIndex:i];
        switch (type) {
            case 0:
                total = [MathUtil decimalNumberAddWithString:total value2:[MathUtil decimalNumberMutiplyWithString:product.currentPrice value2:product.number]];
                break;
            case 1:
                total = [MathUtil decimalNumberAddWithString:total value2:[MathUtil decimalNumberMutiplyWithString:product.lastPrice value2:product.number]];
                break;
        }
    }
    return total;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*拒绝*/
-(void)refundAction{
    NSLog(@"refund");
    if (_projectData.isCurrentQuote){
        [MBProgressHUDManager showMessage:@"项目价格已确定,无法操作" view: self.view];
        return;
    }
    NSDate* endDate = [TimeUtil stringToNsData:[_projectData endTime] format:DATA1];
    NSDate* nowDate = [NSDate date];
    NSInteger compareResult =  [TimeUtil compareData:endDate toData:nowDate];
    if (compareResult == -1) {
        [MBProgressHUDManager showMessage:@"项目已截止,无法操作" view: self.view];
        return;
    }
    /*询价*/
    NSArray* jsonArray = [self getQuoteProduct];
    UserInfo* userInfo = [AppDelegate getAppContext:@"UserInfo"];
    [self comparisonOperate:userInfo.idStr operateCode:@"0" productQuoterInfo:[jsonArray JSONString] serialNumber:_projectData.serialNumber turn:_projectData.currentNumber];
    getType = GET_ASK_REFUND;
}
/*询比价修改*/
-(void)askModificationAction{
    NSLog(@"askNodification");
    if (_projectData.isCurrentQuote&&[_projectData.currentNumber intValue]!=1) {
       [MBProgressHUDManager showMessage:@"项目价格已确定,无法操作" view: self.view];
        return;
    }
    NSDate* endDate = [TimeUtil stringToNsData:[_projectData endTime] format:DATA1];
    NSDate* nowDate = [NSDate date];
    NSInteger compareResult =  [TimeUtil compareData:endDate toData:nowDate];
    if (compareResult == -1) {
        [MBProgressHUDManager showMessage:@"项目已截止,无法操作" view: self.view];
        return;
    }
    if ([self isChange] == NO) {
        [MBProgressHUDManager showMessage:@"未发现有产品报价变动" view: self.view];
        return;
    }
    NSArray* jsonArray = [self getQuoteProduct];
    /*报价*/
    UserInfo* userInfo = [AppDelegate getAppContext:@"UserInfo"];
    [self comparisonQuote:userInfo.idStr operateCode:@"1" productQuoterInfo:[jsonArray JSONString] serialNumber:_projectData.serialNumber turn:_projectData.currentNumber];
    getType = GET_ASK_QUOTE;
}
/*询价处理*/
-(void)askAction{
    NSLog(@"ask");
    if (_projectData.isCurrentQuote&&[_projectData.currentNumber intValue]!=1){
        [MBProgressHUDManager showMessage:@"项目价格已确定,无法操作" view: self.view];
        return;
    }
    
    NSDate* endDate = [TimeUtil stringToNsData:[_projectData endTime] format:DATA1];
    NSDate* nowDate = [NSDate date];
    NSInteger compareResult =  [TimeUtil compareData:endDate toData:nowDate];
    if (compareResult == -1) {
        [MBProgressHUDManager showMessage:@"项目已截止,无法操作" view: self.view];
        return;
    }
    
    if ([self isChange] == NO){
        [MBProgressHUDManager showMessage:@"未发现有产品报价变动" view: self.view];
        return;
    }
    
    NSArray* jsonArray = [self getQuoteProduct];
    /*报价*/
    UserInfo* userInfo = [AppDelegate getAppContext:@"UserInfo"];
    if(_projectData.isCurrentQuote){//修改
        [self comparisonOperate:userInfo.idStr operateCode:@"2" productQuoterInfo:[jsonArray JSONString] serialNumber:_projectData.serialNumber turn:_projectData.currentNumber];
        getType = GET_ASK_MODIFY;
    }else{//报价
        [self comparisonQuote:userInfo.idStr operateCode:@"1" productQuoterInfo:[jsonArray JSONString] serialNumber:_projectData.serialNumber turn:_projectData.currentNumber];
        getType = GET_ASK_QUOTE;
    }
}

/*报价处理*/
-(void)quoteAction{
    if ([_projectData isCurrentQuote]&&[_projectData.currentNumber intValue] > 1) {
        [MBProgressHUDManager showMessage:@"项目价格已确定,无法操作" view: self.view];
        return;
    }
    
    NSDate* endDate = [TimeUtil stringToNsData:[_projectData endTime] format:DATA1];
    NSDate* nowDate = [NSDate date];
    NSInteger compareResult =  [TimeUtil compareData:endDate toData:nowDate];
    if (compareResult == -1) {
        [MBProgressHUDManager showMessage:@"项目已截止,无法操作" view: self.view];
        return;
    }
    
    if ([self isChange] == NO) {
        [MBProgressHUDManager showMessage:@"未发现有产品报价变动" view: self.view];
        return;
    }
    
    NSArray* jsonArray = [self getQuoteProduct];
    NSString* jsonString = [jsonArray JSONString];
    /*报价*/
    UserInfo* userInfo = [AppDelegate getAppContext:@"UserInfo"];
    
    if ([_projectData isCurrentQuote]&&[[_projectData currentNumber] intValue] == 1) {//修改
        [self biddingModify:userInfo.idStr operateCode:@"2" productQuoterInfo:jsonString serialNumber:_projectData.serialNumber type:@"4" turn:_projectData.currentNumber];
    }else{//报价
      [self biddingQuote:userInfo.idStr operateCode:@"1" productQuoterInfo:jsonString serialNumber:_projectData.serialNumber type:@"4" turn:_projectData.currentNumber];
    }
   
}
/*是否产品价格有变动*/
-(BOOL)isChange{
    for (int i = 0;i < [products count]; i++) {
        Product* product = [products objectAtIndex:i];
        if ([product isChangePrice:[[_projectData currentNumber] intValue]]) {
            return YES;
        }
    }
    return NO;

}

/*招投标报价*/
-(void)biddingQuote:(NSString*)userId operateCode:(NSString*)operateCode productQuoterInfo:(NSString*)productInfo serialNumber:(NSString*)serialNumber type:(NSString*)type turn:(NSString*)currenTurn{
    
    HttpEvent *quoteEvent =[HttpEvent new];
    quoteEvent.actionUrl=project_bidding_quote;
    [quoteEvent addPrama:operateCode key:@"operateCode"];
    [quoteEvent addPrama:userId key:@"userId"];
    [quoteEvent addPrama:type key:@"type"];
    [quoteEvent addPrama:serialNumber key:@"serialNumber"];
    [quoteEvent addPrama:currenTurn key:@"currenTurn"];
    [quoteEvent addPrama:productInfo key:@"productQuoteInfo"];
    quoteEvent.callBack=self;
    HttpClientManager* httpClient = [HttpClientManager sharedClient];
    httpClient.event = quoteEvent;
    hud = [MBProgressHUDManager showLoad:@"报价中..." view:self.view];
    getType = GET_BIDDING_QUOTE;
    [httpClient submitHttpEvent];

}
/*招投标修改*/
-(void)biddingModify:(NSString*)userId operateCode:(NSString*)operateCode productQuoterInfo:(NSString*)productInfo serialNumber:(NSString*)serialNumber type:(NSString*)type turn:(NSString*)currenTurn{
    HttpEvent *quoteEvent =[HttpEvent new];
    quoteEvent.actionUrl=project_bidding_modification;
    [quoteEvent addPrama:operateCode key:@"operateCode"];
    [quoteEvent addPrama:userId key:@"userId"];
    [quoteEvent addPrama:type key:@"type"];
    [quoteEvent addPrama:serialNumber key:@"serialNumber"];
    [quoteEvent addPrama:currenTurn key:@"currenTurn"];
    [quoteEvent addPrama:productInfo key:@"productQuoteInfo"];
    quoteEvent.callBack=self;
    HttpClientManager* httpClient = [HttpClientManager sharedClient];
    httpClient.event = quoteEvent;
    hud = [MBProgressHUDManager showLoad:@"报价中..." view:self.view];
    getType = GET_MODIFICATION;
    [httpClient submitHttpEvent];
}

/*询比价报价*/
-(void)comparisonOperate:(NSString*)userId operateCode:(NSString*)operateCode productQuoterInfo:(NSString*)productInfo serialNumber:(NSString*)serialNumber turn:(NSString*)currenTurn{
    
    HttpEvent *askEvent =[HttpEvent new];
    askEvent.actionUrl = project_comparison_operate;
    [askEvent addPrama:operateCode key:@"operateCode"];
    [askEvent addPrama:userId key:@"userId"];
    //[quoteEvent addPrama:type key:@"type"];
    [askEvent addPrama:serialNumber key:@"serialNumber"];
    [askEvent addPrama:currenTurn key:@"currenTurn"];
    [askEvent addPrama:productInfo key:@"productQuoteInfo"];
    askEvent.callBack=self;
    HttpClientManager* httpClient = [HttpClientManager sharedClient];
    httpClient.event = askEvent;
    hud = [MBProgressHUDManager showLoad:@"询价中..." view:self.view];
    //getType = GET_ASKPRICE_OPERATE;
    [httpClient submitHttpEvent];
}
-(void)comparisonQuote:(NSString*)userId operateCode:(NSString*)operateCode productQuoterInfo:(NSString*)productInfo serialNumber:(NSString*)serialNumber turn:(NSString*)currenTurn{
    HttpEvent *askEvent =[HttpEvent new];
    askEvent.actionUrl = project_comparison_quote;
    [askEvent addPrama:operateCode key:@"operateCode"];
    [askEvent addPrama:userId key:@"userId"];
    [askEvent addPrama:serialNumber key:@"serialNumber"];
    [askEvent addPrama:currenTurn key:@"currenTurn"];
    [askEvent addPrama:productInfo key:@"productQuoteInfo"];
    askEvent.callBack=self;
    HttpClientManager* httpClient = [HttpClientManager sharedClient];
    httpClient.event = askEvent;
    hud = [MBProgressHUDManager showLoad:@"询价中..." view:self.view];
   // getType = GET_ASKPRICE_OPERATE;
    [httpClient submitHttpEvent];
}





/*获取改变报价后的products*/
-(NSArray*)getChangePriceProducts{
    NSMutableArray* changeProducts= [[NSMutableArray alloc] init];
    for (int i = 0; i < [products count]; i++) {
        Product* product = [products objectAtIndex:i];
        if ([product isChangePrice:[_projectData.currentNumber intValue]]) {
            [changeProducts addObject:product];
        }
    }
    return changeProducts;
}
/*获得报价指令产品*/
-(NSArray*)getQuoteProduct{
    NSMutableArray* quoteProducts = [[NSMutableArray alloc]init];
    NSArray* changePriceProducts = [self getChangePriceProducts];
    for (int i = 0; i < [changePriceProducts count]; i++) {
        Product* product = [changePriceProducts objectAtIndex:i];
        QuoteProduct* quoteProduct = [QuoteProduct new];
        quoteProduct.serialNumber = product.serialNumber;
        quoteProduct.price = product.currentPrice;
        quoteProduct.rate = product.rate;
        [quoteProducts addObject:[quoteProduct page]];
    }
    return quoteProducts;
    
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
    NSString* numberStr = [product.number stringByAppendingString:product.unit];
    productCell.unit.text = [@"单位:" stringByAppendingString:product.unit?numberStr:@""];
    productCell.currentPrice.text = [@" 当前报价:" stringByAppendingString:product.currentPrice];
    UITapGestureRecognizer* changePrice =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changePrice:)];
    productCell.currentPrice.tag = indexPath.row;
    productCell.currentPrice.userInteractionEnabled=YES;
    [productCell.currentPrice addGestureRecognizer:changePrice];
   NSString* totalStr = [MathUtil decimalNumberMutiplyWithString:product.number value2:product.currentPrice];
    productCell.currentTotal.text=[@" 产品小计:" stringByAppendingString:totalStr];
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
    getType = GET_PRODUCT_TYPE;
    [[HttpClientManager sharedClient] submitHttpEvent];
        
    
}
-(void)success:(AFHTTPRequestOperation *)operation response:(id)responseObject{
    [hud hide:YES];
    if([getType isEqualToString:GET_PRODUCT_TYPE]) {//获得产品列表
        NSNumber* statusNumber = responseObject[@"status"];
        NSString* status = [statusNumber stringValue];
        if ([status isEqualToString:@"0"]) {
        _empty.hidden = YES;
        NSArray* productsArrays = [JsonFactory creatJsonDataArrayByArray:responseObject[@"productsInfo"] class:[Product class]];
        [products addObjectsFromArray:productsArrays];
        [_tableView reloadData];
        /*设置类型*/
        [self setProjectType:[_projectData.currentNumber intValue]];
    }else{
         _empty.hidden = NO;
         _empty.text=@"暂无产品";
       }
    }else if([getType isEqualToString:GET_BIDDING_QUOTE]){//报价
        NSNumber* statusNumber = responseObject[@"status"];
        NSString* statusString = [MathUtil numberToString:statusNumber];
        if (![statusString isEqualToString:@"0"]) {
            [MBProgressHUDManager showMessage:@"报价失败" view:self.view];
        }else{
            _projectData.isCurrentQuote = YES;
            [MBProgressHUDManager showMessage:@"报价成功" view:self.view];
            if ([_projectData.currentNumber intValue] == 1) {
                _quote.text = @"修改";
            }else{
                _quote.backgroundColor = [UIColor grayColor];
            }
        }
    }else if([getType isEqualToString:GET_MODIFICATION]){//修改
        NSNumber* statusNumber = responseObject[@"status"];
        NSString* statusString = [MathUtil numberToString:statusNumber];
        if (![statusString isEqualToString:@"0"]) {
            [MBProgressHUDManager showMessage:@"修改失败" view:self.view];
        }else{
            _projectData.isCurrentQuote = YES;
            [MBProgressHUDManager showMessage:@"修改成功" view:self.view];
        }
    }else if ([getType isEqualToString:GET_ASK_REFUND]){//询价拒绝
        NSNumber* statusNumber = responseObject[@"status"];
        NSString* statusString = [MathUtil numberToString:statusNumber];
        if (![statusString isEqualToString:@"0"]){
            [MBProgressHUDManager showMessage:@"拒绝失败" view:self.view];
        }else{
            _projectData.isCurrentQuote = YES;
            _refund.backgroundColor = [UIColor darkGrayColor];
            _modification.backgroundColor = [UIColor darkGrayColor];
            [MBProgressHUDManager showMessage:@"拒绝成功" view:self.view];
        }
    }else if([getType isEqualToString:GET_ASK_MODIFY]){//询价修改
        NSNumber* statusNumber = responseObject[@"status"];
        NSString* statusString = [MathUtil numberToString:statusNumber];
        if (![statusString isEqualToString:@"0"]){
            [MBProgressHUDManager showMessage:@"修改失败" view:self.view];
        }else{
            _projectData.isCurrentQuote = YES;
           [MBProgressHUDManager showMessage:@"修改成功" view:self.view];
        }
    }else if([getType isEqualToString:GET_ASK_QUOTE]){//询价报价
        NSNumber* statusNumber = responseObject[@"status"];
        NSString* statusString = [MathUtil numberToString:statusNumber];
        if (![statusString isEqualToString:@"0"]){
            [MBProgressHUDManager showMessage:@"询价失败" view:self.view];
        }else{
            _projectData.isCurrentQuote = YES;
            if ([_projectData.currentNumber intValue] == 1) {
                _quote1.text = @"修改";
            }else{
                _refund.backgroundColor = [UIColor darkGrayColor];
                _modification.backgroundColor = [UIColor darkGrayColor];
            }
            [MBProgressHUDManager showMessage:[_projectData.currentNumber intValue] == 1?@"询价成功":@"修改成功" view:self.view];
        }

        
    }
}
-(void)error:(AFHTTPRequestOperation *)operation error:(NSError *)error{
    [hud hide:YES];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1){
        UITextField *tf=[alertView textFieldAtIndex:0];
        NSString* changePriceString = tf.text;
        if (![StringUtil isEmpty:changePriceString]) {
              [self changeDispose:changePriceString];
        }
      
    }
}


/*修改当前报价*/
-(void)changeDispose:(NSString*)changePrice{
    if (![MathUtil isNumber:changePrice lastNumber:6]){
        [MBProgressHUDManager showMessage:@"请输入合法的数值" view:self.view];
    }else{
        currentProduct.currentPrice = changePrice;
        [_tableView reloadData];
    }
}
@end
