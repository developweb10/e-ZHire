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
//    NSString*userId;
    
    BOOL editClient;

  
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
- (IBAction)editClinetInfoACtion:(UIButton*)sender {
    
    [self.view addSubview:self.editInfoView];
    CGRect size=self.editInfoView.bounds;
    size.origin.y=50;
    size.origin.x=35;
    self.editInfoView.frame=size;
    if (sender.selected==NO) {
        sender.selected=YES;
         self.editInfoView.hidden=NO;
      //  editClient=YES;
      // [self PostApiMethod];
        self.scrollView.userInteractionEnabled=NO;
    }else{
        sender.selected=NO;
        self.editInfoView.hidden=YES;
        self.scrollView.userInteractionEnabled=YES;
    }
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
- (IBAction)updateAction:(id)sender {
    
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
    
    if (editClient) {
        urlStr=[NSString stringWithFormat:@"%@%@",BaseUrl,clientInfo];
        parameter=@{@"user_id":_getUserId,@"streetaddr1":self.currentStreetAddTextFiled.text,@"streetaddr2":self.streetAdd2TextField,@"city":self.cityTextFiled.text,@"state":self.stateTextFiled.text,@"zipcode":self.zipCodeTextField.text,@"homePhone":self.homePhoneTextFiled.text,@"cellPhone":self.cellPhoneTextField.text,@"email":self.personalEmailFont.text,@"cellPhoneCarrier":self.cellPhoneCarrierTextFiled.text};
      
        
        
        
//        {"user_id":"1178","streetaddr1":"333 Faux Street1", "streetaddr2":"Gggggggggggggg","city":"Demotropolice","state":"GA","zipcode":"11111", "homePhone":"976554544","cellPhone":"9454567556756","email":"rajinderarora.inext@gmail.com", "cellPhoneCarrier":"@cspire1.com"}

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
        if ([[json valueForKey:@"success"] boolValue]==1) {
                    clientInfo = [json objectForKey:@"client_info"];
                    self.paymentInfo = [json objectForKey:@"payment_info"];
                    self.nameLabel.text=[clientInfo valueForKey:@"name"];
                     self.address1Label.text=[clientInfo valueForKey:@"street_address1"];
                    self.addLabel2.text=[clientInfo valueForKey:@""];
                    self.add2ConstraintHeight.constant=0;
                    self.ZipCodeLabel.text=[clientInfo valueForKey:@"city"];
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
        
    } onError:^(NSError *Error) {
        NSLog(@"%@:",Error);
        [EZCommonMethod showAlert:nil message:@"try again"];
        [self PostApiMethod];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
}

@end
