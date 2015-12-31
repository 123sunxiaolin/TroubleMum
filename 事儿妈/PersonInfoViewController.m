//
//  PersonInfoViewController.m
//  事儿妈
//
//  Created by B505 on 14/7/11.
//  Copyright (c) 2014年 sxl. All rights reserved.
//

#import "PersonInfoViewController.h"
#import "Define.h"
#import "LDProgressView.h"
@interface PersonInfoViewController ()

@end

@implementation PersonInfoViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self CreateBackgroundView];
}
-(void)CreateBackgroundView
{
    UIImageView *backgroundView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, 220)];
    backgroundView.backgroundColor=[UIColor clearColor];
    backgroundView.image=[UIImage imageNamed:@"person_background"];
    UIImageView *P_headimg=[[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    [P_headimg.layer setBorderColor:[UIColor whiteColor].CGColor];
    [P_headimg.layer setBorderWidth:3.0];
    [P_headimg.layer setCornerRadius:3.0];
    P_headimg.image=[UIImage imageNamed:@"headImage"];
    UILabel *Levellab=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 20)];
    Levellab.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Levelimg"]];
    Levellab.textColor=[UIColor whiteColor];
    Levellab.font=[UIFont boldSystemFontOfSize:11];
    Levellab.textAlignment=NSTextAlignmentCenter;
    Levellab.text=@"Lv.21";
    [P_headimg addSubview:Levellab];
    UILabel *NickNameLab=[[UILabel alloc]initWithFrame:CGRectMake(140, 25, 160, 30)];
    NickNameLab.backgroundColor=[UIColor clearColor];
    NickNameLab.font=[UIFont boldSystemFontOfSize:16];
    NickNameLab.textColor=[UIColor whiteColor];
    NickNameLab.text=@"薰衣草会有眼泪";
    LDProgressView *progressView = [[LDProgressView alloc] initWithFrame:CGRectMake(140, 65, 130, 10)];
    progressView.color = [UIColor orangeColor];
    progressView.flat = @YES;
    progressView.showText=@NO;
    progressView.showBackgroundInnerShadow = @NO;
    progressView.progress =1580/2000.f;
    progressView.animate = @YES;
    UILabel *percentLabel=[[UILabel alloc]initWithFrame:CGRectMake(275, 65, 40, 10)];
    percentLabel.backgroundColor=[UIColor clearColor];
    percentLabel.textColor=[UIColor orangeColor];
    percentLabel.font=[UIFont systemFontOfSize:8];
    percentLabel.text=@"1580/2000";
    UIImageView *littlePerson=[[UIImageView alloc]initWithFrame:CGRectMake(140, 95, 25, 25)];
    littlePerson.image=[UIImage imageNamed:@"little"];
    
    NSArray *segmentLabels=[NSArray arrayWithObjects:@"32赞",@"2014金币",@"1勋章", nil];
    for (NSInteger i=0; i<3; i++)
    {
        UIImageView *segmentImg=[[UIImageView alloc]initWithFrame:CGRectMake(45+i*90, 160, 30, 30)];
        segmentImg.backgroundColor=[UIColor clearColor];
        segmentImg.image=[UIImage imageNamed:@"red"];
        
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(45+i*90, 190, 60, 20)];
        label.font=[UIFont boldSystemFontOfSize:10];
        label.textColor=[UIColor whiteColor];
        label.text=[segmentLabels objectAtIndex:i];
        [backgroundView addSubview:label];
        [backgroundView addSubview:segmentImg];
    }
    
    for (NSInteger j=0; j<2; j++)
    {
        UILabel *line=[[UILabel alloc]initWithFrame:CGRectMake(100+j*90, 170, .9, 35)];
        line.backgroundColor=[UIColor whiteColor];
        [backgroundView addSubview:line];
    }
    
    [backgroundView addSubview:littlePerson];
    [backgroundView addSubview:percentLabel];
    [backgroundView addSubview:progressView];
    [backgroundView addSubview:NickNameLab];
    [backgroundView addSubview:P_headimg];
    [self.view addSubview:backgroundView];
    
    //设置个人信息的table
    personTable=[[UITableView alloc]initWithFrame:CGRectMake(0, 284, ScreenWidth, ScreenHeight-284-50) style:UITableViewStyleGrouped];
    personTable.scrollEnabled=NO;
    personTable.delegate=self;
    personTable.dataSource=self;
    personTable.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:personTable];
    
}
#pragma mark-------TableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    NSArray *arr1=[NSArray arrayWithObjects:@"账号",@"QQ",@"微博",@"地区", nil];
     NSArray *arr2=[NSArray arrayWithObjects:@"199403030312",@"1010443881",@"@m199403032",@"广东 广州", nil];
    cell.textLabel.font=[UIFont systemFontOfSize:14];
    cell.detailTextLabel.font=[UIFont systemFontOfSize:14];
    cell.textLabel.text=[arr1 objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=[arr2 objectAtIndex:indexPath.row];
    cell.userInteractionEnabled=NO;
    return cell;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
