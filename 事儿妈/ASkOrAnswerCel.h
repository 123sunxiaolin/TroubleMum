//
//  ASkOrAnswerCel.h
//  事儿妈
//
//  Created by B505 on 14/7/9.
//  Copyright (c) 2014年 sxl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASkOrAnswerCel : UITableViewCell
@property (nonatomic,strong) UILabel *TitleLabel;//标题名称
@property (nonatomic,strong) UIImageView *IndexImg;//箭头
@property (nonatomic,strong) UILabel *LineLabel;//分割线
@property (nonatomic,strong) UIImageView *Headimg;//头像
@property (nonatomic,strong) UILabel *Number_belowLabel;//头像下面的数字显示
@property (nonatomic,strong) UILabel *ContentLabel;//主要内容的label
-(void)initTablecellView;
@end
