//
//  main.m
//  objc
//
//  Created by sunkey on 12-8-13.
//  Copyright (c) 2012年 sunkey. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#import "Category.h"


int main(int argc, char *argv[])
{
    @autoreleasepool {

        Computer * pc = [[Computer alloc]init];
        [pc NoteName];
        [pc PCName];
        [pc Width];
        [Computer NSCPU];
        pc = [Computer allocWithZone:nil];
        Computer *pp = [pc copy];
        NSLog(@"%d  %d \n", [pc retainCount],[pp retainCount]);
        return 1;
        //return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
