//
//  myShow.h
//  objc
//
//  Created by sunkey on 12-8-27.
//  Copyright (c) 2012年 sunkey. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ViewPro <NSObject>

@end

@interface myShow : UIView
{
    id<ViewPro> *vp;
}

@property  () id<ViewPro> *vp;
@end
