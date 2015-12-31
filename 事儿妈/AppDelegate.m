//
//  AppDelegate.m
//  事儿妈
//
//  Created by kys-2 on 14-6-4.
//  Copyright (c) 2014年 sxl. All rights reserved.
//

#import "AppDelegate.h"
#import "AKTabBarController.h"
#import "HomePage.h"
#import "Share.h"
#import "AskOrAnswer.h"
#import "Setting.h"
#import "QCSlideViewController.h"
@implementation AppDelegate
@synthesize tabBarController;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //初始化不同的选项
    //主页
    HomePage *home=[[HomePage alloc]init];
    home.title=@"热门事儿";
    UINavigationController *nav1=[[UINavigationController alloc]initWithRootViewController:home];
    //分享
    Share *share=[[Share alloc]init];
    share.title=@"热门事儿";
    UINavigationController *nav2=[[UINavigationController alloc]initWithRootViewController:share];
    //我的管理
     QCSlideViewController *me=[[QCSlideViewController alloc]init];
    me.title=@"我的管理";
    UINavigationController *nav3=[[UINavigationController alloc]initWithRootViewController:me];
    //问答
    AskOrAnswer *ask=[[AskOrAnswer alloc]init];
    ask.title=@"热门问答";
    UINavigationController *nav4=[[UINavigationController alloc]initWithRootViewController:ask];
    //设置
    Setting *set=[[Setting alloc]init];
    set.title=@"个人设置";
    UINavigationController *nav5=[[UINavigationController alloc]initWithRootViewController:set];
    //
    tabBarController=[[AKTabBarController alloc]initWithTabBarHeight:50];
    [tabBarController setMinimumHeightToDisplayTitle:40.0];
    [tabBarController setViewControllers:[NSMutableArray arrayWithObjects:nav1,nav2,nav3,nav4,nav5, nil]];
    //Tab background Image
    [tabBarController setBackgroundImageName:@"noise-dark-gray.png"];
    [tabBarController setSelectedBackgroundImageName:@"noise-dark-blue.png"];
    self.window.rootViewController=tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
