//
//  EZClientAccountVC.m
//  e-zhire
//
//  Created by Developer on 27/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZClientAccountVC.h"
#import "EZPaymentinformationCell.h"
#import "EZEditPaymentcell.h"
#import "EZworkorderVC.h"
#import "EZInvoicesVC.h"
#import "EZEditPaymentInformationVc.h"
@interface EZClientAccountVC ()
{
    NSDictionary*clientInfo;
    BOOL checkPassword;
//  NSString*userId;
    NSMutableArray*carrerArr;
    UIAlertView *pikerAlert;
    BOOL editClientCheck;
    UIPickerView *pickedView;
  
}
@end

@implementation EZClientAccountVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.editInfoView.hidden=YES;
    self.paymentInfo=[[NSMutableArray alloc]init];
   // userId=[EZCommonMethod getUserId];
    NSLog(@"user id %@",_getUserId);
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    [self PostApiMethod];
    carrerArr=[[NSMutableArray alloc]init];
    [self.menuContainerViewController setPanMode:MFSideMenuPanModeNone];

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)workorderAction:(id)sender{
    EZworkorderVC*viewcontroller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZworkorderVC"];
    viewcontroller.sendUserId=_getUserId;
    [self.navigationController pushViewController:viewcontroller animated:YES];
}

