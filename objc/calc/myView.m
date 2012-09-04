//
//  myView.m
//  objc
//
//  Created by sunkey on 12-8-20.
//  Copyright (c) 2012年 sunkey. All rights reserved.
//

#import "myView.h"
#import <AudioToolbox/AudioServices.h>
@implementation myView

@synthesize showSave;

- (void)setShowSave:(NSString *)value {
	if (showSave != value) {
		[showSave release];
		showSave = [value retain];
	}
}

- (id)initWithFrame:(CGRect)frame
{
    opSign = NO;
	dotSign = NO;
	dotLength = 0;
	resultLeft = 0;
	resultLeft = 0;
	isLeft = YES;
	isOperator = 0;
	judgeClear = NO;
	showText.text = @"0";
	constantZero = @"0";
	judgeDotBug = NO;
	transWhat = YES;
	isOp = YES;
	transValue = NO;
	isExp = NO;
	opBug = NO;
	floatBug = -1;
	isPlay=YES;
    n = 0;
    //UIButton *btnNumber1 = [[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 50)]autorelease];
    UIButton *btnInfo = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *btnNumber0 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *btnNumber1 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *btnNumber2 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *btnNumber3 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *btnNumber4 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *btnNumber5 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *btnNumber6 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *btnNumber7 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *btnNumber8 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *btnNumber9 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *btnDot = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *btnClear = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *btnDivSign = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *btnOr = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *btnEqual = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *btnMinusSign = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *btnTimeSign = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *btnPlusSign = [UIButton buttonWithType:UIButtonTypeCustom];
    
    soundBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    showText = [[UITextField alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 300.0f, 80.0f)];
    [showText setBorderStyle:UITextBorderStyleNone];
    
    //showText.placeholder = @"0";
    showText.font = [UIFont fontWithName:@"American Typewriter" size:36];
    //showText.delegate = self;
    showText.userInteractionEnabled = false;
    showText.textAlignment = UITextAlignmentRight;
 
    soundBtn.frame = CGRectMake(280.0f, 60.0f, 45.0f, 45.0f);
    
    showText.frame = CGRectMake(20.0f, 30.0f, 290.0f, 50);
    CGRect btnRect = CGRectMake(0.0f, 100.0f, 80.0f, 71.0f);
    btnInfo.frame = CGRectOffset( btnRect, -10, -110);
    
    btnNumber7.frame = btnRect;
    btnNumber8.frame = CGRectOffset( btnRect, 80, 0);
    btnNumber9.frame = CGRectOffset( btnRect, 160, 0);
    btnDivSign.frame = CGRectOffset( btnRect, 240, 0);

    btnNumber4.frame = CGRectOffset( btnRect, 0, 71);
    btnNumber5.frame = CGRectOffset( btnRect, 80, 71);
    btnNumber6.frame = CGRectOffset( btnRect, 160, 71);
    btnTimeSign.frame = CGRectOffset( btnRect, 240, 71);

    btnNumber1.frame = CGRectOffset( btnRect, 0, 142);
    btnNumber2.frame = CGRectOffset( btnRect, 80, 142);
    btnNumber3.frame = CGRectOffset( btnRect, 160, 142);
    btnMinusSign.frame = CGRectOffset( btnRect, 240, 142);

    
    btnNumber0.frame = CGRectOffset( btnRect, 0, 213);;
    btnDot.frame = CGRectOffset( btnRect, 80, 213);;
    btnOr.frame = CGRectOffset( btnRect, 160, 213);;
    btnPlusSign.frame = CGRectOffset( btnRect, 240, 213);;
    
    btnClear.frame = CGRectOffset( btnRect, 50, 284);
    btnEqual.frame = CGRectOffset( btnRect, 200, 284);
    UIImage *butImageInfo = [UIImage imageNamed:@"information.png"];
    UIImage *butImage0 = [UIImage imageNamed:@"0.png"];
    UIImage *butImage1 = [UIImage imageNamed:@"1.png"];
    UIImage *butImage2 = [UIImage imageNamed:@"2.png"];
    UIImage *butImage3 = [UIImage imageNamed:@"3.png"];
    UIImage *butImage4 = [UIImage imageNamed:@"4.png"];
    UIImage *butImage5 = [UIImage imageNamed:@"5.png"];
    UIImage *butImage6 = [UIImage imageNamed:@"6.png"];
    UIImage *butImage7 = [UIImage imageNamed:@"7.png"];
    UIImage *butImage8 = [UIImage imageNamed:@"8.png"];
    UIImage *butImage9 = [UIImage imageNamed:@"9.png"];
    UIImage *butImageDot = [UIImage imageNamed:@"dot.png"];
    UIImage *butImageClear = [UIImage imageNamed:@"c.png"];
    UIImage *butImageDivSign = [UIImage imageNamed:@"divSign.png"];
    UIImage *butImageOr = [UIImage imageNamed:@"or.png"];
    UIImage *butImageEqual = [UIImage imageNamed:@"equal.png"];
    UIImage *butImageMinusSign = [UIImage imageNamed:@"minusSign.png"];
    UIImage *butImageTimeSign = [UIImage imageNamed:@"timeSign.png"];
    UIImage *butImagePlusSign = [UIImage imageNamed:@"plusSign.png"];
	imageMute = [UIImage imageNamed:@"/mute.png"];
	imagePlay = [UIImage imageNamed:@"/play.png"];
    
    btnInfo.tag    = -1;
    btnNumber0.tag = 0;
    btnNumber1.tag = 1;
    btnNumber2.tag = 2;
    btnNumber3.tag = 3;
    btnNumber4.tag = 4;
    btnNumber5.tag = 5;
    btnNumber6.tag = 6;
    btnNumber7.tag = 7;
    btnNumber8.tag = 8;
    btnNumber9.tag = 9;
    
    btnDot.tag     = 11;
    btnClear.tag   = 12;
    btnDivSign.tag = 13;
    btnEqual.tag   = 14;
    btnMinusSign.tag    = 15;
    btnTimeSign.tag      = 16;
    btnOr.tag           = 17;
    btnPlusSign.tag     = 18;
    soundBtn.tag        = 19;

    [btnInfo setImage:butImageInfo forState:UIControlStateNormal];
    [btnNumber0 setImage:butImage0 forState:UIControlStateNormal];
    [btnNumber1 setImage:butImage1 forState:UIControlStateNormal];
    [btnNumber2 setImage:butImage2 forState:UIControlStateNormal];
    [btnNumber3 setImage:butImage3 forState:UIControlStateNormal];
    [btnNumber4 setImage:butImage4 forState:UIControlStateNormal];
    [btnNumber5 setImage:butImage5 forState:UIControlStateNormal];
    [btnNumber6 setImage:butImage6 forState:UIControlStateNormal];
    [btnNumber7 setImage:butImage7 forState:UIControlStateNormal];
    [btnNumber8 setImage:butImage8 forState:UIControlStateNormal];
    [btnNumber9 setImage:butImage9 forState:UIControlStateNormal];
    [btnDot setImage:butImageDot forState:UIControlStateNormal];
    [btnClear setImage:butImageClear forState:UIControlStateNormal];
    [btnDivSign setImage:butImageDivSign forState:UIControlStateNormal];
    [btnEqual setImage:butImageEqual forState:UIControlStateNormal];
    [btnPlusSign setImage:butImagePlusSign forState:UIControlStateNormal];
    [btnTimeSign setImage:butImageTimeSign forState:UIControlStateNormal];
    [btnOr setImage:butImageOr forState:UIControlStateNormal];
    [btnMinusSign setImage:butImageMinusSign forState:UIControlStateNormal];
    [soundBtn setImage:imagePlay forState:UIControlStateNormal];

    
    
    [btnInfo addTarget:self action:@selector(hit:) forControlEvents: UIControlEventTouchDown];
    [btnNumber0 addTarget:self action:@selector(hit:) forControlEvents:UIControlEventTouchDown];
    [btnNumber1 addTarget:self action:@selector(hit:) forControlEvents:UIControlEventTouchDown];
    [btnNumber2 addTarget:self action:@selector(hit:) forControlEvents:UIControlEventTouchDown];
    [btnNumber3 addTarget:self action:@selector(hit:) forControlEvents:UIControlEventTouchDown];
    [btnNumber4 addTarget:self action:@selector(hit:) forControlEvents:UIControlEventTouchDown];
    [btnNumber5 addTarget:self action:@selector(hit:) forControlEvents:UIControlEventTouchDown];
    [btnNumber6 addTarget:self action:@selector(hit:) forControlEvents:UIControlEventTouchDown];
    [btnNumber7 addTarget:self action:@selector(hit:) forControlEvents:UIControlEventTouchDown];
    [btnNumber8 addTarget:self action:@selector(hit:) forControlEvents:UIControlEventTouchDown];
    [btnNumber9 addTarget:self action:@selector(hit:) forControlEvents:UIControlEventTouchDown];
    [btnDot addTarget:self action:@selector(hit:) forControlEvents:UIControlEventTouchDown];
    [btnClear addTarget:self action:@selector(hit:) forControlEvents:UIControlEventTouchDown];
    [btnDivSign addTarget:self action:@selector(hit:) forControlEvents:UIControlEventTouchDown];
    [btnPlusSign addTarget:self action:@selector(hit:) forControlEvents:UIControlEventTouchDown];
    [btnMinusSign addTarget:self action:@selector(hit:) forControlEvents:UIControlEventTouchDown];
    [btnEqual addTarget:self action:@selector(hit:) forControlEvents:UIControlEventTouchDown];
    [btnOr addTarget:self action:@selector(hit:) forControlEvents:UIControlEventTouchDown];
    [btnTimeSign addTarget:self action:@selector(hit:) forControlEvents:UIControlEventTouchDown];
    [soundBtn addTarget:self action:@selector(hit:) forControlEvents:UIControlEventTouchDown];

    //btnNumber1.backgroundColor = [UIColor whiteColor];
    //UILabel *labelNumber1= [[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 50)]autorelease];
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self addSubview:showText];
        [self addSubview:btnInfo];
        [self addSubview:btnNumber0];
        [self addSubview:btnNumber1];
        [self addSubview:btnNumber2];
        [self addSubview:btnNumber3];
        [self addSubview:btnNumber4];
        [self addSubview:btnNumber5];
        [self addSubview:btnNumber6];
        [self addSubview:btnNumber7];
        [self addSubview:btnNumber8];
        [self addSubview:btnNumber9];
        [self addSubview:btnDot];
        [self addSubview:btnClear];
        [self addSubview:btnDivSign];
        [self addSubview:btnEqual];
        [self addSubview:btnMinusSign];
        [self addSubview:btnPlusSign];
        [self addSubview:btnTimeSign];
        [self addSubview:btnOr];
        [self addSubview:soundBtn];
        
    }
    return self;
}
-(void)hit:(id)sender
{
    UIButton *btn = sender;
    UIButton *btnNumber = sender;
    NSLog(@"%d \n", btn.tag);
    if(btn.tag == -1)
    {
        /*
        UIView *fv = [[self subviews]objectAtIndex:2];
        UIView *vb = [[self subviews]objectAtIndex:1];
        CGContextRef content = UIGraphicsGetCurrentContext();
        [UIView  beginAnimations:nil context:content];
        fv.alpha = 0.0f;
        vb.alpha = 1.0f;
        fv.transform = CGAffineTransformMakeScale(0.25f, 0.25f);
        vb.transform = CGAffineTransformIdentity;
        //[self exchangeSubviewAtIndex:1 withSubviewAtIndex:2];
        
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationDuration:2.0f];
        
        [UIView commitAnimations];
         */
        self.hidden = TRUE;
        
        [self voicePlay:soundTypeNumber isPlay:isPlay];
    }
    else if(btn.tag > -1 && btn.tag < 10)
    {
        [self voicePlay:soundTypeNumber isPlay:isPlay];
        //left value from here
        if (!opSign) {
            
            if ([showSave length] >= 10 && !isExp) {
                return;
            }
            isExp = NO;
            left = btnNumber.tag;
            if (judgeClear) {
                resultLeft = 0;
            }
            if (floatBug==0) {
                showText.text = [NSString stringWithFormat:@"%@%d",showText.text,left];
                floatBug++;
            }
            if(!dotSign) {
                resultLeft = opBug ? left : resultLeft * 10 + left;
                if (opBug) {
                    opBug = NO;
                }
                self.showSave = [self changeFloat: resultLeft];
            }
            else {
                dotLength++;
                resultLeft = opBug ? left : resultLeft + pow(0.1,dotLength) * left;
                if (opBug) {
                    opBug = NO;
                }
                self.showSave = (left==0) ?
                [NSString stringWithFormat: @"%@%@", self.showSave, constantZero]
                : [self changeFloat: resultLeft];
            }
            if (floatBug == 1) {
                floatBug = -1;
            }
            else {
                showText.text = self.showSave;
            }
            
            
            judgeClear = NO;
            resultRight = continueCal ? 0 : 1;
            isOp = YES;
        }
        
        //right value from here
        else {
            
            if ([showSave length] >= 10&&resultRight!=0) {
                return;
            }
            
            right = btnNumber.tag;
            
            if (floatBug==0) {
                showText.text = [NSString stringWithFormat:@"%@%d",showText.text,right];
                floatBug++;
            }
            
            if(!dotSign) {
                resultRight = opBug ? right : resultRight * 10 + right;
                if (opBug) {
                    opBug = NO;
                }
                self.showSave = [self changeFloat: resultRight];
            }
            else {
                dotLength++;
                resultRight = opBug ? right : resultRight + pow(0.1,dotLength) * right;
                if (opBug) {
                    opBug = NO;
                }
                self.showSave = (right==0) ? 
                [NSString stringWithFormat: @"%@%@", self.showSave, constantZero] 
                : [self changeFloat: resultRight];
            }
            if (floatBug == 1) {
                floatBug = -1;
            }
            else {
                showText.text = self.showSave;
            }
            isLeft = YES;
            isOp = NO;
            transValue = NO;
        }
        judgeDotBug = NO;
    }
    else if(btn.tag == 11)
    {
        [self voicePlay:soundTypeNumber isPlay:isPlay];
    	dotSign = YES;
        if (transWhat == YES) {
            self.showSave = opSign ?
            [NSString stringWithFormat:@"%@.", [self changeFloat: resultRight]]
            : [NSString stringWithFormat:@"%@.", [self changeFloat: resultLeft]];
            showText.text = self.showSave;
            transWhat = NO;
        }
        if (judgeDotBug) {
            resultLeft = 0;
            self.showSave = @"0.";
            showText.text = self.showSave;
        }
        judgeDotBug = NO;
        opBug = NO;
        floatBug = 0;

    }
    else if(btn.tag == 12)
    {
        [self voicePlay:soundTypeNumber isPlay:isPlay];
    	opSign = NO;
        dotSign = NO;
        dotLength = 0;
        resultLeft = 0;
        resultRight = 0;
        isLeft = YES;
        isOperator = 0;
        judgeClear = NO;
        showText.text = @"0";
        judgeDotBug = NO;
        transWhat = YES;
        isOp = YES;
        transValue = NO;
        isExp =NO;
        opBug = NO;
        floatBug = -1;
    }
    else if(btn.tag == 13)
    {
        [self voicePlay:soundTypeNumber isPlay:isPlay];
    	if (opSign == YES && isLeft == YES) {
            [self calculate:isOperator];
        }
        isOperator = 4;
        opSign = YES;
        isLeft = NO;
        dotSign = NO;
        resultRight = 0;
        dotLength = 0;
        judgeDotBug = NO;
        transWhat = YES;
        isOp = NO;
        transValue = YES;
        opBug = NO;
        floatBug = -1;
    }
    else if(btn.tag == 14)
    {
        [self voicePlay:soundTypeError isPlay:isPlay];
    	[self calculate:isOperator];
        opSign = NO;
        judgeClear = YES;
        dotSign = NO;
        dotLength = 0;
        left = 0;
        judgeDotBug = YES;
        transWhat = YES;
        isOp = YES;
        if ([[self changeFloat: resultLeft] length] > 10) {
            isExp = YES;
        }
        opBug = NO;
        floatBug = -1;
    }
    else if(btn.tag == 15)
    {
        [self voicePlay:soundTypeNumber isPlay:isPlay];
    	if (opSign == YES && isLeft == YES) {
            [self calculate:isOperator];
        }
        isOperator = 2;
        opSign = YES;
        isLeft = NO;
        dotSign = NO;
        resultRight = 0;
        dotLength = 0;
        judgeDotBug = NO;
        transWhat = YES;
        isOp = NO;
        transValue = YES;
        opBug = NO;
        floatBug = -1;
    }
    else if(btn.tag == 16)
    {
        [self voicePlay:soundTypeNumber isPlay:isPlay];
    	if (opSign == YES && isLeft == YES) {
            [self calculate:isOperator];
        }

        isOperator = 3;
        opSign = YES;
        isLeft = NO;
        dotSign = NO;
        resultRight = 0;
        dotLength = 0;
        judgeDotBug = NO;
        transWhat = YES;
        isOp = NO;
        transValue = YES;
        opBug = NO;
        floatBug = -1;
    }
    else if(btn.tag == 17)
    {
        [self voicePlay:soundTypeNumber isPlay:isPlay];
        if (isOp) {
            resultLeft = 0 - resultLeft;
            showText.text = [self changeFloat:resultLeft];
        }
        else {
            resultRight = 0 - resultRight;
            showText.text = [self changeFloat:resultRight];
        }
        if (resultRight==0) {
            resultLeft = 0 - resultLeft;
            showText.text = [self changeFloat:resultLeft];
        }
        opBug = YES;
    }
    else if(btn.tag == 18)
    {
        [self voicePlay:soundTypeNumber isPlay:isPlay];
    	if (opSign == YES && isLeft == YES) {
            [self calculate:isOperator];
        }
        isOperator = 1;
        opSign = YES;
        isLeft = NO;
        dotSign = NO;
        resultRight = 0;
        dotLength = 0;
        judgeDotBug = NO;
        transWhat = YES;
        isOp = NO;
        transValue = YES;
        opBug = NO;
        floatBug = -1;
    }
    else if(btn.tag == 19)
    {
        if(isPlay) {
            isPlay = NO;
            [soundBtn setImage:imageMute forState:UIControlStateNormal];
        }
        else {
            isPlay = YES;
            [soundBtn setImage:imagePlay forState:UIControlStateNormal];
        }
    }
}

