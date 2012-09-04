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
        NSLog(@"%d\n",[pc retainCount]);
        [pc release];
        return 1;
        //return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
