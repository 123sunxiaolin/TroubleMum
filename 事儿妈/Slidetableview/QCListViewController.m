//
//  QCListViewController.m
//  QCSliderTableView
//
//  Created by “ sxl on 14-4-16.
//  Copyright (c) 2014年 Scasy. All rights reserved.
//

#import "QCListViewController.h"
#import "HomeCell.h"
#import "LoadMoreCell.h"
#import "MyDetailView.h"
#import "PersonInfoViewController.h"
@interface QCListViewController ()

@end

@implementation QCListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
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
    NSLog(@"viewDidLoad title = %@",self.title);
    items_Things=[[NSMutableArray alloc]init];
    items_Experience=[[NSMutableArray alloc]init];
    items_Collection=[[NSMutableArray alloc]init];
    items=[[NSMutableArray alloc]initWithCapacity:0];
    for (int i=0; i<10; i++) {
        [items addObject:[NSString stringWithFormat:@"办理身份证"]];
       
    }

}

- (void)viewDidCurrentView
{
    NSLog(@"加载为当前视图 = %@",self.title);
}


#pragma mark - 表格视图数据源代理方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    if ([self.title isEqualToString:@"我的事儿"]) {
//        return [items_Things count]+1;
//    }else if([self.title isEqualToString:@"我的经验"])
//    {
//        return [items_Experience count]+1;
//    }else
//    {
//        return [items_Collection count]+1;
//    }
    return [items count]+1;
}
-(CGFloat) tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *) indexPath
{
    return 60.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==[items count])
    {
        static NSString *Identifier = @"Cell";
        LoadMoreCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
        if (cell == nil) {
            cell = [[LoadMoreCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:Identifier];
            cell.backgroundColor=[UIColor clearColor];
        }
        cell.loadlabel.text=@"添加";
        [cell.Add addTarget:self action:@selector(loadMore) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }
    else
    {
    NSString *ListViewCellId = @"ListViewCellId";
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:ListViewCellId];
    if (cell == nil) {
        cell = [[HomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ListViewCellId];
    }
    if ([self.title isEqualToString:@"我的事儿"]) {
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
     }
    else if ([self.title isEqualToString:@"我的经验"])
     {
         UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
         imageview.image=[UIImage imageNamed:@"share.png"];
         cell.accessoryView=imageview;
     }
    else
    {
        UIImageView *myimageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        myimageview.image=[UIImage imageNamed:@"right.png"];
        cell.accessoryView=myimageview;
        
    }
    cell.FuncText.text =@"办理身份证";
    cell.CoinsText.text=@"💰五个金币";
    cell.DownloadCount.text=@"3000万次下载";
    cell.SearchCount.text=@"1850万次搜索";
    
    return  cell;
    }
}
#pragma mark----------UItableviewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   
    /*存在bug*/
    if ([self.title isEqualToString:@"我的事儿"])
    {
       
    if (indexPath.row == [items count])
    {
        LoadMoreCell *MoreCell=[_tableViewList cellForRowAtIndexPath:indexPath];
        MoreCell.loadlabel.text=@"正在加载数据...";
        [self performSelectorInBackground:@selector(loadMore) withObject:nil];
    }else
    {
        MyDetailView *detailmy=[[MyDetailView alloc]init];
        detailmy.titleLabel.text=@"流程";
       // detailmy.modalPresentationStyle=UIModalPresentationFullScreen;
        detailmy.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;

        [self  presentViewController:detailmy animated:YES completion:nil];
       
    }
    
    }
    else
    {
        MyDetailView *detailmy=[[MyDetailView alloc]init];
        detailmy.title=@"流程";
        [self  presentViewController:detailmy animated:YES completion:nil];
        detailmy.modalPresentationStyle=UIModalPresentationCustom;
        detailmy.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    }
      [tableView deselectRowAtIndexPath:indexPath animated:YES];

    //其他cell的事件
}
-(void)loadMore
{
    NSMutableArray *more;
    more=[[NSMutableArray alloc] initWithCapacity:10];
    for (NSInteger i=[items count]; i<10+[items count]; i++) {//bug修复--必须加上index
        [more addObject:[NSString stringWithFormat:@"办理身份证+%ld",(long)i]];
    }
    //加载你的数据
    [self performSelectorOnMainThread:@selector(appendTableWith:) withObject:more waitUntilDone:NO];
    //[more release];
}
-(void) appendTableWith:(NSMutableArray *)data
{
    for (int i=0;i<[data count];i++)
    {
        [items addObject:[data objectAtIndex:i]];
    }
    NSMutableArray *insertIndexPaths = [NSMutableArray arrayWithCapacity:10];
    for (int ind = 0; ind < [data count]; ind++) {
        NSIndexPath    *newPath =  [NSIndexPath indexPathForRow:[items indexOfObject:[data objectAtIndex:ind]] inSection:0];
        [insertIndexPaths addObject:newPath];
        
    }
     [_tableViewList insertRowsAtIndexPaths:insertIndexPaths withRowAnimation:UITableViewRowAnimationFade];
   
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
