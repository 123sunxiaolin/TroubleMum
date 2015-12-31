//
//  HomePage.m
//  事儿妈
//
//  Created by kys-2 on 14-6-4.
//  Copyright (c) 2014年 sxl. All rights reserved.
//

#import "HomePage.h"
#import "ChineseInclude.h"
#import "PinYinForObjc.h"
#import "HomeCell.h"
#import "Define.h"

#import "ASIHTTPRequest.h"
#import "JSONKit.h"

#import "PersonInfoViewController.h"
@interface HomePage ()

@end

@implementation HomePage

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
	return @"home";
}

- (NSString *)tabTitle
{
	return @"首 页";
}
#pragma mark---加载Headview
-(UIView *)getHeadView
{
    //search Bar
    headView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 130)];
    headView.backgroundColor=[UIColor whiteColor];
    
    mySearchBar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
    mySearchBar.delegate=self;
    [mySearchBar setPlaceholder:@"搜索"];
//    for(id subView in [mySearchBar subviews]){
//        if([subView isKindOfClass:[UIButton class]]){
//            UIButton *btn = (UIButton *)subView;
//            [btn setTitle:@"取消"  forState:UIControlStateNormal];
//        }
//    }
    searchDisplayController = [[UISearchDisplayController alloc]initWithSearchBar:mySearchBar contentsController:self];
    searchDisplayController.delegate=self;
    searchDisplayController.active = NO;
    searchDisplayController.searchResultsDataSource = self;
    searchDisplayController.searchResultsDelegate = self;
    //scrollview
    scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, mySearchBar.frame.size.height, ScreenWidth, 90)];
    scrollView.scrollEnabled=YES;
    scrollView.pagingEnabled=NO;
    scrollView.bounces=NO;//取消反弹
    scrollView.bouncesZoom=NO;
    //取消横竖的滚动索引
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [scrollView.layer setCornerRadius:5.0];
    [scrollView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [scrollView.layer setBorderWidth:0.5];
    
    for (int i=0; i<8; i++)
    {
        UIButton *group=[UIButton buttonWithType:UIButtonTypeCustom];
        group.backgroundColor=[UIColor lightGrayColor];
        [group.layer setCornerRadius:5.0];
        UILabel *label=[[UILabel alloc]init];
        //需要修改
        if (i>=4) {
            label.frame=CGRectMake(40+75*i, 65, 75, 20);
            group.frame=CGRectMake(40+75*i, 10, 55, 50);
            
        }else
        {
            label.frame=CGRectMake(20+75*i, 65, 75, 20);
            group.frame=CGRectMake(20+75*i, 10, 55, 50);
        }
        
        label.backgroundColor=[UIColor clearColor];
        label.font=[UIFont systemFontOfSize:13];
        label.text=@"分类图标";
        label.textColor=[UIColor blackColor];
        //label.textAlignment=NSTextAlignmentCenter;
        [scrollView addSubview:group];
        [scrollView addSubview:label];
    }
    scrollView.contentSize=CGSizeMake(ScreenWidth*2, 90);
    [headView addSubview:scrollView];
    [headView addSubview:searchDisplayController.searchBar];
    
    return headView;
}

- (void) searchDisplayControllerDidEndSearch:(UISearchDisplayController *)controller
{//搜索完成后  重新设置一下searchbar的from
    controller.searchBar.frame = CGRectMake(0, 0, 320, 40);
}

