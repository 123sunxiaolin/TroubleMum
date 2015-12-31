//
//  QCListViewController.h
//  QCSliderTableView
//
//  Created by “ sxl on 14-4-16.
//  Copyright (c) 2014年 Scasy. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface QCListViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_tableViewList;
    NSMutableArray *items_Things;
    NSMutableArray *items_Experience;
    NSMutableArray *items_Collection;
    NSMutableArray *items;
}

@property (nonatomic, strong) IBOutlet UITableView *tableViewList;

- (void)viewDidCurrentView;

@end

