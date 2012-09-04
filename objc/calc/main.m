//
//  main.m
//  calc
//
//  Created by sunkey on 12-8-17.
//  Copyright (c) 2012年 sunkey. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        
        int n =20;
        for (int i = 0; -i < n; i--) {
            printf("-");
        }
        return 1;
    }
}
