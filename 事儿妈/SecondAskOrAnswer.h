//
//  SecondAskOrAnswer.h
//  事儿妈
//
//  Created by B505 on 14/7/10.
//  Copyright (c) 2014年 sxl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondAskOrAnswer : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UIView *TopView;
    UITableView *ASkTable;
}
-(void)LoadTopViewInSecondView;//初始化

@end
