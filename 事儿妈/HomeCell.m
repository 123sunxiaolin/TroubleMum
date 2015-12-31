//
//  HomeCell.m
//  事儿妈
//
//  Created by kys-2 on 14-6-6.
//  Copyright (c) 2014年 sxl. All rights reserved.
//

#import "HomeCell.h"

@implementation HomeCell
@synthesize HeadImageView,FuncText,CoinsText,DownloadCount,SearchCount,FlowersCount;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        /*height==60*/
        HeadImageView=[[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 50, 50)];
        HeadImageView.image=[UIImage imageNamed:@"HeadImage1"];
        [HeadImageView.layer setCornerRadius:8.0];
        HeadImageView.backgroundColor=[UIColor clearColor];
        FuncText=[[UILabel alloc]initWithFrame:CGRectMake(60, 5, 100, 20)];
        FuncText.backgroundColor=[UIColor clearColor];
        FuncText.textColor=[UIColor blackColor];
        FuncText.font=[UIFont systemFontOfSize:15];
        CoinsText=[[UILabel alloc]initWithFrame:CGRectMake(60, 28, 100, 12)];
        CoinsText.backgroundColor=[UIColor clearColor];
        CoinsText.textColor=[UIColor grayColor];
        CoinsText.font=[UIFont systemFontOfSize:13];
        FlowersCount=[[UILabel alloc]initWithFrame:CGRectMake(170, 28, 100, 12)];
        FlowersCount.backgroundColor=[UIColor clearColor];
        FlowersCount.textColor=[UIColor grayColor];
        FlowersCount.font=[UIFont systemFontOfSize:13];

        DownloadCount=[[UILabel alloc]initWithFrame:CGRectMake(60, 43, 100, 12)];
        DownloadCount.backgroundColor=[UIColor clearColor];
        DownloadCount.textColor=[UIColor grayColor];
        DownloadCount.font=[UIFont systemFontOfSize:13];
        SearchCount=[[UILabel alloc]initWithFrame:CGRectMake(170, 43, 100, 12)];
        SearchCount.backgroundColor=[UIColor clearColor];
        SearchCount.textColor=[UIColor grayColor];
        SearchCount.font=[UIFont systemFontOfSize:13];
        [self addSubview:HeadImageView];
        [self addSubview:FuncText];
        [self addSubview:CoinsText];
        [self addSubview:DownloadCount];
        [self addSubview:SearchCount];
        [self addSubview:FlowersCount];

        
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
