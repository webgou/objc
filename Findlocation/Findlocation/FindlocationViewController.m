//
//  FindlocationViewController.m
//  Findlocation
//
//  Created by Administrator on 12-4-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FindlocationViewController.h"
#import "AboutViewController.h"

@interface FindlocationViewController ()

@end

@implementation FindlocationViewController
@synthesize arrayfortabview;

@synthesize mytableview;
@synthesize textfieldyourphonenumber;
@synthesize mylabelphonenumber;
@synthesize mylabellocation;
@synthesize mylabelmobile;
@synthesize mylabelzonecode;

- (void)viewDidLoad
{
    [super viewDidLoad];
//    [self DoCopyDatabase];
    if ([arrayfortabview count] == 0) {
        mytableview.hidden = YES;
    }
}

- (void)viewDidAppear:(BOOL)animated{
    [mytableview reloadData];
}

- (IBAction)Showthepeople:(id)sender {
    ABPeoplePickerNavigationController *ppnc = [[ABPeoplePickerNavigationController alloc] init];
    ppnc.peoplePickerDelegate = self;
    [self presentModalViewController:ppnc animated:YES];
}

#pragma mark-
#pragma phonenumber
-(BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person{
    NSMutableString *number;
    NSMutableArray *temparray = [[NSMutableArray alloc] initWithCapacity:1];
    ABMultiValueRef phone = ABRecordCopyValue(person, kABPersonPhoneProperty);
    NSUInteger num = [(__bridge NSMutableArray *)ABMultiValueCopyArrayOfAllValues(phone) count];
    if (num >0) {
        for (int i = 0; i<num; i++) {
            number = (__bridge NSMutableString *)ABMultiValueCopyValueAtIndex(phone, i);
            [temparray addObject:number];
        }
    }
    self.arrayfortabview = temparray;
    self.mytableview.hidden = NO;
    [mytableview reloadData];
    [self dismissModalViewControllerAnimated:YES];
    return NO;
}

-(BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier{
    return NO;
}

-(void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker{
    
}

#pragma mark-
#pragma tableview
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [arrayfortabview count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *pathstring = @"pathstring";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:pathstring];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:pathstring];
    }
    cell.textLabel.text = [arrayfortabview objectAtIndex:[indexPath row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.textfieldyourphonenumber.text = [arrayfortabview objectAtIndex:[indexPath row]];
}

#pragma mark_
#pragma 
-(NSString *)FindDatabase{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"location_Numbercity_citynumber" ofType:@"db"];
    return path;
}

- (IBAction)textfieldvaluechanged:(id)sender {
    
}

- (IBAction)textfieldeditdone:(id)sender {
    [textfieldyourphonenumber resignFirstResponder];
}

-(void)PhoneNumberError{
    textfieldyourphonenumber.text = @"";
    mylabelphonenumber.text = @"您输入的电话号码无效";
    mylabelmobile.text = @"";
    mylabellocation.text = @"";
    mylabelzonecode.text = @"";
}

- (IBAction)SearchButton:(id)sender {
    [textfieldyourphonenumber resignFirstResponder];
    mylabelmobile.text = @"";
    mylabellocation.text = @"";
    mylabelphonenumber.text = @"";
    mylabelzonecode.text = @"";
    
    NSString *findPhonenumber = @"";
    NSString *findPhoneNumberMobile = @"";
    NSString *findPhoneNumberIsACall = @"";
    NSString *findPhoneNumberIsMobile = @"";
    
    NSInteger phonenumberlength = [textfieldyourphonenumber.text length];
    NSLog(@"%d",[textfieldyourphonenumber.text length]);
    if (phonenumberlength == 3 ||
        phonenumberlength == 4 ||
        phonenumberlength == 5 ||
        phonenumberlength == 7 ||
        phonenumberlength == 11|| 
        phonenumberlength == 12||
        phonenumberlength == 13||
        phonenumberlength == 14||
        phonenumberlength == 16||
        phonenumberlength == 17) 
    {
        NSString *tempstring = textfieldyourphonenumber.text;
        if ((phonenumberlength == 14) && ([tempstring characterAtIndex:0] == '+') &&([tempstring characterAtIndex:1] == '8')&&([tempstring characterAtIndex:2] == '6')&&([tempstring characterAtIndex:3] == '1')) 
        {
            NSMutableString *tempstring02 = [NSMutableString stringWithString:tempstring];
            NSRange range;
            range.location = 0;
            range.length = 3;
            [tempstring02 deleteCharactersInRange:range];
            NSString *tempstring03 = [tempstring02 stringByPaddingToLength:7 withString:nil startingAtIndex:0];
            NSString *findPhonenumberFull = [tempstring02 stringByPaddingToLength:11 withString:nil startingAtIndex:0];
            mylabelphonenumber.text = findPhonenumberFull;
            findPhoneNumberMobile = [tempstring02 stringByPaddingToLength:3 withString:nil startingAtIndex:0];
            findPhonenumber = tempstring03;
        }else if ((phonenumberlength == 13) && ([tempstring characterAtIndex:0] == '8') &&([tempstring characterAtIndex:1] == '6')&&([tempstring characterAtIndex:2] == '1')) {
            NSMutableString *tempstring02 = [NSMutableString stringWithString:tempstring];
            NSRange range;
            range.location = 0;
            range.length = 2;
            [tempstring02 deleteCharactersInRange:range];
            NSString *tempstring03 = [tempstring02 stringByPaddingToLength:7 withString:nil startingAtIndex:0];
            NSString *findPhonenumberFull = [tempstring02 stringByPaddingToLength:11 withString:nil startingAtIndex:0];
            findPhoneNumberMobile = [tempstring02 stringByPaddingToLength:3 withString:nil startingAtIndex:0];
            mylabelphonenumber.text = findPhonenumberFull;
            findPhonenumber = tempstring03;
        }else if (((phonenumberlength == 12) && ([tempstring characterAtIndex:0] == '0'))||((phonenumberlength == 4) && ([tempstring characterAtIndex:0] == '0'))) {
            NSMutableString *tempstring02 = [NSMutableString stringWithString:tempstring];
            mylabelphonenumber.text = tempstring02;
            NSMutableString *tempstring03 = [[NSMutableString alloc] initWithCapacity:1];
            [tempstring03 appendString:[tempstring02 stringByPaddingToLength:4 withString:nil startingAtIndex:0]];
			mylabelzonecode.text = tempstring03;
			NSRange range;
            range.location = 0;
            range.length = 1;
            [tempstring03 deleteCharactersInRange:range];
            findPhoneNumberIsACall = tempstring03;
        }else if (((phonenumberlength == 11) && ([tempstring characterAtIndex:0] == '1'))||((phonenumberlength == 7) && ([tempstring characterAtIndex:0] == '1'))) {
            mylabelphonenumber.text = tempstring;
            NSMutableString *tempstring02 = [NSMutableString stringWithString:tempstring];
            findPhonenumber = [tempstring02 stringByPaddingToLength:7 withString:nil startingAtIndex:0];
            findPhoneNumberMobile = [tempstring02 stringByPaddingToLength:3 withString:nil startingAtIndex:0];
        }else if (((phonenumberlength == 16) && ([tempstring characterAtIndex:0] == '1')) && ([tempstring characterAtIndex:1] == ' ') && ([tempstring characterAtIndex:2] == '(') && ([tempstring characterAtIndex:6] == ')') && ([tempstring characterAtIndex:7] == ' ') && ([tempstring characterAtIndex:11] == '-')) {
            NSMutableString *tempstring02 = [NSMutableString stringWithString:tempstring];
            NSRange range;
            range.location = 11;
            range.length = 1;
            [tempstring02 deleteCharactersInRange:range];
            range.location = 6;
            range.length = 2;
            [tempstring02 deleteCharactersInRange:range];
            range.location = 1;
            range.length = 2;
            [tempstring02 deleteCharactersInRange:range];
            NSString *tempstring03 = [tempstring02 stringByPaddingToLength:7 withString:nil startingAtIndex:0];
            NSString *findPhonenumberFull = [tempstring02 stringByPaddingToLength:11 withString:nil startingAtIndex:0];
            findPhoneNumberMobile = [tempstring02 stringByPaddingToLength:3 withString:nil startingAtIndex:0];
            mylabelphonenumber.text = findPhonenumberFull;
            findPhonenumber = tempstring03;
        }else if (((phonenumberlength == 17) && ([tempstring characterAtIndex:0] == '+')) && ([tempstring characterAtIndex:1] == '8') && ([tempstring characterAtIndex:2] == '6') && ([tempstring characterAtIndex:3] == ' ') && ([tempstring characterAtIndex:7] == '-') && ([tempstring characterAtIndex:12] == '-')) {
            
            NSLog(@"1717171717171771");
            NSMutableString *tempstring02 = [NSMutableString stringWithString:tempstring];
            NSRange range;
            range.location = 12;
            range.length = 1;
            [tempstring02 deleteCharactersInRange:range];
            range.location = 7;
            range.length = 1;
            [tempstring02 deleteCharactersInRange:range];
            range.location = 0;
            range.length = 4;
            [tempstring02 deleteCharactersInRange:range];
            NSString *tempstring03 = [tempstring02 stringByPaddingToLength:7 withString:nil startingAtIndex:0];
            NSString *findPhonenumberFull = [tempstring02 stringByPaddingToLength:11 withString:nil startingAtIndex:0];
            findPhoneNumberMobile = [tempstring02 stringByPaddingToLength:3 withString:nil startingAtIndex:0];
            mylabelphonenumber.text = findPhonenumberFull;
            findPhonenumber = tempstring03;
        }else if (((phonenumberlength == 11) && ([tempstring characterAtIndex:0] == '0')) || ((phonenumberlength == 3) && ([tempstring characterAtIndex:0] == '0'))) {
            NSMutableString *tempstring02 = [NSMutableString stringWithString:tempstring];
            mylabelphonenumber.text = tempstring02;
            NSString *tempstring03 = [tempstring02 stringByPaddingToLength:3 withString:nil startingAtIndex:0];
			mylabelzonecode.text = tempstring03;
			NSRange range;
            range.location = 0;
            range.length = 1;
            findPhoneNumberIsACall = tempstring03;
        }else if ((phonenumberlength == 5) &&([tempstring characterAtIndex:0] == '1')) {
            mylabelphonenumber.text = tempstring;
            findPhoneNumberIsMobile = tempstring;
        }else {
            [self PhoneNumberError];
        }
    }else {
        [self PhoneNumberError];
    }
    if ([findPhonenumber length] ==7 && [findPhoneNumberMobile length] ==3) 
	{
        [self SelectInfoByPhone:findPhonenumber WithMobile:findPhoneNumberMobile];
    }else if ([findPhoneNumberIsACall length] == 3||[findPhoneNumberIsACall length] == 4)
	{
        [self SelectInfoByCall:findPhoneNumberIsACall];

    }else if ([findPhoneNumberIsMobile length] == 5)
	{
        NSInteger findPhoneNumberIsMobileInt = [findPhoneNumberIsMobile intValue];
		[self SelectInfoByPhoneNumberIsMobile:findPhoneNumberIsMobileInt];
    }
    textfieldyourphonenumber.text = @"";
}

- (IBAction)ClickAbout:(id)sender {
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(backhome) name:@"Bachhome" object:app];
    AboutViewController *aboutvc = [[AboutViewController alloc] init];
    [aboutvc setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentModalViewController:aboutvc animated:YES];
}

