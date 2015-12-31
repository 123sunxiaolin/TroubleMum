//
//  ASkOrAnswerCel.m
//  事儿妈
//
//  Created by B505 on 14/7/9.
//  Copyright (c) 2014年 sxl. All rights reserved.
//

#import "ASkOrAnswerCel.h"

@implementation ASkOrAnswerCel
@synthesize TitleLabel,IndexImg,LineLabel,Headimg,Number_belowLabel,ContentLabel;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self initTablecellView];
    }
    return self;
}
-(void)initTablecellView
{
    TitleLabel=[[UILabel alloc]initWithFrame:CGRectMake(5, 5, 200, 40)];
    TitleLabel.backgroundColor=[UIColor clearColor];
    TitleLabel.font=[UIFont systemFontOfSize:17];
    IndexImg=[[UIImageView alloc]initWithFrame:CGRectMake(280, 15, 20, 20)];
    IndexImg.image=[UIImage imageNamed:@"index"];
    LineLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 50, 320, 1.5)];
    LineLabel.backgroundColor=[UIColor lightGrayColor];
    Headimg=[[UIImageView alloc]initWithFrame:CGRectMake(5, 60, 40, 40)];
    Headimg.backgroundColor=[UIColor clearColor];
    [Headimg.layer setCornerRadius:3.0];
    Number_belowLabel=[[UILabel alloc]initWithFrame:CGRectMake(5, 105, 40, 20)];
    //Number_belowLabel.backgroundColor=[UIColor blueColor];
    Number_belowLabel.textAlignment=NSTextAlignmentCenter;
    Number_belowLabel.font=[UIFont systemFontOfSize:15];
    [Number_belowLabel.layer setCornerRadius:5.0];
    [Number_belowLabel.layer setBorderWidth:0.3];
    [Number_belowLabel.layer setBorderColor:[UIColor blueColor].CGColor];
    ContentLabel=[[UILabel alloc]initWithFrame:CGRectMake(55, 50, 260, 100)];
    ContentLabel.font=[UIFont systemFontOfSize:15];
    ContentLabel.textColor=[UIColor grayColor];
    ContentLabel.backgroundColor=[UIColor clearColor];
    ContentLabel.numberOfLines=0;
    [self addSubview:TitleLabel];
    [self addSubview:IndexImg];
    [self addSubview:LineLabel];
    [self addSubview:Headimg];
    [self addSubview:Number_belowLabel];
    [self addSubview:ContentLabel];
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
