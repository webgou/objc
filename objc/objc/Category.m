//
//  Category.m
//  objc
//
//  Created by sunkey on 12-8-13.
//  Copyright (c) 2012年 sunkey. All rights reserved.
//

#import "Category.h"

@implementation Computer
-(void)PCName
{
    i = -1;
    NSLog(@"pc %d\n",i);
    [self NoteName];

}

-(id)copy
{
    [self retain];
    return self;
}

/*
-(void)Width
{
    i = 200;
    NSLog(@"width %d\n",i);
    
}
*/
-(void)SetIVaule:(int)newValue
{
    iValue = newValue;
}

@end

@implementation Computer (NoeBook)

-(void)NoteName
{
    //[self PCName];
    i = 1;
    NSLog(@"note %d\n",i);
}



-(void)Width
{
    i = 100;
    NSLog(@"width %d\n",i);
    
}
 
-(void)Height
{
    NSLog(@"height %d\n",i);
    
}
+(void)NSCPU
{
    NSLog(@"intel \n");
}

@end