-(void)SelectInfoByPhone:(NSString *)phonenumber WithMobile:(NSString *)phonemobile
{
    NSString *SelectWhatMobile = @"SELECT mobile FROM numbermobile where uid=";
    NSString *SelectWhatMobileFull = [SelectWhatMobile stringByAppendingFormat:phonemobile];
    sqlite3 *database;
    if (sqlite3_open([[self FindDatabase] UTF8String], &database)
        != SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0, @"Failed to open database");
    }
    sqlite3_stmt *stmt;
    if (sqlite3_prepare_v2(database, [SelectWhatMobileFull UTF8String], -1, &stmt, nil) == SQLITE_OK) {
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            int mobilenumber = sqlite3_column_int(stmt, 0);
            if (mobilenumber) {
                NSString *mobileNumberString = [NSString stringWithFormat:@"%d",mobilenumber];
                NSString *SelectWhatMobileName = @"SELECT mobile FROM mobilenumber WHERE uid=";
                NSString *SelectWhatMobileNameFull = [SelectWhatMobileName stringByAppendingFormat:mobileNumberString];
                sqlite3_stmt *stmt2;
                if (sqlite3_prepare_v2(database, [SelectWhatMobileNameFull UTF8String], -1, &stmt2, nil) == SQLITE_OK) {
                    while (sqlite3_step(stmt2) == SQLITE_ROW) {
                        char *mobilename = (char *)sqlite3_column_text(stmt2, 0);
                        NSString *mobilenamestring = [[NSString alloc] initWithUTF8String:mobilename];
                        if (mobilenamestring!= NULL) {
                            mylabelmobile.text = mobilenamestring;
                        }
                    }
                }sqlite3_finalize(stmt2);
                
            }
        }
        sqlite3_finalize(stmt);
    }
    sqlite3_stmt *stmt3;
    NSString *SelectCityNumberByPhoneNumber = @"SELECT city FROM phonenumberwithcity WHERE uid=";
    NSString *SelectCityNumberByPhoneNumberFull = [SelectCityNumberByPhoneNumber stringByAppendingFormat:phonenumber];
    if (sqlite3_prepare_v2(database, [SelectCityNumberByPhoneNumberFull UTF8String], -1, &stmt3, nil) == SQLITE_OK) {
        if (sqlite3_step(stmt3) == SQLITE_ROW) {
            int citynumber = sqlite3_column_int(stmt3, 0);
            NSString *citynumberNSString = [NSString stringWithFormat:@"%d",citynumber]; 
            if (citynumberNSString != nil) {
                NSString *SelectCityNameAndCtiyZoneByCityBumber = @"SELECT city,zone FROM citywithnumber WHERE uid=";
                NSString *SelectCityNameAndCtiyZoneByCityBumberFull = [SelectCityNameAndCtiyZoneByCityBumber stringByAppendingFormat:citynumberNSString];
                sqlite3_stmt *stmt4;
                if (sqlite3_prepare_v2(database, [SelectCityNameAndCtiyZoneByCityBumberFull UTF8String], -1, &stmt4, nil) == SQLITE_OK) {
                    if (sqlite3_step(stmt4) == SQLITE_ROW) {
                        char *cityname = (char *)sqlite3_column_text(stmt4, 0);
                        int cityzonecode = sqlite3_column_int(stmt4, 1);
                        NSString *cityNameNSString = [[NSString alloc] initWithUTF8String:cityname];
                        NSString *cityzonecodeNnumber = [@"0" stringByAppendingFormat:@"%d",cityzonecode];
                        if (cityNameNSString != nil && cityzonecodeNnumber != nil) {
                            mylabellocation.text = cityNameNSString;
                            mylabelzonecode.text = cityzonecodeNnumber;
                        }
                    }else {
                        [self PhoneNumberError];
                    }
                    sqlite3_finalize(stmt4);
                }
            }
        }else {
            [self PhoneNumberError];
        }
        sqlite3_finalize(stmt3);
    }
    
    sqlite3_close(database);
    
	
	
}

