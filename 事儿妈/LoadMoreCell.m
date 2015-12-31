//
//  LoadMoreCell.m
//  事儿妈
//
//  Created by kys-2 on 14-6-11.
//  Copyright (c) 2014年 sxl. All rights reserved.
//

#import "LoadMoreCell.h"

@implementation LoadMoreCell
@synthesize Add,loadlabel;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        Add=[UIButton buttonWithType:UIButtonTypeContactAdd];
        Add.frame=CGRectMake(100, 5, 50, 50);
        Add.backgroundColor=[UIColor whiteColor];
        loadlabel=[[UILabel alloc]initWithFrame:CGRectMake(145, 5, 100, 50)];
        loadlabel.backgroundColor=[UIColor clearColor];
        loadlabel.font=[UIFont systemFontOfSize:18];
        loadlabel.text=@"添加";
        [self addSubview:Add];
        [self addSubview:loadlabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
