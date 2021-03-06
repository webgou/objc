//
//  AppDelegate.m
//  wg
//
//  Created by sunkey on 12-8-31.
//  Copyright (c) 2012年 sunkey. All rights reserved.
//

#import "AppDelegate.h"
#import "cViewController.h"
#import "xibViewController.h"
#import "newViewController.h"
#import "xibtTabViewController.h"
#import "tabViewController.h"
@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

-(void) tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
    NSMutableArray *title = [NSMutableArray array];
   /*
    for (UIViewController *vc in viewControllers) {
        [title addObject:vc.title];
    }
    [[NSUserDefaults standardUserDefaults]setObject:title forKey:@"tabOrder"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    */
}

-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    /*
    NSNumber *tabNumber = [NSNumber numberWithInt:[tabBarController selectedIndex]];
    [[NSUserDefaults standardUserDefaults]setObject:tabNumber forKey:@"selectedTab"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    */
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] ;
    
    
    UITabBarController *uTabBarController = [[UITabBarController alloc]init];
    NSMutableArray *controlers = [NSMutableArray array];
    NSMutableArray *titles= [NSMutableArray array];
    [titles addObject:@"chat"];
    [titles addObject:@"lift"];
    [titles addObject:@"more"];
    [titles addObject:@"programming"];
    [titles addObject:@"netusage"];
    [titles addObject:@"work"];
    
    
    
    tabViewController *xbabv = [[tabViewController alloc]init];
    UINavigationController * navctlab = [[UINavigationController alloc]initWithRootViewController:xbabv];
    navctlab.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    [controlers addObject:navctlab];
    
    
    xibViewController *xbv = [[xibViewController alloc]init];
    UINavigationController * navctl = [[UINavigationController alloc]initWithRootViewController:xbv];
    navctl.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    [controlers addObject:navctl];
    
    
    for(int i = 0; i< 3; i++)
    {
        cViewController *uv = [[cViewController alloc]initWithTilte:[titles objectAtIndex:i]];
        UINavigationController * navctl = [[UINavigationController alloc]initWithRootViewController:uv];
        navctl.navigationBar.barStyle = UIBarStyleBlackTranslucent;
        [controlers addObject:navctl];
        //[controlers addObject:uv];
    }
    /*
    for(int i = 0; i< 5; i++)
    {
        cViewController *uv = [[cViewController alloc]initWithTilte:[titles objectAtIndex:i]];
        UINavigationController * navctl = [[UINavigationController alloc]initWithRootViewController:uv];
        navctl.navigationBar.barStyle = UIBarStyleBlackTranslucent;
        [controlers addObject:navctl];
        //[controlers addObject:uv];
    }
     */
     
    //uTabBarController.viewControllers = controlers;
    //uTabBarController.customizableViewControllers = controlers;
    //uTabBarController.delegate = self;
    
    [uTabBarController setViewControllers:controlers];
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window addSubview:uTabBarController.view];
    //[self.window addSubview:uv1];
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
