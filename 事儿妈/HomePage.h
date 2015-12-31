//
//  HomePage.h
//  事儿妈
//
//  Created by kys-2 on 14-6-4.
//  Copyright (c) 2014年 sxl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomePage : UIViewController<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate,UISearchDisplayDelegate>
{
    //search
    UISearchBar *mySearchBar;
    UISearchDisplayController *searchDisplayController;
    //Headview
    UIView *headView;
    //scrollView
    UIScrollView *scrollView;
    //tableview
    UITableView *S_tableView;
    NSMutableArray *dataArray;
    NSMutableArray *searchResults;
    //request
    NSMutableDictionary *JsonBackObjcs;
}
//设计Tableview的headview
-(void)initTheHeadView;
-(UIView *)getHeadView;
//URL请求
-(void)TopListRequest;
-(void)HomeBtnClicked:(UIButton *)sender;
@end
