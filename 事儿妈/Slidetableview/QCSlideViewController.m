//
//  QCSlideViewController.m
//  QCSliderTableView
//
//  Created by “ sxl on 14-4-16.
//  Copyright (c) 2014年 Scasy. All rights reserved.
//

#import "QCSlideViewController.h"
#import "QCListViewController.h"
#import "PersonInfoViewController.h"
@interface QCSlideViewController ()

@end

@implementation QCSlideViewController

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
	return @"person";
}

- (NSString *)tabTitle
{
	return @"我";
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"self==%@",[self description]);;
    //设置左右按钮
    UIButton *leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame=CGRectMake(0, 0, 40, 30);
    [leftBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [leftBtn setTitle:@"广州" forState:UIControlStateNormal];
    leftBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    [leftBtn.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [leftBtn.layer setBorderWidth:0.5];
    [leftBtn.layer setCornerRadius:5.0];
    leftBtn.tag=30;
    [leftBtn addTarget:self action:@selector(MyClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *left=[[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem=left;
    
    UIButton *rightbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    rightbtn.frame=CGRectMake(0, 0, 40, 30);
    [rightbtn setImage:[UIImage imageNamed:@"person"] forState:UIControlStateNormal];
    [rightbtn.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [rightbtn.layer setBorderWidth:0.5];
    [rightbtn.layer setCornerRadius:5.0];
    rightbtn.tag=31;
    [rightbtn addTarget:self action:@selector(MyClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithCustomView:rightbtn];
    self.navigationItem.rightBarButtonItem=right;

    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    self.title = @"我的管理";
    self.slideSwitchView.tabItemNormalColor = [QCSlideSwitchView colorFromHexRGB:@"000000"];
    self.slideSwitchView.tabItemSelectedColor = [QCSlideSwitchView colorFromHexRGB:@"bb0b15"];
    self.slideSwitchView.shadowImage = [[UIImage imageNamed:@"red_line_and_shadow.png"]
                                        stretchableImageWithLeftCapWidth:59.0f topCapHeight:0.0f];
    
    
    self.vc1 = [[QCListViewController alloc] init];
    self.vc1.title = @"我的事儿";
    
    self.vc2 = [[QCListViewController alloc] init];
    self.vc2.title = @"我的经验";
    
    self.vc3 = [[QCListViewController alloc] init];
    self.vc3.title = @"我的收藏";
    
//    self.vc4 = [[QCListViewController alloc] init];
//    self.vc4.title = @"清秋Saup";
//    
//    self.vc5 = [[QCListViewController alloc] init];
//    self.vc5.title = @"清晓Saup";
//    
//    self.vc6 = [[QCListViewController alloc] init];
//    self.vc6.title = @"清幽Saup";
    
    UIButton *rightSideButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightSideButton setImage:[UIImage imageNamed:@"icon_rightarrow.png"] forState:UIControlStateNormal];
    [rightSideButton setImage:[UIImage imageNamed:@"icon_rightarrow.png"]  forState:UIControlStateHighlighted];
    rightSideButton.frame = CGRectMake(0, 0, 20.0f, 44.0f);
    rightSideButton.userInteractionEnabled = NO;
    //self.slideSwitchView.rigthSideButton = rightSideButton;
    
    [self.slideSwitchView buildUI];
}
-(void)MyClicked:(UIButton *)sender
{
    switch (sender.tag)
    {
        case 30:
        {//定位选择城市
            
        }
            break;
        case 31:
        {//个人信息
            PersonInfoViewController *person=[[PersonInfoViewController alloc]init];
            person.title=@"个人信息";
            [self.navigationController pushViewController:person animated:YES];
        }
            break;

            
        default:
            break;
    }
}
#pragma mark - 滑动tab视图代理方法


- (NSUInteger)numberOfTab:(QCSlideSwitchView *)view
{
    // you can set the best you can do it ;
    return 3;
}

- (UIViewController *)slideSwitchView:(QCSlideSwitchView *)view viewOfTab:(NSUInteger)number
{
    if (number == 0) {
        return self.vc1;
    } else if (number == 1) {
        return self.vc2;
    } else if (number == 2) {
        return self.vc3;
    } /*else if (number == 3) {
        return self.vc4;
    } else if (number == 4) {
        return self.vc5;
    } else if (number == 5) {
        return self.vc6;
    } */else {
        return nil;
    }
}

//- (void)slideSwitchView:(QCSlideSwitchView *)view panLeftEdge:(UIPanGestureRecognizer *)panParam
//{
//    QCViewController *drawerController = (QCViewController *)self.navigationController.mm_drawerController;
//    [drawerController panGestureCallback:panParam];
//}

- (void)slideSwitchView:(QCSlideSwitchView *)view didselectTab:(NSUInteger)number
{
    QCListViewController *vc = nil;
    if (number == 0) {
        vc = self.vc1;
    } else if (number == 1) {
        vc = self.vc2;
    } else if (number == 2) {
        vc = self.vc3;
    } /*else if (number == 3) {
        vc = self.vc4;
    } else if (number == 4) {
        vc = self.vc5;
    } else if (number == 5) {
        vc = self.vc6;
    }*/
    [vc viewDidCurrentView];
}

#pragma mark - 内存报警

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
