//
//  FourthViewController.m
//  事儿妈
//
//  Created by B505 on 14/7/10.
//  Copyright (c) 2014年 sxl. All rights reserved.
//

#import "FourthViewController.h"
#import "Define.h"
@interface FourthViewController ()

@end

@implementation FourthViewController

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
    self.view.backgroundColor=[UIColor colorWithWhite:.95 alpha:1.0];
    textView=[[UITextView alloc]initWithFrame:CGRectMake(10, 74, 300, 100)];
    textView.backgroundColor=[UIColor clearColor];
    textView.textColor=[UIColor blackColor];
    [textView.layer setBorderWidth:1.0f];
    [textView.layer setBorderColor:[UIColor blackColor].CGColor];
    textView.delegate=self;
    [self.view addSubview:textView];
    
    UIButton *SendBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    SendBtn.frame=CGRectMake(230, 190, 80, 40);
    SendBtn.titleLabel.textColor=[UIColor greenColor];
    SendBtn.backgroundColor=[UIColor greenColor];
    [SendBtn setTitle:@"发布" forState:UIControlStateNormal];
    [SendBtn.layer setCornerRadius:5.0];
    [SendBtn.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    SendBtn.titleLabel.font=[UIFont systemFontOfSize:16];
    [self.view addSubview:SendBtn];
    
    UITapGestureRecognizer *Tap11=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hide)];
    [self.view addGestureRecognizer:Tap11];

}
-(void)hide
{
    [textView resignFirstResponder];
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
