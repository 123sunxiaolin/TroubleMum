//
//  Setting.m
//  事儿妈
//
//  Created by kys-2 on 14-6-4.
//  Copyright (c) 2014年 sxl. All rights reserved.
//

#import "Setting.h"
#import "ShakeViewController.h"//摇一摇
#import "AboutViewController.h"//关于事儿妈
#import "FeedBackViewController.h"//意见
@interface Setting ()

@end

@implementation Setting

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"个人设置";
    }
    return self;
}
#pragma mark----设置tab图标和文字
- (NSString *)tabImageName
{
	return @"setting";
}

- (NSString *)tabTitle
{
	return @"设 置";
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
    [rightbtn setImage:[UIImage imageNamed:@"person"] forState:UIControlStateNormal];
    [rightbtn.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [rightbtn.layer setBorderWidth:0.5];
    [rightbtn.layer setCornerRadius:5.0];
    UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithCustomView:rightbtn];
    self.navigationItem.rightBarButtonItem=right;
    
    
    self.view.backgroundColor=[UIColor whiteColor];
    SetLable=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-200) style:UITableViewStyleGrouped];
    SetLable.backgroundColor=[UIColor whiteColor];
    SetLable.delegate=self;
    SetLable.dataSource=self;
    SetLable.scrollEnabled=NO;
    [self.view addSubview:SetLable];
    
    //添加退出按钮
    UIButton *TuiChuButton=[UIButton buttonWithType:UIButtonTypeCustom];
    TuiChuButton.frame=CGRectMake(60, ScreenHeight-105, 200, 40);
    TuiChuButton.backgroundColor=[UIColor clearColor];
    [TuiChuButton setImage:[UIImage imageNamed:@"backForwardBtn"] forState:UIControlStateNormal];
    [self.view addSubview:TuiChuButton];
}
#pragma mark-------TableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0)
    {
        return 1;
    }else if (section==1)
    {
        return 2;
    }else
    {
       return 2;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 7;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    //[cell.layer setCornerRadius:6.0];
    [cell.imageView.layer setCornerRadius:4.0];
    if (indexPath.section==0)
    {//第一部分
        cell.imageView.image=[UIImage imageNamed:@"share"];
        cell.textLabel.text=@"摇一摇";
        cell.textLabel.font=[UIFont systemFontOfSize:16];
        
    }
    else if (indexPath.section==1)
    {//第二部分
        if (indexPath.row==0)
        {
            cell.imageView.image=[UIImage imageNamed:@"person"];
            cell.textLabel.text=@"微博";
            cell.detailTextLabel.text=@"绑定微博账号";
        }
        else
        {
            cell.imageView.image=[UIImage imageNamed:@"share"];
            cell.textLabel.text=@"QQ";
            cell.detailTextLabel.text=@"绑定QQ账号";
        }
        cell.textLabel.font=[UIFont systemFontOfSize:16];

    }
    else
    {//第三部分
        if (indexPath.row==0)
        {
            cell.imageView.image=[UIImage imageNamed:@"ask"];
            cell.textLabel.text=@"关于事儿妈";
        }
        else
        {
            cell.imageView.image=[UIImage imageNamed:@"ask"];
            cell.textLabel.text=@"意见";
        }
        cell.textLabel.font=[UIFont systemFontOfSize:16];
            
        
    }
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;

}
#pragma mark-------tableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section==0)
    {
        ShakeViewController *shake=[[ShakeViewController alloc]init];
        shake.title=@"摇一摇";
        [self.navigationController pushViewController:shake animated:YES];
    }else if (indexPath.section==1)
    {
        
    }else
    {
        if (indexPath.row==0)
        {
            AboutViewController *about=[[AboutViewController alloc]init];
            about.title=@"关于事儿妈";
            [self.navigationController pushViewController:about animated:YES];
        }else
        {
            FeedBackViewController *feedback=[[FeedBackViewController alloc]init];
            feedback.title=@"意见";
            [self.navigationController pushViewController:feedback animated:YES];
        }
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
