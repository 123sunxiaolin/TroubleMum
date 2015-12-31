//
//  Share.h
//  事儿妈
//
//  Created by kys-2 on 14-6-4.
//  Copyright (c) 2014年 sxl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Share : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UISearchDisplayDelegate>
{
    NSMutableArray *dataArray;
    NSMutableArray *searchResults;
    UISearchBar *Share_SearchBar;
    UISearchDisplayController *Share_searchDisplayController;
    UITableView *shareTable;
}
-(void)ShareClicked:(UIButton*)sender;
@end
