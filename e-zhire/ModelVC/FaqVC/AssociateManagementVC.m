//
//  AssociateManagementVC.m
//  e-zhire
//
//  Created by Developer on 30/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "AssociateManagementVC.h"
#import "AssociateInfoJsonModel.h"

@interface AssociateManagementVC ()
{
    UIDatePicker*datePicker;
    UIAlertView*datePikerAlert;
    NSString*dateString;
    NSString *userId;
   
}
@end

@implementation AssociateManagementVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     [self.menuContainerViewController setPanMode:MFSideMenuPanModeNone];

    NSLog(@"%@",_sendUserId);
    
    [self PostApiMethod];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark- API implementation
-(void)PostApiMethod{
    bool checkNet=[EZCommonMethod checkInternetConnection];
    if(!checkNet){
        [EZCommonMethod showAlert:nil message:@"Please check your internet connection"];
        return;
    }
    NSString*urlStr=[NSString stringWithFormat:@"%@%@",BaseUrl,associate_info_Api];
    NSDictionary*parameter=@{@"userId":_sendUserId};
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[NetworkManager Instance]postRequestWithUrl:urlStr parameter:parameter onCompletion:^(id dict) {
        NSLog(@"%@",dict);
        NSError* error;
        
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:dict
                                                             options:kNilOptions
                                                               error:&error];
        
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        if ([[json valueForKey:@"success"] boolValue]==1) {
            // AssociateInfoJsonModel *object2= [AssociateInfoJsonModel dictionaryOfModelsFromDictionary:[json valueForKey:@"value"] error:&error];
           
            self.frstNameTextField.text=[[[json valueForKey:@"value"]valueForKey:@"information"] valueForKey:@"firstName"];
            
             self.lastNameTextFiled.text=[[[json valueForKey:@"value"]valueForKey:@"information"] valueForKey:@"lastName"];
             self.middleNTextFiled.text=[[[json valueForKey:@"value"]valueForKey:@"information"] valueForKey:@"middleName"];
            
            self.currentStreetAdd.text=[[[json valueForKey:@"value"]valueForKey:@"information"] valueForKey:@"street_address1"];
            
            self.streetAdd2TextFiled.text=[[[json valueForKey:@"value"]valueForKey:@"information"] valueForKey:@"street_address2"];
            
             self.cityTextFieldTxt.text=[[[json valueForKey:@"value"]valueForKey:@"information"] valueForKey:@"city"];
            
            self.stateTxt.text=[[[json valueForKey:@"value"]valueForKey:@"information"] valueForKey:@"state"];
            
            self.zipCodeTxt.text=[[[json valueForKey:@"value"]valueForKey:@"information"] valueForKey:@"zip"];
            self.homePhoneTxt.text=[[[json valueForKey:@"value"]valueForKey:@"information"] valueForKey:@"home_phone"];

            self.cellPhoneTxt.text=[[[json valueForKey:@"value"]valueForKey:@"information"] valueForKey:@"cell_phone"];
            self.cellPhoneCarrierTxt.text=[[[json valueForKey:@"value"]valueForKey:@"information"] valueForKey:@"carrier_name"];
            self.personalEmailTxt.text=[[[json valueForKey:@"value"]valueForKey:@"information"] valueForKey:@"emailid"];
            self.ageLbl.text=[[[json valueForKey:@"value"]valueForKey:@"information"] valueForKey:@"age"];
            NSDictionary*birthDict=[[[json valueForKey:@"value"]valueForKey:@"information"] valueForKey:@"birhDate"];
            NSString*dayStr=[birthDict valueForKey:@"day"];
            NSString*yearStr=[birthDict valueForKey:@"year"];
            NSString*monthStr=[birthDict valueForKey:@"month"];
            self.birthDateLbel.text=[NSString stringWithFormat:@"%@ : %@ : %@",monthStr,dayStr,yearStr];
            
            ///// profile ///

         self.associateIdLbl.text=[[[json valueForKey:@"value"]valueForKey:@"profile"]valueForKey:@"AssociateID"];
         self.userNameLbl.text=[[[json valueForKey:@"value"]valueForKey:@"profile"]valueForKey:@"Login_User_Name"];
         self.associateSinceLbl.text=[[[json valueForKey:@"value"]valueForKey:@"profile"]valueForKey:@"AssociateSince"];
         self.laoginPasswordLbl.text=[[[json valueForKey:@"value"]valueForKey:@"profile"]valueForKey:@"Login_pw"];

         NSDictionary*dict=[json  valueForKey:@"value"];
            
         NSDictionary* dict2 = [[dict valueForKey:@"SecurityBackground"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];

            
         NSDictionary*setBackgroundDict = [[json  valueForKey:@"value"]objectForKey:@"SecurityBackground"];
         self.signByTxt.text=[setBackgroundDict valueForKey:@"sign_by_name"];
            
            BOOL resideCheck=[[setBackgroundDict valueForKey:@"reside_in_us"]boolValue];
            BOOL crime=[[setBackgroundDict valueForKey:@"crime"]boolValue];
            BOOL offender=[[setBackgroundDict valueForKey:@"offender"]boolValue];
            BOOL agree_flag=[[setBackgroundDict valueForKey:@"agree_flag"]boolValue];
            // check reside
            if (resideCheck) {
                UIButton*button=(UIButton*)[self.view viewWithTag:101];
                [button setImage:[UIImage imageNamed:@"circleSelected"] forState:UIControlStateNormal];
                UIButton *button2 = (UIButton *)[self.view viewWithTag:102];
                [button2 setImage:[UIImage imageNamed:@"circle"] forState:UIControlStateNormal];
            }else{
                UIButton*button=(UIButton*)[self.view viewWithTag:102];
                [button setImage:[UIImage imageNamed:@"circleSelected"] forState:UIControlStateNormal];
                UIButton *button2 = (UIButton *)[self.view viewWithTag:101];
                [button2 setImage:[UIImage imageNamed:@"circle"] forState:UIControlStateNormal];
            }
            
            //******* check crime*******//
            if (crime) {
                UIButton*button=(UIButton*)[self.view viewWithTag:103];
                [button setImage:[UIImage imageNamed:@"circleSelected"] forState:UIControlStateNormal];
                UIButton *button2 = (UIButton *)[self.view viewWithTag:104];
                [button2 setImage:[UIImage imageNamed:@"circle"] forState:UIControlStateNormal];
            }else{
                UIButton*button=(UIButton*)[self.view viewWithTag:104];
                [button setImage:[UIImage imageNamed:@"circleSelected"] forState:UIControlStateNormal];
                UIButton *button2 = (UIButton *)[self.view viewWithTag:103];
                [button2 setImage:[UIImage imageNamed:@"circle"] forState:UIControlStateNormal];
            }
            
            //******* check offrender*******//
            if (offender) {
                UIButton*button=(UIButton*)[self.view viewWithTag:105];
                [button setImage:[UIImage imageNamed:@"circleSelected"] forState:UIControlStateNormal];
                UIButton *button2 = (UIButton *)[self.view viewWithTag:106];
                [button2 setImage:[UIImage imageNamed:@"circle"] forState:UIControlStateNormal];
            }else{
                UIButton*button=(UIButton*)[self.view viewWithTag:106];
                [button setImage:[UIImage imageNamed:@"circleSelected"] forState:UIControlStateNormal];
                UIButton *button2 = (UIButton *)[self.view viewWithTag:105];
                [button2 setImage:[UIImage imageNamed:@"circle"] forState:UIControlStateNormal];
            }
             //******* agree ******//
            UIButton *button = (UIButton*)[self.view viewWithTag:201];

        if (agree_flag) {
                [button setImage:[UIImage imageNamed:@"checkbox"] forState:UIControlStateNormal];
            }else
            {
                [button setImage:[UIImage imageNamed:@"uncheck"] forState:UIControlStateNormal];
            }

        }
        else{
            [EZCommonMethod showAlert:nil message:@"Please check your email and password!"];
        }
        
    } onError:^(NSError *Error) {
        NSLog(@"%@:",Error);
        [EZCommonMethod showAlert:nil message:@"please wait"];
        [self PostApiMethod];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
}
- (IBAction)selectCheckMark:(UIButton *)sender
{
    
    if (check == YES) {
        check = NO;
        [sender setImage:[UIImage imageNamed:@"uncheck"] forState:UIControlStateNormal];
    }else
    {
        check = YES;
        [sender setImage:[UIImage imageNamed:@"checkbox"] forState:UIControlStateNormal];
    }
}
- (IBAction)yesNoAction:(UIButton *)sender
{
  
    
    if (sender.tag == 101 || sender.tag == 102) {
        if (sender.tag == 101) {
            [sender setImage:[UIImage imageNamed:@"circleSelected"] forState:UIControlStateNormal];
            UIButton *buttonWithTag = (UIButton *)[self.view viewWithTag:102];
            [buttonWithTag setImage:[UIImage imageNamed:@"circle"] forState:UIControlStateNormal];
        }else
        {
            [sender setImage:[UIImage imageNamed:@"circleSelected"] forState:UIControlStateNormal];
            UIButton *buttonWithTag = (UIButton *)[self.view viewWithTag:101];
            [buttonWithTag setImage:[UIImage imageNamed:@"circle"] forState:UIControlStateNormal];
        }
    }else if (sender.tag == 103 || sender.tag == 104) {
        if (sender.tag == 103) {
            [sender setImage:[UIImage imageNamed:@"circleSelected"] forState:UIControlStateNormal];
            UIButton *buttonWithTag = (UIButton *)[self.view viewWithTag:104];
            [buttonWithTag setImage:[UIImage imageNamed:@"circle"] forState:UIControlStateNormal];
        }else
        {
            [sender setImage:[UIImage imageNamed:@"circleSelected"] forState:UIControlStateNormal];
            UIButton *buttonWithTag = (UIButton *)[self.view viewWithTag:103];
            [buttonWithTag setImage:[UIImage imageNamed:@"circle"] forState:UIControlStateNormal];
        }
    }else if (sender.tag == 105 || sender.tag == 106) {
        if (sender.tag == 105) {
            [sender setImage:[UIImage imageNamed:@"circleSelected"] forState:UIControlStateNormal];
            UIButton *buttonWithTag = (UIButton *)[self.view viewWithTag:106];
            [buttonWithTag setImage:[UIImage imageNamed:@"circle"] forState:UIControlStateNormal];
        }else
        {
            [sender setImage:[UIImage imageNamed:@"circleSelected"] forState:UIControlStateNormal];
            UIButton *buttonWithTag = (UIButton *)[self.view viewWithTag:105];
            [buttonWithTag setImage:[UIImage imageNamed:@"circle"] forState:UIControlStateNormal];
        }
    }
}
-(void)selectDate{
    datePikerAlert = [[UIAlertView alloc] initWithTitle:@"Please Select Date" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    datePikerAlert.tag=101;
    datePikerAlert.alertViewStyle = UIAlertViewStyleDefault;
    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0,250, 150)];
    datePicker.datePickerMode = UIDatePickerModeDate;
    datePicker.minuteInterval = 30;
    [datePikerAlert setValue:datePicker forKey:@"accessoryView"];
    [datePikerAlert show];
}
- (void) alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    NSLog(@"didDISMIS");
    if(datePikerAlert.tag==101) {
        NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
        NSDate *eventDate = datePicker.date;
        [dateFormat setDateFormat:@"MM/dd/yyyy"];
        dateString = [dateFormat stringFromDate:eventDate];
        [dateFormat setDateFormat:@"hh:mm a"];
        self.birthDateLbel.text = [NSString stringWithFormat:@"%@",dateString];
    }
}
- (IBAction)birthDateAction:(id)sender {
    [self selectDate];
}
- (IBAction)continuesetupAction:(id)sender {
}
- (IBAction)saveChangeAction:(id)sender {
}
- (IBAction)helpAction:(UIButton*)sender {
    if(sender.selected == NO)
    {
        self.profileHelpLbl.text = @"Check to be certain that all information is correct. �Complete filling out all required fields. �You may return to this page any time to modify your account information. This is the page where you may change your account password as well. Be sure to 'Save Changes' after making any modifications. All of your work order notifications will be sent to�your listed email address. �Also a text will be sent to your listed Cell Phone when you receive a work order.";
        sender.selected = YES;
    }else
    {
        sender.selected = NO;
        self.profileHelpLbl.text = @"";
        self.profileHelpConstant.constant = 2.0;
    }
    [self.view layoutIfNeeded];
}
@end
