//
//  secondASKCell.m
//  事儿妈
//
//  Created by B505 on 14/7/10.
//  Copyright (c) 2014年 sxl. All rights reserved.
//

#import "secondASKCell.h"

@implementation secondASKCell
@synthesize Second_ContentLabel,Second_Headimg,second_NickLabel,Second_NumberLabel;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        Second_Headimg=[[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 40, 40)];
        Second_Headimg.backgroundColor=[UIColor clearColor];
        [Second_Headimg.layer setCornerRadius:3.0];
        Second_NumberLabel=[[UILabel alloc]initWithFrame:CGRectMake(5, 50, 40, 20)];
        //Number_belowLabel.backgroundColor=[UIColor blueColor];
        Second_NumberLabel.textAlignment=NSTextAlignmentCenter;
        Second_NumberLabel.font=[UIFont systemFontOfSize:15];
        [Second_NumberLabel.layer setCornerRadius:5.0];
        [Second_NumberLabel.layer setBorderWidth:0.3];
        [Second_NumberLabel.layer setBorderColor:[UIColor blueColor].CGColor];
        second_NickLabel=[[UILabel alloc]initWithFrame:CGRectMake(50, 5, 100, 20)];
        second_NickLabel.backgroundColor=[UIColor clearColor];
        second_NickLabel.font=[UIFont systemFontOfSize:15];
        second_NickLabel.textColor=[UIColor blackColor];
        
        Second_ContentLabel=[[UILabel alloc]initWithFrame:CGRectMake(50, 25, 265, 85)];
        Second_ContentLabel.font=[UIFont systemFontOfSize:15];
        Second_ContentLabel.textColor=[UIColor grayColor];
        Second_ContentLabel.backgroundColor=[UIColor clearColor];
        Second_ContentLabel.numberOfLines=0;
        [self addSubview:Second_Headimg];
        [self addSubview:second_NickLabel];
        [self addSubview:Second_NumberLabel];
        [self addSubview:Second_ContentLabel];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
