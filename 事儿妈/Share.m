//
//  Share.m
//  事儿妈
//
//  Created by kys-2 on 14-6-4.
//  Copyright (c) 2014年 sxl. All rights reserved.
//

#import "Share.h"
#import "Define.h"
#import "ChineseInclude.h"
#import "PinYinForObjc.h"
#import "HomeCell.h"
#import "PersonInfoViewController.h"
@interface Share ()

@end

@implementation Share

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
	return @"share";
}

- (NSString *)tabTitle
{
	return @"分 享";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    //设置左右按钮
    UIButton *leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame=CGRectMake(0, 0, 40, 30);
    [leftBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [leftBtn setTitle:@"广州" forState:UIControlStateNormal];
    leftBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    [leftBtn.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [leftBtn.layer setBorderWidth:0.5];
    [leftBtn.layer setCornerRadius:5.0];
    leftBtn.tag=20;
    [leftBtn addTarget:self action:@selector(ShareClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *left=[[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem=left;
    
    UIButton *rightbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    rightbtn.frame=CGRectMake(0, 0, 40, 30);
    [rightbtn setImage:[UIImage imageNamed:@"person"] forState:UIControlStateNormal];
    [rightbtn.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [rightbtn.layer setBorderWidth:0.5];
    [rightbtn.layer setCornerRadius:5.0];
    rightbtn.tag=21;
    [rightbtn addTarget:self action:@selector(ShareClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithCustomView:rightbtn];
    self.navigationItem.rightBarButtonItem=right;
    //table
    shareTable=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-50)];
    shareTable.delegate=self;
    shareTable.dataSource=self;
    //search
    Share_SearchBar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
    Share_SearchBar.delegate=self;
    [Share_SearchBar setPlaceholder:@"搜索"];
    Share_searchDisplayController = [[UISearchDisplayController alloc]initWithSearchBar:Share_SearchBar contentsController:self];
    Share_searchDisplayController.delegate=self;
    Share_searchDisplayController.active = NO;
    Share_searchDisplayController.searchResultsDataSource = self;
    Share_searchDisplayController.searchResultsDelegate = self;
    shareTable.tableHeaderView=Share_SearchBar;
    [self.view addSubview:shareTable];
    
    dataArray = [@[@"办理身份证",@"办理身份证",@"办理身份证",@"办理身份证",@"and",@"table",@"view",@"and",@"and",@"苹果IOS",@"谷歌android",@"微软",@"微软WP",@"table",@"table",@"table",@"六六",@"六六",@"六六",@"table",@"table",@"table"]mutableCopy];
	
}
-(void)ShareClicked:(UIButton *)sender
{
    switch (sender.tag) {
        case 20:
        {//定位选择城市
            
        }
            break;
        case 21:
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
    cell.CoinsText.text=@"🍳五个棒棒糖";
    cell.DownloadCount.text=@"分享了3000次";
    cell.FlowersCount.font=[UIFont systemFontOfSize:10];
    cell.FlowersCount.text=@"🌹六朵鲜花";
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
  
}

#pragma mark---UISearchDisplayDelegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    searchResults = [[NSMutableArray alloc]init];
    if (Share_SearchBar.text.length>0&&![ChineseInclude isIncludeChineseInString:Share_SearchBar.text]) {
        for (int i=0; i<dataArray.count; i++) {
            if ([ChineseInclude isIncludeChineseInString:dataArray[i]]) {
                NSString *tempPinYinStr = [PinYinForObjc chineseConvertToPinYin:dataArray[i]];
                NSRange titleResult=[tempPinYinStr rangeOfString:Share_SearchBar.text options:NSCaseInsensitiveSearch];
                if (titleResult.length>0) {
                    [searchResults addObject:dataArray[i]];
                }
                NSString *tempPinYinHeadStr = [PinYinForObjc chineseConvertToPinYinHead:dataArray[i]];
                NSRange titleHeadResult=[tempPinYinHeadStr rangeOfString:Share_SearchBar.text options:NSCaseInsensitiveSearch];
                if (titleHeadResult.length>0) {
                    [searchResults addObject:dataArray[i]];
                }
            }
            else {
                NSRange titleResult=[dataArray[i] rangeOfString:Share_SearchBar.text options:NSCaseInsensitiveSearch];
                if (titleResult.length>0) {
                    [searchResults addObject:dataArray[i]];
                }
            }
        }
    } else if (Share_SearchBar.text.length>0&&[ChineseInclude isIncludeChineseInString:Share_SearchBar.text]) {
        for (NSString *tempStr in dataArray) {
            NSRange titleResult=[tempStr rangeOfString:Share_SearchBar.text options:NSCaseInsensitiveSearch];
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
