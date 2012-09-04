//
//  DetailViewController.h
//  mastertype
//
//  Created by sunkey on 12-8-31.
//  Copyright (c) 2012年 sunkey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
