//
//  AppDelegate.m
//  UITabBarControllerDemo
//
//  Created by MagicStudio on 12-3-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "MusicList.h"
#import "CurrentPlay.h"
#import "Favourite.h"
#import "SingerList.h"
#import "Settings.h"

@implementation AppDelegate

@synthesize window = _window;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    //生成各个视图控制器
    MusicList* musicList = [[[MusicList alloc]init]autorelease];
    CurrentPlay* currentPlay = [[[CurrentPlay alloc]init]autorelease];
    Favourite* favourite = [[[Favourite alloc]init]autorelease];
    SingerList* singerList = [[[SingerList alloc]init]autorelease];
    Settings* settings = [[[Settings alloc]initWithStyle:UITableViewStyleGrouped]autorelease];
//加入一个数组    
    NSArray* controllerArray = [[NSArray alloc]initWithObjects:musicList,currentPlay,favourite,singerList,settings ,nil];
//创建UITabBarController控制器  
    UITabBarController* tabBarController = [[UITabBarController alloc]init];
//    设置委托
    tabBarController.delegate = self;
//设置UITabBarController控制器的viewControllers属性为我们之前生成的数组controllerArray
    tabBarController.viewControllers = controllerArray;
//    默认选择第2个视图选项卡（索引从0开始的）
    tabBarController.selectedIndex = 1;
//    也可以通过selectedViewController 来更改
  //  tabBarController.selectedViewController = musicList;
    //读取
    UIViewController* activeController = tabBarController.selectedViewController;
    if(activeController == musicList){
        //
    }
//    把tabBarController的view作为子视图添加到window
    [self.window addSubview:tabBarController.view];
 
    //定制按钮
    /*NSMutableArray* customzableViewControllers = [[NSMutableArray alloc]init];
     [customzableViewControllers addObject:musicList];
     [customzableViewControllers addObject:currentPlay];
     [customzableViewControllers addObject:favourite];
     tabBarController.customizableViewControllers = customzableViewControllers;

    tabBarController.customizableViewControllers = nil;
     */
    
    [self.window makeKeyAndVisible];
    return YES;
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    /*添加代码，处理定制标签栏结束之后的操作*/
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
