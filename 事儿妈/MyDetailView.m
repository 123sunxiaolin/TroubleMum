//
//  MyDetailView.m
//  事儿妈
//
//  Created by B505 on 14/7/12.
//  Copyright (c) 2014年 sxl. All rights reserved.
//

#import "MyDetailView.h"
#import "Define.h"
#import "PersonInfoViewController.h"
#import "Define.h"
#import "LDProgressView.h"
@interface MyDetailView ()

@end

@implementation MyDetailView
@synthesize titleLabel;
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)InitNavigationBar
{
    UIView *naview=[[UIView alloc]initWithFrame:CGRectMake(0, 20, ScreenWidth, 44)];
    naview.backgroundColor=[UIColor whiteColor];
    //设置左右按钮
    UIButton *leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame=CGRectMake(10, 5, 40, 30);
    [leftBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [leftBtn setTitle:@"返回" forState:UIControlStateNormal];
    leftBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    [leftBtn.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [leftBtn.layer setBorderWidth:0.5];
    [leftBtn.layer setCornerRadius:5.0];
    leftBtn.tag=39;
    [leftBtn addTarget:self action:@selector(MyDetailClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *rightbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    rightbtn.frame=CGRectMake(ScreenWidth-50, 7, 40, 30);
    [rightbtn setImage:[UIImage imageNamed:@"person"] forState:UIControlStateNormal];
    [rightbtn.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [rightbtn.layer setBorderWidth:0.5];
    [rightbtn.layer setCornerRadius:5.0];
    rightbtn.tag=40;
    [rightbtn addTarget:self action:@selector(MyDetailClicked:) forControlEvents:UIControlEventTouchUpInside];
    titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(100, 5, 120, 30)];
    titleLabel.backgroundColor=[UIColor clearColor];
    titleLabel.textColor=[UIColor blackColor];
    titleLabel.font=[UIFont systemFontOfSize:18];
    [naview addSubview:titleLabel];
    [naview addSubview:leftBtn];
    [naview addSubview:rightbtn];
    [self.view addSubview:naview];
}
-(void)initBackgroundView
{
    UIImageView *imgbackrgound=[[UIImageView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, 120)];
    imgbackrgound.backgroundColor=[UIColor clearColor];
    imgbackrgound.image=[UIImage imageNamed:@"person_background"];
    UIImageView *Headimg=[[UIImageView alloc]initWithFrame:CGRectMake(20, 15, 90, 90)];
    Headimg.backgroundColor=[UIColor clearColor];
    [Headimg.layer setBorderColor:[UIColor whiteColor].CGColor];
    [Headimg.layer setBorderWidth:3.0];
    [Headimg.layer setCornerRadius:3.0];
    Headimg.image=[UIImage imageNamed:@"headImage"];
    UILabel *NickNameLab=[[UILabel alloc]initWithFrame:CGRectMake(140, 25, 160, 30)];
    NickNameLab.backgroundColor=[UIColor clearColor];
    NickNameLab.font=[UIFont boldSystemFontOfSize:16];
    NickNameLab.textColor=[UIColor whiteColor];
    NickNameLab.text=@"办理身份证";
    LDProgressView *progressView = [[LDProgressView alloc] initWithFrame:CGRectMake(140, 65, 130, 10)];
    progressView.color = [UIColor orangeColor];
    progressView.flat = @YES;
    progressView.showText=@NO;
    progressView.showBackgroundInnerShadow = @NO;
    progressView.progress =1580/2000.f;
    progressView.animate = @YES;
    UILabel *percentLabel=[[UILabel alloc]initWithFrame:CGRectMake(275, 65, 40, 10)];
    percentLabel.backgroundColor=[UIColor clearColor];
    percentLabel.textColor=[UIColor greenColor];
    percentLabel.font=[UIFont systemFontOfSize:8];
    //有小数转化为百分数形式
    float percent=80/100.f;
    CFLocaleRef currentLocale = CFLocaleCopyCurrent();
    CFNumberFormatterRef numberFormatter = CFNumberFormatterCreate(NULL, currentLocale, kCFNumberFormatterPercentStyle);
    CFNumberRef number = CFNumberCreate(NULL, kCFNumberFloatType, &percent);
    CFStringRef numberString = CFNumberFormatterCreateStringWithNumber(NULL, numberFormatter, number);
    percentLabel.text=[NSString stringWithFormat:@"%@",numberString];
    [imgbackrgound addSubview:percentLabel];
    [imgbackrgound addSubview:progressView];
    [imgbackrgound addSubview:NickNameLab];
    [imgbackrgound addSubview:Headimg];
    [self.view addSubview:imgbackrgound];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self InitNavigationBar];
    [self initBackgroundView];
    self.view.backgroundColor=[UIColor whiteColor];
    UIButton *rightbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    rightbtn.frame=CGRectMake(0, 0, 40, 30);
    [rightbtn setImage:[UIImage imageNamed:@"person"] forState:UIControlStateNormal];
    [rightbtn.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [rightbtn.layer setBorderWidth:0.5];
    [rightbtn.layer setCornerRadius:5.0];
    rightbtn.tag=40;
    [rightbtn addTarget:self action:@selector(MyDetailClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithCustomView:rightbtn];
    self.navigationItem.rightBarButtonItem=right;
   
}
-(void)MyDetailClicked:(UIButton *)sender
{
    switch (sender.tag) {
        case 39:
        {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
            break;

        case 40:
        {
            PersonInfoViewController *person=[[PersonInfoViewController alloc]init];
            person.title=@"个人信息";
            [self.navigationController pushViewController:person animated:YES];
        }
            break;
            
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
