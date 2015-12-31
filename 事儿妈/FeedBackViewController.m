//
//  FeedBackViewController.m
//  事儿妈
//
//  Created by B505 on 14/7/8.
//  Copyright (c) 2014年 sxl. All rights reserved.
//

#import "FeedBackViewController.h"

@interface FeedBackViewController ()

@end

@implementation FeedBackViewController

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
    FdtextView=[[UITextView alloc]initWithFrame:CGRectMake(10, 84, 300, 100)];
    FdtextView.selectedRange=NSMakeRange(0,0);
    FdtextView.backgroundColor=[UIColor clearColor];
    FdtextView.textColor=[UIColor blackColor];
    [FdtextView.layer setBorderWidth:1.0f];
    [FdtextView.layer setBorderColor:[UIColor blackColor].CGColor];
    FdtextView.delegate=self;
    [FdtextView becomeFirstResponder];
   // [FdtextView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];

    [self.view addSubview:FdtextView];
    //添加手势 点击键盘退回
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ReturnBackKeyBoard)];
    [self.view addGestureRecognizer:tap];
    //添加取消  发送按钮
    UIButton *Cancel=[UIButton buttonWithType:UIButtonTypeCustom];
    Cancel.frame=CGRectMake(10, 190, 80, 40);
    Cancel.backgroundColor=[UIColor grayColor];
    [Cancel setTitle:@"取消" forState:UIControlStateNormal];
    [Cancel.layer setCornerRadius:5.0];
    Cancel.tag=100;
    [Cancel addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Cancel];
    
    UIButton *SendBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    SendBtn.frame=CGRectMake(230, 190, 80, 40);
    SendBtn.backgroundColor=[UIColor greenColor];
    [SendBtn setTitle:@"发送" forState:UIControlStateNormal];
    [SendBtn.layer setCornerRadius:5.0];
    SendBtn.tag=101;
    [SendBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:SendBtn];
}

/*- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{//解决textView光标不在首位置的问题
    UITextView *textView11 = object;
    textView11.contentOffset = (CGPoint){.x = 0,.y = 0};
}
*/
-(void)ReturnBackKeyBoard
{//点击屏幕的其他地方使键盘收回
    [FdtextView resignFirstResponder];
}
#pragma mark------clickDelegate
-(void)btnClick:(UIButton *)sender
{
    NSInteger BtnTag=sender.tag;
    switch (BtnTag) {
        case 100:
        {//当前为取消按钮
            FdtextView.text=@"";
            [FdtextView resignFirstResponder];
            
        }
            break;
            case 101:
        {//当前为发送按钮
            
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
