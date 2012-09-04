//
//  AppDelegate.m
//  calc
//
//  Created by sunkey on 12-8-17.
//  Copyright (c) 2012年 sunkey. All rights reserved.
//

#import "AppDelegate.h"
#import "myView.h"
#import "myShow.h"

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
    UIImage *bg = [UIImage imageNamed:@"backGround.png"];
    //self.window.backgroundColor = [UIColor colorWithPatternImage:bg];
    //self.window.backgroundColor = [UIColor whiteColor];
    CGRect viewRect = CGRectMake(0,0,100,100);


    viewRect = self.window.screen.bounds;
    viewRect = CGRectOffset(viewRect, 0, 20);
    myView *my = [[[myView alloc]initWithFrame:viewRect]autorelease];
    myShow *sw = [[[myShow alloc] initWithFrame:viewRect]autorelease];
    my.backgroundColor = [UIColor colorWithPatternImage:bg];
    sw.backgroundColor = [UIColor grayColor];
    
    sw.vp = my;
    
    [self.window addSubview:sw];
    [self.window addSubview:my];
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