-(void)SelectInfoByCall:(NSString *) callnumber
{
    NSString *SelectCityNameByCityZoneCode = @"SELECT city FROM citywithnumber WHERE zone=";
    NSString *SelectCityNameByCityZoneCodeFull = [SelectCityNameByCityZoneCode stringByAppendingString:callnumber ];
    sqlite3 *database;
    if (sqlite3_open([[self FindDatabase] UTF8String], &database)
        != SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0, @"Failed to open database");
    }
    sqlite3_stmt *stmt;
    if (sqlite3_prepare_v2(database, [SelectCityNameByCityZoneCodeFull UTF8String], -1, &stmt, nil) == SQLITE_OK) {
        if (sqlite3_step(stmt) == SQLITE_ROW) {
            char *cityname = (char *)sqlite3_column_text(stmt, 0);
            NSString *cityNameNSString = [[NSString alloc] initWithUTF8String:cityname];
            if (cityname != nil) {
                mylabellocation.text = cityNameNSString;
            }        
        }else {
            [self PhoneNumberError];
        }
        sqlite3_finalize(stmt);
    }
    sqlite3_close(database);
    
}

-(void)SelectInfoByPhoneNumberIsMobile:(NSInteger)PhoneNumberIsMobile
{
	if(PhoneNumberIsMobile == 10000){
		mylabelmobile.text = @"中国电信客服";
	}else if(PhoneNumberIsMobile == 10001){
		mylabelmobile.text = @"中国电信自助服务热线";
	}else if(PhoneNumberIsMobile == 10010){
		mylabelmobile.text = @"中国联通客服";
	}else if(PhoneNumberIsMobile == 10011){
		mylabelmobile.text = @"中国联通充值";
	}else if(PhoneNumberIsMobile == 10086){
		mylabelmobile.text = @"中国移动客服";
	}else{
		mylabelmobile.text = @"输入号码不正确";
	}
}

-(void)backhome{
    [self dismissModalViewControllerAnimated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)viewDidUnload
{
    [self setMylabelphonenumber:nil];
    [self setMylabellocation:nil];
    [self setMylabelmobile:nil];
    [self setMylabelzonecode:nil];
    [self setTextfieldyourphonenumber:nil];
    [self setMytableview:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
@end
