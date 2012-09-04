//
//  Category.h
//  objc
//
//  Created by sunkey on 12-8-13.
//  Copyright (c) 2012年 sunkey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Computer : NSObject
{
    int i;
}

-(void)PCName;
//Category is implementing a method which will also be implemented by its primary class
//-(void)Width;

@end

//extersion
@interface Computer()
{
    int iValue;
}

-(void)SetIVaule:(int)newValue;
@end

@interface Computer (NoeBook)
{
   //Ivars may not be placed in categories
   //int j;
}
-(void)NoteName;
-(void)Width;
-(void)Height;
+(void)NSCPU;
@end

