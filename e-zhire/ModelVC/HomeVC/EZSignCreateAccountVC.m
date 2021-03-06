//
//  EZSignCreateAccountVC.m
//  e-zhire
//
//  Created by Developer on 06/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZSignCreateAccountVC.h"
#import "EZPaymentVC.h"

@interface EZSignCreateAccountVC ()
{
    NSMutableArray*carrerArr;
    UIAlertView *pikerAlert;
    NSMutableDictionary *dictClient;
    UIPickerView *pickedView;
}
@end

@implementation EZSignCreateAccountVC

- (void)viewDidLoad {
    [super viewDidLoad];
      carrerArr=[[NSMutableArray alloc]init];
    // Do any additional setup after loading the view.
     dictClient = [NSMutableDictionary dictionary];
     self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
     self.navigationController.navigationBar.translucent = NO;
   
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        self.topViewHeightConstraint.constant=700;
        [self.firstNameTextField setFont:[UIFont fontWithName:@"Oswald-Regular" size:14.0f]];
        [self.middleNameTextFiled setFont:[UIFont fontWithName:@"Oswald-Regular" size:14.0f]];
        [self.lastNameTextField setFont:[UIFont fontWithName:@"Oswald-Regular" size:14.0f]];
        [self.emailTextField setFont:[UIFont fontWithName:@"Oswald-Regular" size:14.0f]];
        [self.homePhoneTextField setFont:[UIFont fontWithName:@"Oswald-Regular" size:14.0f]];
        [self.phoneNumberTextField setFont:[UIFont fontWithName:@"Oswald-Regular" size:14.0f]];
        [self.passwordTextField setFont:[UIFont fontWithName:@"Oswald-Regular" size:14.0f]];
        [self.retypePasswordTextField setFont:[UIFont fontWithName:@"Oswald-Regular" size:14.0f]];
        [self.cellPhoneCarrierTextFiled setFont:[UIFont fontWithName:@"Oswald-Regular" size:14.0f]];
        [self.notificationLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:12.0f]];
        [self.nextPayMentBtn.titleLabel setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:20]];
        [self.forgotPasswordBtn.titleLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:14]];
    }else{
        
    }
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.menuContainerViewController setPanMode:MFSideMenuPanModeNone];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark-Button Action
- (IBAction)nextPaymentBtn:(id)sender {
    // [self ClientSignupPostMethod];
    [dictClient setObject:self.firstNameTextField.text forKey:@"firstName"];
    [dictClient setObject:self.middleNameTextFiled.text forKey:@"MiddleName"];
    [dictClient setObject:self.lastNameTextField.text forKey:@"lastName"];
    [dictClient setObject:self.emailTextField.text forKey:@"email"];
    [dictClient setObject:self.homePhoneTextField.text forKey:@"homephone"];
    [dictClient setObject:self.phoneNumberTextField.text forKey:@"cellphone"];
    [dictClient setObject:self.passwordTextField.text forKey:@"clientpassword"];
    [dictClient setObject:self.cellPhoneCarrierTextFiled.text forKey:@"carrier"];
    
    if (self.firstNameTextField.text.length>0) {
        if (self.lastNameTextField.text.length>0) {
            if (self.emailTextField.text.length>0) {
                if ([EZCommonMethod validateEmailWithString:self.emailTextField.text]) {
                    if (self.phoneNumberTextField.text.length>0) {
                        if (self.passwordTextField.text.length>0) {
                            if ([self.passwordTextField.text isEqualToString:self.retypePasswordTextField.text]){
                                if (self.cellPhoneCarrierTextFiled.text.length>0) {
                              EZPaymentVC *contorller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZPaymentVC"];
                                    contorller.clientPaymentDeict=  dictClient;
                                [self.navigationController pushViewController:contorller animated:YES];
                                }
                                else{
                                    [EZCommonMethod showAlert:nil message:@"Please select cell carrier"];
                                }
                            }
                            else{
                                [EZCommonMethod showAlert:nil message:@"Please enter valid password"];
                            }
                        }
                        else{
                            [EZCommonMethod showAlert:nil message:@"Please enter password"];
                        }
                    }
                    else{
                        [EZCommonMethod showAlert:nil message:@"Please enter phone number"];
                    }
                }
                else{
                    [EZCommonMethod showAlert:nil message:@"Please enter valid email id"];
                }
                
            }else{
                [EZCommonMethod showAlert:nil message:@"Please enter email id"];
            }
        }
        else{
            [EZCommonMethod showAlert:nil message:@"Please enter last name"];
        }
    }
    else{
        [EZCommonMethod showAlert:nil message:@"Please enter first name"];
    }
}
- (IBAction)forgotPasswordBtnAction:(id)sender {
    UIViewController *contorller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZForgotPasswordVC"];
    [self.navigationController pushViewController:contorller animated:YES];
}

- (IBAction)cellPhoneCarrerAction:(id)sender {
    [self selectCarrierApiMethod];
    pikerAlert= [[UIAlertView alloc] initWithTitle:@"Please Select" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    NSLog(@"%@",pikerAlert);
    
    pikerAlert.alertViewStyle = UIAlertViewStyleDefault;
    pikerAlert.tag=102;
    //countryCodePickedView
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
        
    } onError:^(NSError *Error) {
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

@end
