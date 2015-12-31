//
//  MyDetailView.h
//  事儿妈
//
//  Created by B505 on 14/7/12.
//  Copyright (c) 2014年 sxl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyDetailView : UIViewController
@property (nonatomic,strong) UILabel *titleLabel;
-(void)InitNavigationBar;
-(void)MyDetailClicked:(UIButton*)sender;
@end
