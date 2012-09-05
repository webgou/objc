//
//  cViewController.m
//  objc
//
//  Created by sunkey on 12-8-31.
//  Copyright (c) 2012年 sunkey. All rights reserved.
//

#import "cViewController.h"
#import "cView.h"
#import "navBarButtonITem.h"

#define showAlter(format,...) myshowAlter(__LINE__,(char*)__FUNCTION__,format,##__VA_ARGS__)

void myshowAlter(int line, char *funcname,id formatstring,...)
{
    va_list arglist;
    if(!formatstring)return;
    va_start(arglist, formatstring);
    id out_string =  [[[NSString alloc] initWithFormat:formatstring arguments: arglist]autorelease];
    va_end(arglist);
    
    NSString *filename = [[NSString stringWithCString:__FILE__ encoding:NSUTF8StringEncoding]lastPathComponent];
    NSString *debugInfo =[NSString stringWithFormat:@"%@:%d \n %s",filename,line,funcname];
    UIAlertView *av = [[[UIAlertView alloc]initWithTitle:out_string message:debugInfo delegate:Nil cancelButtonTitle:@"ok" otherButtonTitles:Nil]autorelease];
    [av show];
}


@interface cViewController()
@end

@implementation cViewController

-(cViewController*)initWithTilte:(NSString*)title
{
    self = [super init];
    if(self)
    {
        
        self.title = [[[NSBundle mainBundle]localizedInfoDictionary]objectForKey: title];
        UIImage *i = [UIImage imageNamed:@"search@2x.png"];
        UITabBarItem *bar = [self tabBarItem];
        [bar setImage:i];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStyleDone target:self action:Nil];
        //[bar setTitle:[NSString stringWithFormat:@"%@%@",title,self.title]];
        
        //[self viewDidLoad];
        //showAlter(@"%@",@"ABC");
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //UITabBarItem *tbi = [self tabBarItem];
        //[tbi setTitle:@"time"];
        
        //UIImage *i = [UIImage imageNamed:@"Time.png"];
        //[tbi setImage:i];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    return;
    UIWebView *webview = [[UIWebView alloc]initWithFrame:self.view.frame];
    NSString *strUrl = Nil;
    if([self.title isEqualToString:@"闲聊杂谈"])
    {
        //strUrl = @"http://www.webgou.info/rss.xml";
        strUrl = @"http://www.webgou.info/content/chat/";
    }
    else if ([self.title isEqualToString:@"感悟生活"])
    {
        strUrl = @"http://www.webgou.info/content/life/";
    }
    else if([self.title isEqualToString:@"编程开发"])
    {
        strUrl = @"http://www.webgou.info/content/programming/";
    }
    else if([self.title isEqualToString:@"网站应用"])
    {
        strUrl = @"http://www.webgou.info/content/netusage/";
    }
    else if([self.title isEqualToString:@"工作日志"])
    {
        strUrl = @"http://www.webgou.info/content/work/";       
    }
    NSURLRequest *reuqesl = [NSURLRequest requestWithURL:[NSURL URLWithString:strUrl] ] ;
    webview.scalesPageToFit = TRUE;
    [webview loadRequest:reuqesl];
    //self.view = webview;
    [self.view addSubview:webview];
	// Do any additional setup after loading the view.
     
}
-(void)didReceiveMemoryWarning
{
    UIAlertView *alter = [[UIAlertView alloc]initWithTitle:@"abc" message:@"sef" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:@"cancel", nil];
    [alter show];
    NSLog(@"mem \n");
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
- (void)loadView
{
    self.view = [[[NSBundle mainBundle]loadNibNamed:@"cView" owner:self options:Nil]lastObject];
    UIImage *bg= [[UIImage imageNamed:@"default_backgroud@2x.png"]autorelease];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:bg]];
    
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end
