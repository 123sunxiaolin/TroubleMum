//
//  AskOrAnswer.m
//  事儿妈
//
//  Created by kys-2 on 14-6-4.
//  Copyright (c) 2014年 sxl. All rights reserved.
//

#import "AskOrAnswer.h"
#import "Define.h"
#import "ASkOrAnswerCel.h"
#import "SecondAskOrAnswer.h"//二级详细页面
@interface AskOrAnswer ()

@end

@implementation AskOrAnswer

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
#pragma mark----设置tab图标和文字
- (NSString *)tabImageName
{
	return @"ask";
}

- (NSString *)tabTitle
{
	return @"问 答";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //设置左右按钮
    UIButton *leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame=CGRectMake(0, 0, 40, 30);
    [leftBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [leftBtn setTitle:@"广州" forState:UIControlStateNormal];
    leftBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    [leftBtn.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [leftBtn.layer setBorderWidth:0.5];
    [leftBtn.layer setCornerRadius:5.0];
    UIBarButtonItem *left=[[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem=left;
    
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
    //初始化Tableview
    AATableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-50) style:UITableViewStyleGrouped];
    AATableView.delegate=self;
    AATableView.dataSource=self;
    [self.view addSubview:AATableView];
	
}
#pragma mark--------UItableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 13;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    ASkOrAnswerCel *cell = (ASkOrAnswerCel *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[ASkOrAnswerCel alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.TitleLabel.text=@"办理身份证流程？";
    cell.Headimg.image=[UIImage imageNamed:@"head"];
    cell.Number_belowLabel.text=@"10";
    cell.ContentLabel.text=@"公安部治理管理局于今年5月下发了《关于长期外出人员办理第二代居民身份证有关事宜的通知》。异地办理居民身份证流程和办证手续.....";
    return cell;
}
#pragma mark----UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SecondAskOrAnswer *second=[[SecondAskOrAnswer alloc]init];
    second.title=@"热门问答";
    [self.navigationController pushViewController:second animated:YES];
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    cell.frame = CGRectMake(-320, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
    [UIView animateWithDuration:0.5 animations:^{
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
