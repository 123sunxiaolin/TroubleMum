//
//  HomeCell.h
//  事儿妈
//
//  Created by kys-2 on 14-6-6.
//  Copyright (c) 2014年 sxl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeCell : UITableViewCell
@property (nonatomic,strong) UIImageView *HeadImageView;//头像
@property (nonatomic,strong)UILabel *FuncText;//办理身份证
@property (nonatomic,strong)UILabel *CoinsText;//金币数量
@property (nonatomic,strong)UILabel *DownloadCount;//下载次数
@property (nonatomic,strong)UILabel *SearchCount;//搜索次数
@property (nonatomic,strong)UILabel *FlowersCount;//鲜花数量
@end
