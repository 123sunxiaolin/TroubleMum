//
//  AboutCell.m
//  事儿妈
//
//  Created by B505 on 14/7/8.
//  Copyright (c) 2014年 sxl. All rights reserved.
//

#import "AboutCell.h"

@implementation AboutCell
@synthesize ImgView,ContentLab;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        ImgView=[[UIImageView alloc] initWithFrame:CGRectMake(10, 20, 80, 80)];
        ImgView.backgroundColor=[UIColor clearColor];
        [ImgView.layer setCornerRadius:8.0];
        ContentLab=[[UILabel alloc]initWithFrame:CGRectMake(100, 5, 200, 110)];
        ContentLab.backgroundColor=[UIColor clearColor];
        ContentLab.numberOfLines=0;
        [ContentLab adjustsFontSizeToFitWidth];
        ContentLab.font=[UIFont systemFontOfSize:14];
        [self addSubview:ImgView];
        [self addSubview:ContentLab];
        
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
