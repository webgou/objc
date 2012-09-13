//
//  FindlocationViewController.h
//  Findlocation
//
//  Created by Administrator on 12-4-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>


@interface FindlocationViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,ABPeoplePickerNavigationControllerDelegate>
{
    NSMutableArray *arrayfortabview;
}


@property (retain) NSMutableArray *arrayfortabview;
@property (weak, nonatomic) IBOutlet UITextField *textfieldyourphonenumber;
@property (weak, nonatomic) IBOutlet UILabel *mylabelphonenumber;
@property (weak, nonatomic) IBOutlet UILabel *mylabellocation;
@property (weak, nonatomic) IBOutlet UILabel *mylabelmobile;
@property (weak, nonatomic) IBOutlet UILabel *mylabelzonecode;

- (IBAction)textfieldvaluechanged:(id)sender;
- (IBAction)textfieldeditdone:(id)sender;
- (IBAction)SearchButton:(id)sender;
- (IBAction)ClickAbout:(id)sender;
-(NSString *)FindDatabase;

@property (weak, nonatomic) IBOutlet UITableView *mytableview;
-(void)PhoneNumberError;

-(void)SelectInfoByPhone:(NSString *)phonenumber WithMobile:(NSString *)phonemobile;
-(void)SelectInfoByCall:(NSString *) callnumber;
-(void)SelectInfoByPhoneNumberIsMobile:(NSInteger)PhoneNumberIsMobile;
-(void)DoCopyDatabase;

- (IBAction)Showthepeople:(id)sender;

-(void)backhome;
@end
