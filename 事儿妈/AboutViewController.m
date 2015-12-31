//
//  AboutViewController.m
//  事儿妈
//
//  Created by B505 on 14/7/8.
//  Copyright (c) 2014年 sxl. All rights reserved.
//

#import "AboutViewController.h"
#import "Define.h"
#import "AboutCell.h"
@interface AboutViewController ()

@end

@implementation AboutViewController

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
    UIButton *rightbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    rightbtn.frame=CGRectMake(0, 0, 40, 30);
    [rightbtn setImage:[UIImage imageNamed:@"person"] forState:UIControlStateNormal];
    [rightbtn.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [rightbtn.layer setBorderWidth:0.5];
    [rightbtn.layer setCornerRadius:5.0];
    UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithCustomView:rightbtn];
    self.navigationItem.rightBarButtonItem=right;

    
    self.view.backgroundColor= [UIColor whiteColor];
    UITableView *table=[[UITableView alloc]initWithFrame:CGRectMake(0, 0,ScreenWidth , 200)];
    table.delegate=self;
    table.dataSource=self;
    table.backgroundColor=[UIColor clearColor];
    table.scrollEnabled=NO;
    [self.view addSubview:table];
   
}
#pragma amrk----UItableViewDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120.f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"aboutCell";
    AboutCell *cell = (AboutCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[AboutCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.userInteractionEnabled=NO;
    }
    cell.ImgView.image=[UIImage imageNamed:@"icon"];
    [cell.ImgView.layer setCornerRadius:5.0];
    cell.ContentLab.text=@"当前显示生活中的普通人,没人  经常需要处理各种不同类型的事情,在处理这些特定事件之前,多数人,多数情况下对目标事件的处理流程，不是十分了解.所以浪费时间和金钱的情况很普遍.";
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
