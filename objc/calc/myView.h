//
//  myView.h
//  objc
//
//  Created by sunkey on 12-8-20.
//  Copyright (c) 2012年 sunkey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myShow.h"

typedef enum {
	plusSign = 1,
	minusSign = 2,
	timesSign = 3,
	divideSign = 4
} OperatorSign;

typedef enum
{
    soundTypeNumber,
    soundTypeError,
}soundType;

enum {
    positiveAndMinus,
    clear,
    equal,
}btn_type;
@interface myView : UIView<ViewPro>
{
    int n;
    UITextField *showText;
    
    int left;
	double resultLeft;
	int right;
	double resultRight;
	BOOL opSign;
	BOOL isLeft;
	BOOL dotSign;
	BOOL judgeClear;
	int dotLength;
	BOOL judgeDotBug;
	NSString *showSave;
	NSString *constantZero;
	BOOL transWhat;
	BOOL isOp;
	BOOL continueCal;
	BOOL transValue;
	BOOL isExp;
	BOOL opBug; //change positive or minus, will lead to result fault
	int floatBug; // float type, we can't give 0.1 to a float, and show 0.1
	OperatorSign isOperator;
	BOOL isPlay;
	UIButton *soundBtn;
	UIImage *imageMute;
	UIImage *imagePlay;

}

@property (nonatomic, retain) NSString *showSave;

-(void)hit:(id)sender;
-(BOOL)textFieldShouldReturn:(UITextField*)textField;
- (void) calculate:(OperatorSign)currentOperator;
- (NSString *) changeFloat:(double)Right;
- (void) divZero;
- (void) voicePlay:(soundType) currentType isPlay:(BOOL)isPlayed;

@end