- (void) voicePlay:(soundType) currentType isPlay:(BOOL)isPlayed
{
    if(!isPlayed)return;
    
    NSString * path;
    switch (currentType) {
        case soundTypeNumber:
            path = [NSString stringWithFormat:@"%@%@",[[NSBundle mainBundle]resourcePath],@"/soundNumber.wav" ];
            break;
        case soundTypeError:
            path = [NSString stringWithFormat:@"%@%@",[[NSBundle mainBundle]resourcePath],@"/soundEqual.wav" ];
            break;
            
        default:
            break;
    }
    
    SystemSoundID soundID;
    NSURL *filePath = [NSURL fileURLWithPath:path isDirectory:NO];
    AudioServicesCreateSystemSoundID((CFURLRef)filePath, &soundID);
    AudioServicesPlaySystemSound(soundID);
    

}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //NSLog(@"set  %d\n",n++);
}
//textFieldShouldReturn
-(BOOL)textFieldShouldReturn:(UITextField*)textField
{
    [showText resignFirstResponder];
    return  YES;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
//clear number's zero
- (NSString *)changeFloat:(double)Right {
	NSString *stringFloat;
	stringFloat = [NSString stringWithFormat:@"%.10f",Right];
	const char *floatChars = [stringFloat UTF8String];
    NSUInteger length = [stringFloat length];
    NSUInteger zeroLength = 0;
	int i;
    for(i = length-1; i>=0; i--)
    {
        if(floatChars[i] == '0') {
            zeroLength++;
        }
		else {
			if(floatChars[i] == '.') {
                i--;
			}
            break;
        }
    }
    NSString *returnString;
	returnString = (i==-1) ? @"0" : [stringFloat substringToIndex:i+1];
    return returnString;
}
- (void)divZero {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error！"
													message:@"Divisor must not be zero！"
												   delegate:self
										  cancelButtonTitle:@"OK"
										  otherButtonTitles:nil];
	[alert show];
	[alert release];
	//[self voicePlay:soundTypeError isPlay:isPlay];
}

//calculate result
- (void) calculate:(OperatorSign)currentOperator {
	if (transValue) {
		resultRight = resultLeft;
	}
	switch (currentOperator) {
		case plusSign:
			resultLeft += resultRight;
			continueCal = YES;
			break;
		case minusSign:
			resultLeft -= resultRight;
			continueCal = YES;
			break;
		case timesSign:
			resultLeft *= resultRight;
			continueCal = NO;
			break;
		case divideSign:
			if (resultRight == 0) {
				[self divZero];
				return;
			}
			resultLeft /= resultRight;
			continueCal = NO;
			break;
		default:
			break;
	}
	self.showSave = [self changeFloat: resultLeft];
    
	showText.text = ([showSave  length] > 15) ?
    [NSString stringWithFormat: @"%e",resultLeft]
    : showSave;
    //NSLog(@" retaincount : %d \n",[showSave retainCount]);
	if ([[self changeFloat: resultLeft] isEqualToString: @"-0"]) {
		showText.text = @"0";
	}
}
@end