- (IBAction)closePopupAction:(id)sender {
    self.editInfoView.hidden=YES;
    self.scrollView.userInteractionEnabled=YES;
}
- (IBAction)invoiceAction:(id)sender {
    EZInvoicesVC*viewcontroller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZInvoicesVC"];
    viewcontroller.userId=_getUserId;
    [self.navigationController pushViewController:viewcontroller animated:YES];
}
- (IBAction)saveChangesAction:(id)sender {
    if (self.currentPassTextFiled.text.length>0) {
             if (self.newpass.text.length>0) {
                 if([self isPasswordValid:self.newpass.text]) {
                   if (self.reTypeTextFiled.text.length>0) {
                      if ([self.newpass.text isEqualToString:self.reTypeTextFiled.text]){
                         
                           [self PostChangePasswordApi];
                      }
                      else{
                          [EZCommonMethod showAlert:nil message:@"Please enter valid retype"];
                      }
                 }
                 else{
                     [EZCommonMethod showAlert:nil message:@"Please enter retype password"];
                 }
             }
                 else{
                     [EZCommonMethod showAlert:nil message:@"Please enter valid password"];
                 }
             }
             else{
                 [EZCommonMethod showAlert:nil message:@"Please enter new password"];
             }
        }
    else{
        [EZCommonMethod showAlert:nil message:@"Please enter current password"];
    }
}
-(BOOL) isPasswordValid:(NSString *)pwd {
    
    NSCharacterSet *upperCaseChars = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLKMNOPQRSTUVWXYZ"];
    NSCharacterSet *lowerCaseChars = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyz"];
    NSCharacterSet *numbers = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    if ( [pwd length]<10 || [pwd length]>20 )
        return NO;  // too long or too short
    NSRange rang;
    rang = [pwd rangeOfCharacterFromSet:[NSCharacterSet letterCharacterSet]];
    if ( !rang.length )
        return NO;  // no letter
    rang = [pwd rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]];
    if ( !rang.length )
        return NO;  // no number;
    rang = [pwd rangeOfCharacterFromSet:upperCaseChars];
    if ( !rang.length )
        return NO;  // no uppercase letter;
    rang = [pwd rangeOfCharacterFromSet:lowerCaseChars];
    if ( !rang.length )
        return NO;  // no lowerCase Chars;
    rang = [pwd rangeOfCharacterFromSet:numbers];
    if ( !rang.length )
        return NO;  // no numbers Chars;
    
    return YES;
}
- (IBAction)suggestnewPaswordAction:(id)sender {
    
}
-(void)PostChangePasswordApi{
    
    bool check=[EZCommonMethod checkInternetConnection];
    if(!check){
        [EZCommonMethod showAlert:nil message:@"Please check your internet connection"];
        return;
    }
       NSString*urlStr=[NSString stringWithFormat:@"%@%@",BaseUrl,changePwd_Api];
    NSDictionary*parameter=@{@"user_id":_getUserId,@"currentPWD":self.currentPassTextFiled.text,@"newPWD1":self.newpass.text};
    
       [MBProgressHUD showHUDAddedTo:self.view animated:YES];
       [[NetworkManager Instance]postRequestWithUrl:urlStr parameter:parameter onCompletion:^(id dict) {
        NSLog(@"%@",dict);
        NSError* error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:dict
                                                             options:kNilOptions
                                                               error:&error];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        if([[json valueForKey:@"success"] boolValue]==0)
        {
            [EZCommonMethod showAlert:nil message:@"Password Updated Successfully!"];
            self.loginPasswordLabel.text=self.reTypeTextFiled.text;
            self.currentPassTextFiled.text=nil;
            self.newpass.text=nil;
            self.reTypeTextFiled.text=nil;
        }
        else{
            [EZCommonMethod showAlert:nil message:@"Please check your password!"];
        }
        
    } onError:^(NSError *Error) {
        NSLog(@"%@:",Error);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
}

#pragma mark- TableView DataSource and Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.paymentInfo.count+1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        EZEditPaymentcell *cell=[tableView dequeueReusableCellWithIdentifier:@"EZEditPaymentcell"];
     cell.editPayment.tag=indexPath.row;
    [cell.editPayment addTarget:self action:@selector(editPaymentAction:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }
    static NSString *MyIdentifier = @"EZPaymentinformationCell";
    EZPaymentinformationCell *infoCell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    infoCell.accountDetailLabel.text=[self.paymentInfo objectAtIndex:indexPath.item-1];

    return infoCell;
}
- (IBAction)editPaymentAction:(id)sender {
    EZEditPaymentInformationVc*controller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZEditPaymentInformationVc"];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark- API implementation
-(void)PostApiMethod{
    
    bool check=[EZCommonMethod checkInternetConnection];
    if(!check){
        [EZCommonMethod showAlert:nil message:@"Please check your internet connection"];
        return;
    }
    NSString*urlStr;
    NSDictionary*parameter;
    if (editClientCheck) {
        urlStr=[NSString stringWithFormat:@"%@%@",BaseUrl,editUpdateclient_Api];
        parameter=@{@"user_id":_getUserId,@"streetaddr1":self.currentStreetAddTextFiled.text,@"streetaddr2":self.streetAdd2TextField.text,@"city":self.cityTextFiled.text,@"state":self.stateTextFiled.text,@"zipcode":self.zipCodeTextField.text,@"homePhone":self.homePhoneTextFiled.text,@"cellPhone":self.cellPhoneTextField.text,@"email":self.personalEmailTextFiled.text,@"cellPhoneCarrier":self.cellPhoneCarrierTextFiled.text};
    
    }else{
        urlStr=[NSString stringWithFormat:@"%@%@",BaseUrl,myAccount_Api];
        parameter=@{@"user_id":_getUserId};
    }
     [MBProgressHUD showHUDAddedTo:self.view animated:YES];
     [[NetworkManager Instance]postRequestWithUrl:urlStr parameter:parameter onCompletion:^(id dict) {
        NSLog(@"%@",dict);
        NSError* error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:dict
                                                             options:kNilOptions
                                                               error:&error];
         
         if (editClientCheck) {
             [MBProgressHUD hideHUDForView:self.view animated:YES];
              if ([[json valueForKey:@"success"] boolValue]==1) {
                                    self.address1Label.text=self.currentStreetAddTextFiled.text;
                  self.addLabel2.text=self.streetAdd2TextField.text;
                  //self.add2ConstraintHeight.constant=0;
                  NSString*cityStr=self.cityTextFiled.text;
                  NSString*stateStr=self.stateTextFiled.text;
                  NSString*zipStr=self.zipCodeTextField.text;
                  NSMutableArray *myStrings = [[NSMutableArray alloc] initWithObjects:cityStr, stateStr, zipStr,nil];
                  NSString *joinedString = [myStrings componentsJoinedByString:@","];
                  self.ZipCodeLabel.text=joinedString;
                  self.mobilePhoneLabel.text=self.homePhoneTextFiled.text;
                  self.otherPhoneLabel.text=self.cellPhoneTextField.text;
                  self.personalEmailLabel.text=self.personalEmailTextFiled.text;
                  [EZCommonMethod showAlert:nil message:@"Information Updated Successfully!"];
                  [MBProgressHUD hideHUDForView:self.view animated:YES];
                  self.scrollView.userInteractionEnabled=YES;
                  self.editInfoView.hidden=YES;
                  
              }
              else{
                  [EZCommonMethod showAlert:nil message:@"please check your email"];
   
              }
         }else{
             if ([[json valueForKey:@"success"] boolValue]==1) {
                 clientInfo = [json objectForKey:@"client_info"];
                 self.paymentInfo = [json objectForKey:@"payment_info"];
                 self.nameLabel.text=[clientInfo valueForKey:@"name"];
                 self.address1Label.text=[clientInfo valueForKey:@"street_address1"];
                 self.addLabel2.text=[clientInfo valueForKey:@"street_address2"];
                 //self.add2ConstraintHeight.constant=0;
                 NSString*cityStr=[clientInfo valueForKey:@"city"];
                 NSString*stateStr=[clientInfo valueForKey:@"state"];
                 NSString*zipStr=[clientInfo valueForKey:@"zip"];
                 NSMutableArray *myStrings = [[NSMutableArray alloc] initWithObjects:cityStr, stateStr, zipStr,nil];
                 NSString *joinedString = [myStrings componentsJoinedByString:@","];
                 self.ZipCodeLabel.text=joinedString;
                 self.clientIdLabel.text=[clientInfo valueForKey:@"client_id"];
                 self.clienySinceLabel.text=[clientInfo valueForKey:@"client_since"];
                 self.mobilePhoneLabel.text=[clientInfo valueForKey:@"mobile"];
                 self.otherPhoneLabel.text=[clientInfo valueForKey:@"other_phone"];
                 self.personalEmailLabel.text=[clientInfo valueForKey:@"personal_email_id"];
                 self.userNameLabel.text=[clientInfo valueForKey:@"login_user_name"];
                 self.loginPasswordLabel.text=[clientInfo valueForKey:@"password"];
                 [self.detailTableView reloadData];
                 [MBProgressHUD hideHUDForView:self.view animated:YES];
             }
             else{
                 [EZCommonMethod showAlert:nil message:@"Please check your email and password!"];
             }
         }
      
    } onError:^(NSError *Error) {
        NSLog(@"%@:",Error);
        [EZCommonMethod showAlert:nil message:@"try again"];
        [self PostApiMethod];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
}
- (IBAction)cellCarrierAction:(id)sender {
    [self selectCarrierApiMethod];
    pikerAlert= [[UIAlertView alloc] initWithTitle:@"Please Select" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    NSLog(@"%@",pikerAlert);
    pikerAlert.alertViewStyle = UIAlertViewStyleDefault;
    pikerAlert.tag=102;
    pickedView = [[UIPickerView alloc]init];
    [pickedView setDataSource: self];
    [pickedView setDelegate: self];
    pickedView.showsSelectionIndicator = YES;
    [pikerAlert setValue:pickedView forKey:@"accessoryView"];
    [pikerAlert show];
    [pickedView reloadAllComponents];
}
-(void)selectCarrierApiMethod{
        bool statecheck=[EZCommonMethod checkInternetConnection];
        if(!statecheck){
            [EZCommonMethod showAlert:nil message:@"Please check your internet connection"];
            return;
        }
        NSString *urlString=[NSString stringWithFormat:@"%@%@",BaseUrl,selectCarrier_Api];
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [[NetworkManager Instance] getRequestWithUrl:urlString parameter:nil onCompletion:^(id dict) {
          NSError* errorJson=nil;
          NSDictionary* json = [NSJSONSerialization JSONObjectWithData:dict
                                                                 options:kNilOptions
                                                                   error:&errorJson];
          NSLog(@"%@",json);
            if([[json valueForKey:@"success"] boolValue]==1)
            {
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                carrerArr=[json valueForKey:@"value"];
                [pickedView reloadAllComponents];
            }
            else{
                [EZCommonMethod showAlert:nil message:@"Please check try again"];
            }
            
        }onError:^(NSError *Error) {
            NSLog(@"%@:",Error);
            [EZCommonMethod showAlert:nil message:@"Please check try again"];
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }];

}
#pragma mark- PickerView delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
}
// tell the picker how many rows are available for a given component

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [carrerArr count];
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return [[carrerArr objectAtIndex: row]valueForKey:@"name"];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
    
    self.cellPhoneCarrierTextFiled.text=[[carrerArr objectAtIndex:row]valueForKey:@"name"];
}
- (IBAction)updateAction:(id)sender {
    editClientCheck=YES;
    [self PostApiMethod];
}

- (IBAction)editClientInfoAction:(UIButton*)sender {
    [self.view addSubview:self.editInfoView];
    CGRect size=self.editInfoView.bounds;
    size.origin.y=50;
    size.origin.x=35;
    self.editInfoView.frame=size;
    self.editInfoView.hidden=NO;
    self.scrollView.userInteractionEnabled=NO;
    self.accountNameLbl.text=[clientInfo valueForKey:@"name"];
    self.currentStreetAddTextFiled.text=[clientInfo valueForKey:@"street_address1"];
    self.streetAdd2TextField.text=[clientInfo valueForKey:@"street_address2"];
    //self.add2ConstraintHeight.constant=0;
    self.cellPhoneCarrierTextFiled.text=[clientInfo valueForKey:@"cellCarrier"];
    self.cityTextFiled.text=[clientInfo valueForKey:@"city"];
    self.stateTextFiled.text=[clientInfo valueForKey:@"state"];
    self.zipCodeTextField.text=[clientInfo valueForKey:@"zip"];
    self.homePhoneTextFiled.text=[clientInfo valueForKey:@"mobile"];
    self.cellPhoneTextField.text=[clientInfo valueForKey:@"other_phone"];
    self.personalEmailTextFiled.text=[clientInfo valueForKey:@"personal_email_id"];

}
@end
