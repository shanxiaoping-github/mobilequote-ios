//
//  HttpAddress.h
//  mqsystem
//
//  Created by shanxiaoping on 15-1-31.
//  Copyright (c) 2015年 yicai. All rights reserved.
//
/*地址长量类*/
#ifndef mqsystem_HttpAddress_h
#define mqsystem_HttpAddress_h
/*基础地址*/
#define baseUser @"http://eps.epursoft.com/"
/*登录*/
#define login @"LaoginAction.action?action=login"
/*询比价项目*/
#define askproject @"getCurrentComparisonProject.action?action=getCurrentComparisonProject"
/*结束的询比价项目*/
#define end_ask_project @"getEndComparisonProject.action?action=getEndComparisonProject"
/*结束的招投标项目*/
#define end_biding_project @"getEndTenderProject.action?action=getEndTenderProject"
/*招投标项目*/
#define bindproject @"getCurrentBiddingProject.action?action=getCurrentBiddingProject"
/*询比价项目产品*/
#define ask_project_detail @"getComparisonProduct.action?action=getComparisonProduct"
/*招投标项目产品*/
#define bind_project_detail @"getTenderProjectProduct.action?action=getTenderProjectProduct";
/*结束的询比价项目产品*/
#define end_ask_project_detail @"getEndComparisonProduct.action?action=getEndComparisonProduct";
/*结束的招投标项目产品*/
#define end_bind_project_detail @"getEndTenderProjectProduct.action?action=getEndTenderProjectProduct"



/*招投标报价*/
#define project_bidding_quote @"tenderProjectQuote.action?action=tenderProjectQuote"
/*询比价*/
#define project_comparison_quote @"comparisonQuote.action?action=comparisonQuote"
/*询比价操作*/
#define project_comparison_operate @"projectComparisonOperate.action?action=projectComparisonOperate"

/*招投标项目修改报价*/
#define project_bidding_modification @"editTenderProjectQuote.action?action=editTenderProjectQuote"


#endif
