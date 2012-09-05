//
//  CurrentPlay.m
//  UITabBarControllerDemo
//
//  Created by MagicStudio on 12-3-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CurrentPlay.h"

@implementation CurrentPlay

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       self.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"CurrentPlay" image:[UIImage imageNamed:@"light"] tag:1];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton *btnPlay = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnPlay.frame = CGRectMake(20, 180, 80, 60);
    [btnPlay setTitle:@"PLAY" forState:UIControlStateNormal];
    UIButton *btnStop = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnStop.frame = CGRectMake(180, 180, 80, 60);
    [btnStop setTitle:@"STOP" forState:UIControlStateNormal];

    [self.view addSubview:btnPlay];
    [self.view addSubview:btnStop];
    
    [btnPlay release];
    [btnStop release];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
