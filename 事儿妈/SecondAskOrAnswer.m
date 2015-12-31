//
//  SecondAskOrAnswer.m
//  事儿妈
//
//  Created by B505 on 14/7/10.
//  Copyright (c) 2014年 sxl. All rights reserved.
//

#import "SecondAskOrAnswer.h"
#import "Define.h"
#import "secondASKCell.h"
#import "ThirdViewController.h"
@interface SecondAskOrAnswer ()

@end

@implementation SecondAskOrAnswer

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
    self.view.backgroundColor=[UIColor colorWithWhite:0.9 alpha:1.0];
    
    UIButton *rightbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    rightbtn.frame=CGRectMake(0, 0, 40, 30);
    //[rightbtn setImage:[UIImage imageNamed:@"person"] forState:UIControlStateNormal];
    [rightbtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [rightbtn setTitle:@"提问" forState:UIControlStateNormal];
    rightbtn.titleLabel.font=[UIFont systemFontOfSize:15];
    [rightbtn.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [rightbtn.layer setBorderWidth:0.5];
    [rightbtn.layer setCornerRadius:5.0];
    UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithCustomView:rightbtn];
    self.navigationItem.rightBarButtonItem=right;
    
    [self LoadTopViewInSecondView];//加载视图
    ASkTable=[[UITableView alloc]initWithFrame:CGRectMake(0, 264, ScreenWidth, ScreenHeight-200-50-64)];
    ASkTable.backgroundColor=[UIColor colorWithWhite:0.7 alpha:1.0];
    ASkTable.delegate=self;
    ASkTable.dataSource=self;
    [self.view addSubview:ASkTable];

}
-(void)LoadTopViewInSecondView
{
    TopView=[[UIView alloc]initWithFrame:CGRectMake(0,64, ScreenWidth, 200)];
    TopView.backgroundColor=[UIColor colorWithWhite:0.90 alpha:1.0];
    
    UILabel *titleLab=[[UILabel alloc]initWithFrame:CGRectMake(5, 10, 150, 30)];
    titleLab.backgroundColor=[UIColor clearColor];
    titleLab.font=[UIFont systemFontOfSize:16];
    titleLab.text=@"办理身份证流程?";
    
    UILabel *ContentLab=[[UILabel alloc]initWithFrame:CGRectMake(5, 30, 310, 100)];
    ContentLab.font=[UIFont systemFontOfSize:15];
    ContentLab.numberOfLines=0;
    ContentLab.textColor=[UIColor grayColor];
    ContentLab.text=@"公安部治理管理局于今年5月下发了《关于长期外出人员办理第二代居民身份证有关事宜的通知》。异地办理居民身份证流程和办证手续.....";
   // [ContentLab adjustsFontSizeToFitWidth];//自动调整
    //装载功能按钮
    UIView *belowView=[[UIView alloc]initWithFrame:CGRectMake(0, 150, ScreenWidth, 50)];
    belowView.backgroundColor=[UIColor whiteColor];
    UILabel *topLine=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, .3)];
    topLine.backgroundColor=[UIColor darkGrayColor];
    UILabel *bottomLine=[[UILabel alloc]initWithFrame:CGRectMake(0, 50-.2, ScreenWidth, .2)];
    bottomLine.backgroundColor=[UIColor darkGrayColor];
    NSArray *strArr=[NSArray arrayWithObjects:@"3.8k",@"15", nil];
    for (NSInteger i=0; i<2; i++)
    {
        UIImageView *ImageVIew=[[UIImageView alloc]initWithFrame:CGRectMake(5+i*85, 15, 20, 20)];
        ImageVIew.backgroundColor=[UIColor clearColor];
        ImageVIew.image=[UIImage imageNamed:@"star"];
        [belowView addSubview:ImageVIew];
        UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(25+i*80, 15, 45, 20)];
        btn.backgroundColor=[UIColor clearColor];
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        btn.titleLabel.font=[UIFont systemFontOfSize:13];
        [btn setTitle:[strArr objectAtIndex:i] forState:UIControlStateNormal];
        [belowView addSubview:btn];
    }
    UILabel *DividedLine=[[UILabel alloc]initWithFrame:CGRectMake(160, 2, .2, 46)];
    DividedLine.backgroundColor=[UIColor darkGrayColor];
    [belowView addSubview:DividedLine];
    UIImageView *meesge=[[UIImageView alloc] initWithFrame:CGRectMake(175, 15, 20, 20)];
    meesge.image=[UIImage imageNamed:@"star"];
    UIButton *Addbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    Addbtn.frame=CGRectMake(200, 15, 60, 20);
    Addbtn.backgroundColor=[UIColor clearColor];
    [Addbtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    Addbtn.titleLabel.font=[UIFont systemFontOfSize:13];
    [Addbtn setTitle:@"添加回答" forState:UIControlStateNormal];
    [belowView addSubview:meesge];
    [belowView addSubview:Addbtn];
    [belowView addSubview:topLine];
    [belowView addSubview:bottomLine];
    
    [TopView addSubview:titleLab];
    [TopView addSubview:ContentLab];
    [TopView addSubview:belowView];
    [self.view addSubview:TopView];
}
#pragma mark----UITableViewDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 13;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    secondASKCell *cell = (secondASKCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[secondASKCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.backgroundColor=[UIColor colorWithWhite:0.90 alpha:1.0];
    }
    cell.Second_Headimg.image=[UIImage imageNamed:@"head"];
    cell.Second_NumberLabel.text=@"10";
    cell.second_NickLabel.text=@"Ratoo";
    cell.Second_ContentLabel.text=@"公安部治理管理局于今年5月下发了《关于长期外出人员办理第二代居民身份证有关事宜的通知》。异地办理居民身份证流程和办证手续.....";
    return cell;
}
#pragma mark----UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ThirdViewController *third=[[ThirdViewController alloc]init];
    third.title=@"热门回答";
    [self.navigationController pushViewController:third animated:YES];
   }
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    cell.frame = CGRectMake(-320, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
    [UIView animateWithDuration:0.6 animations:^{
        cell.frame = CGRectMake(0, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
    } completion:^(BOOL finished) {
        ;
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
