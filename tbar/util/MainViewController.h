//
//  MainViewController.h
//  util
//
//  Created by sunkey on 12-8-31.
//  Copyright (c) 2012年 sunkey. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UIPopoverControllerDelegate>

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

@end
