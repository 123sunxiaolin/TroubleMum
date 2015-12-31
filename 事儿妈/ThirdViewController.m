//
//  ThirdViewController.m
//  事儿妈
//
//  Created by B505 on 14/7/10.
//  Copyright (c) 2014年 sxl. All rights reserved.
//

#import "ThirdViewController.h"
#import "Define.h"
#import "FourthViewController.h"
@interface ThirdViewController ()

@end

@implementation ThirdViewController
@synthesize T_Titlelabel;
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
    //[rightbtn setImage:[UIImage imageNamed:@"person"] forState:UIControlStateNormal];
    [rightbtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [rightbtn setTitle:@"提问" forState:UIControlStateNormal];
    rightbtn.titleLabel.font=[UIFont systemFontOfSize:15];
    [rightbtn.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [rightbtn.layer setBorderWidth:0.5];
    [rightbtn.layer setCornerRadius:5.0];
    UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithCustomView:rightbtn];
    self.navigationItem.rightBarButtonItem=right;
    
    
    self.view.backgroundColor=[UIColor colorWithWhite:0.95 alpha:1.0];
    
    //
    [self initView];
}
-(void)initView
{
    T_Titlelabel=[[UILabel alloc]initWithFrame:CGRectMake(5, 74, 200, 20)];
    T_Titlelabel.font=[UIFont systemFontOfSize:17];
    T_Titlelabel.text=@"办理身份证流程?";
    
    UIView *cellView=[[UIView alloc]initWithFrame:CGRectMake(0, 109, ScreenWidth, 50)];
    cellView.backgroundColor=[UIColor whiteColor];
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(PushToAnotherViewController)];
    [cellView addGestureRecognizer:tap];
    UIImageView *T_headimg=[[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 40, 40)];
    T_headimg.image=[UIImage imageNamed:@"head"];
    UILabel *T_nickLab=[[UILabel alloc]initWithFrame:CGRectMake(50, 5, 100, 15)];
    T_nickLab.backgroundColor=[UIColor clearColor];
    T_nickLab.font=[UIFont systemFontOfSize:15];
    T_nickLab.textColor=[UIColor blackColor];
    T_nickLab.text=@"Ratoo";
    UILabel *T_ContentLab=[[UILabel alloc]initWithFrame:CGRectMake(50, 20, 190-5, 25)];
    T_ContentLab.font=[UIFont systemFontOfSize:15];
    T_ContentLab.textColor=[UIColor grayColor];
    T_ContentLab.backgroundColor=[UIColor clearColor];
    T_ContentLab.text=@"公安部治安管理和办证.......";
    
    UIImageView *ZanImg=[[UIImageView alloc]initWithFrame:CGRectMake(245, 15, 20, 20)];
    ZanImg.backgroundColor=[UIColor clearColor];
    ZanImg.image=[UIImage imageNamed:@"zan"];
    UILabel *numLab=[[UILabel alloc]initWithFrame:CGRectMake(275, 15, 40, 20)];
    numLab.textColor=[UIColor grayColor];
    numLab.font=[UIFont systemFontOfSize:15];
    numLab.text=@"3773";
    [cellView addSubview:numLab];
    [cellView addSubview:ZanImg];
    [cellView addSubview:T_ContentLab];
    [cellView addSubview:T_nickLab];
    [cellView addSubview:T_headimg];
    [self.view addSubview:cellView];
    
    UITextView *TextView=[[UITextView alloc]initWithFrame:CGRectMake(10, 159, 300, ScreenHeight-159-50)];
    TextView.backgroundColor=[UIColor clearColor];
    TextView.font=[UIFont systemFontOfSize:15];
    TextView.textColor=[UIColor grayColor];
    TextView.editable=NO;
    TextView.scrollEnabled=YES;
    TextView.text=@"公安部治理管理局于今年5月下发了《关于长期外出人员办理第二代居民身份证有关事宜的通知》。异地办理居民身份证流程和办证手续\n\n一.异地办理身份证流程:公安部有规定，派出所有义务为所辖外来人员免费拍二代证照片。因此，你只要到你现在所处的派出所去拍照片（照片要求严，外面的店无法拍的，因为他们不熟悉要求，派出所内有公安部统一配发的照相器材），然后要求他们上传到你户口地派出所（去试试不要怕，派出所有这个义务，也会为你提供便利的），之后你叫家人到户口地派出所提出申请就可以了。\n\n二.可能绝大多数都有体验办理身份证的麻烦，如果是补办身份证，更是觉得恼火，那么如果您在异地工作，把身份证丢了，需要补办您可能就要着急上火了。以前身份证只能在原籍办理，包括照相、材料申请等，但是现可以异地办理身份证了。对于在外地务工的人来说，异地办理身份证这个消息不得不说是一个好消息。那么异地办理身份证如何操作呢?\n\n三.办证步骤：1、照身份证数码相片;2、上网把相片发送到指定网站接受检测;3、相片检测合格后，打印出《数码回执单及委托书》，并按要求填写;4、把回执单及委托书寄回老家，委托亲属到户籍所在地派出所办理。";
    [self.view addSubview:TextView];
    [self.view addSubview:T_Titlelabel];
}
-(void)PushToAnotherViewController
{
    FourthViewController *fourth=[[FourthViewController alloc]init];
    fourth.title=@"热门回答";
    [self.navigationController pushViewController:fourth animated:YES];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