-(void)HomeBtnClicked:(UIButton *)sender
{
    switch (sender.tag) {
        case 10:
        {//选择定位城市
            
        }
            break;
        case 11:
        {//跳转到个人信息
            PersonInfoViewController *person=[[PersonInfoViewController alloc]init];
            person.title=@"个人信息";
            [self.navigationController pushViewController:person animated:YES];
            
        }
            break;
        default:
            break;
    }
}
-(void)initTheHeadView
{
    //设置左右按钮
    UIButton *leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame=CGRectMake(0, 0, 40, 30);
    [leftBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [leftBtn setTitle:@"广州" forState:UIControlStateNormal];
    leftBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    [leftBtn.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [leftBtn.layer setBorderWidth:0.5];
    [leftBtn.layer setCornerRadius:5.0];
    leftBtn.tag=10;
    [leftBtn addTarget:self action:@selector(HomeBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *left=[[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem=left;
    
    UIButton *rightbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    rightbtn.frame=CGRectMake(0, 0, 40, 30);
    [rightbtn setImage:[UIImage imageNamed:@"person"] forState:UIControlStateNormal];
    [rightbtn.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [rightbtn.layer setBorderWidth:0.5];
    [rightbtn.layer setCornerRadius:5.0];
    rightbtn.tag=11;
    [rightbtn addTarget:self action:@selector(HomeBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithCustomView:rightbtn];
    self.navigationItem.rightBarButtonItem=right;
    
    
    //table
    S_tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-50)];
    S_tableView.delegate=self;
    S_tableView.dataSource=self;
    S_tableView.tableHeaderView=[self getHeadView];
    [self.view addSubview:S_tableView];
    
    //data
    dataArray = [@[@"办理身份证",@"办理身份证",@"办理身份证",@"办理身份证",@"and",@"table",@"view",@"and",@"and",@"苹果IOS",@"谷歌android",@"微软",@"微软WP",@"table",@"table",@"table",@"六六",@"六六",@"六六",@"table",@"table",@"table"]mutableCopy];
}
-(void)TopListRequest
{
   /* NSDictionary *user = [[NSDictionary alloc] initWithObjectsAndKeys:@"北京", @"city",@"",@"type_code",@"0",@"start",@"10",@"length", nil];
    //构造了一个最简单的字典类型的数据，因为自iOS 5后提供把NSDictionary转换成
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:user options:NSJSONWritingPrettyPrinted error: &error];//转换成json格式
    NSMutableData *tempJsonData = [NSMutableData dataWithData:jsonData];
    NSLog(@"Register JSON:%@",[[NSString alloc] initWithData:tempJsonData encoding:NSUTF8StringEncoding]);
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://sm.cloudrui.com/thing/topList?city=北京&type_code=0&start=0&length=10"]];
	ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setValidatesSecureCertificate:NO];
    [request setDelegate:self];
    [request setDidFailSelector:@selector(ASIHttpRequestFailed:)];
    [request setDidFinishSelector:@selector(ASIHttpRequestSuceed:)];
    //[request startAsynchronous];
    [request setDefaultResponseEncoding:NSUTF8StringEncoding];
    [request addRequestHeader:@"Content-Type" value:@"application/json; encoding=utf-8"];
    [request addRequestHeader:@"Accept" value:@"application/json"];
    [request setRequestMethod:@"GET"];
    [request setPostBody:tempJsonData];
    [request startAsynchronous];//开启同步请求*/
    
    
    
    /*不同的请求的URL不同，根据需要设定相关的参数*/
    NSURL *url = [NSURL URLWithString:@"http://sm.cloudrui.com/thing/topList?city=beijing&type_code=0&start=0&length=10"];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setValidatesSecureCertificate:NO];
    [request setDelegate:self];
    [request setDidFailSelector:@selector(ASIHttpRequestFailed:)];
    [request setDidFinishSelector:@selector(ASIHttpRequestSuceed:)];
    [request startAsynchronous];//启动同步请求
    [request setRequestMethod:@"GET"];
    [request setDefaultResponseEncoding:NSUTF8StringEncoding];
    

    
}
//网络请求失败
- (void)ASIHttpRequestFailed:(ASIHTTPRequest *)request
{
    //[SVProgressHUD showErrorWithStatus:@"数据加载失败!"];
    NSError *error = [request error];
	NSLog(@"the error is %@",error);
}
//网络请求成功
- (void)ASIHttpRequestSuceed:(ASIHTTPRequest *)request
{
     NSData *responseData = [request responseData];
    JsonBackObjcs=[responseData objectFromJSONDataWithParseOptions:JKParseOptionLooseUnicode];//得到解析的数据
    
    NSLog(@"json解析＝%@",JsonBackObjcs);

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor clearColor];
    [self initTheHeadView];
    [self TopListRequest];
   
}
#pragma mark----UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return searchResults.count;
    }
    else {
        return dataArray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    HomeCell *cell = (HomeCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[HomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    /*需要修改*/
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.CoinsText.text=@"💰五个金币";
    cell.DownloadCount.text=@"3000万次下载";
    cell.SearchCount.text=@"1850万次下载";
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        cell.FuncText.text = searchResults[indexPath.row];
        
    }
    else {
        cell.FuncText.text = dataArray[indexPath.row];
    }
    return cell;
}
-(CGFloat) tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *) indexPath {
    return 60.f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
   /* PushView *pv = [[PushView alloc]initWithNibName:@"PushView" bundle:nil];
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        pv.nStr = searchResults[indexPath.row];
    }
    else {
        pv.nStr = dataArray[indexPath.row];
    }
    [self.navigationController pushViewController:pv animated:YES];*/
}

#pragma mark---UISearchDisplayDelegate
// 键盘中，搜索按钮被按下，执行的方法
//- (void)searchBarSearchButtonClicked:(UISearchBar *) searchBar
//{
//    NSLog(@"123");
//}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    searchResults = [[NSMutableArray alloc]init];
    if (mySearchBar.text.length>0&&![ChineseInclude isIncludeChineseInString:mySearchBar.text]) {
        for (int i=0; i<dataArray.count; i++) {
            if ([ChineseInclude isIncludeChineseInString:dataArray[i]]) {
                NSString *tempPinYinStr = [PinYinForObjc chineseConvertToPinYin:dataArray[i]];
                NSRange titleResult=[tempPinYinStr rangeOfString:mySearchBar.text options:NSCaseInsensitiveSearch];
                if (titleResult.length>0) {
                    [searchResults addObject:dataArray[i]];
                }
                NSString *tempPinYinHeadStr = [PinYinForObjc chineseConvertToPinYinHead:dataArray[i]];
                NSRange titleHeadResult=[tempPinYinHeadStr rangeOfString:mySearchBar.text options:NSCaseInsensitiveSearch];
                if (titleHeadResult.length>0) {
                    [searchResults addObject:dataArray[i]];
                }
            }
            else {
                NSRange titleResult=[dataArray[i] rangeOfString:mySearchBar.text options:NSCaseInsensitiveSearch];
                if (titleResult.length>0) {
                    [searchResults addObject:dataArray[i]];
                }
            }
        }
    } else if (mySearchBar.text.length>0&&[ChineseInclude isIncludeChineseInString:mySearchBar.text]) {
        for (NSString *tempStr in dataArray) {
            NSRange titleResult=[tempStr rangeOfString:mySearchBar.text options:NSCaseInsensitiveSearch];
            if (titleResult.length>0) {
                [searchResults addObject:tempStr];
            }
        }
    }
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
