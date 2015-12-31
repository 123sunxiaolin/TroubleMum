//
//  PersonInfoViewController.h
//  事儿妈
//
//  Created by B505 on 14/7/11.
//  Copyright (c) 2014年 sxl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonInfoViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *personTable;
}
-(void)CreateBackgroundView;
@end
