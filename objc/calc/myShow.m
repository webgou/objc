//
//  myShow.m
//  objc
//
//  Created by sunkey on 12-8-27.
//  Copyright (c) 2012年 sunkey. All rights reserved.
//

#import "myShow.h"

@implementation myShow
@synthesize  vp;



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    UIWebView *web = [[UIWebView alloc]initWithFrame:self.frame];
    static NSString *feedURLString = @"http://www.webgou.info";
    NSURLRequest *webgouRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:feedURLString]];
       
    NSMutableString *html = [NSMutableString stringWithString:@"<html><head><title></title></head><body style=\"background:transparent;\">"];
    [html appendFormat:@"body content here"];
    [html appendFormat:@"</body></html>"];
    if (self) {
        // Initialization code
        web.scalesPageToFit = TRUE;
        [web setBackgroundColor:[UIColor clearColor]];
        [web loadRequest:webgouRequest];
        //[web loadHTMLString:[html description] baseURL:nil];
        [self addSubview:web];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //self.hidden = TRUE;
    ((UIView*)vp).hidden = FALSE;
    [((UIView*)vp) didMoveToWindow];
}
@end
