//
//  EZAssociateSignup.m
//  e-zhire
//
//  Created by Developer on 13/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZAssociateSignup.h"
#import "MBProgressHUD.h"

@interface EZAssociateSignup ()
{
    NSMutableArray *dataArray;
    NSMutableArray *hireArray;
    UIAlertView*pikerAlert;
    NSMutableArray *stateArr;
    UIPickerView *pickedView;
}
@end

@implementation EZAssociateSignup

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    dataArray = [[NSMutableArray alloc] init];
    stateArr = [[NSMutableArray alloc] init];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    hireArray=[[NSMutableArray alloc]init];
    [hireArray addObject:@"Classified Ad"];
    [hireArray addObject:@"Facebook"];
    [hireArray addObject:@"Friend or Neighbor"];
    [hireArray addObject:@"Google search/ Ad"];
    [hireArray addObject:@"Herald Newspaper"];
    [hireArray addObject:@"Instragram"];
    [hireArray addObject:@"Job Post or Job Recruiter Website"];
    [hireArray addObject:@"Referred by Service Provider"];
    [hireArray addObject:@"Twitter"];
    [self ipadFrontSize];

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.menuContainerViewController setPanMode:MFSideMenuPanModeNone];
}
-(void)ipadFrontSize{
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        [self.firstNameTextField setFont:[UIFont fontWithName:@"Oswald-Regular" size:14.0f]];
        [self.lastNameTextField setFont:[UIFont fontWithName:@"Oswald-Regular" size:14.0f]];
        [self.emailTextField setFont:[UIFont fontWithName:@"Oswald-Regular" size:14.0f]];
        [self.phonNumberTextField setFont:[UIFont fontWithName:@"Oswald-Regular" size:14.0f]];
        [self.zipCodeTextField setFont:[UIFont fontWithName:@"Oswald-Regular" size:14.0f]];
        [self.stateTextField setFont:[UIFont fontWithName:@"Oswald-Regular" size:14.0f]];
        [self.hearAboutTextField setFont:[UIFont fontWithName:@"Oswald-Regular" size:14.0f]];
        [self.submitBtn.titleLabel setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:20]];
    }else{
    
    }
}
#pragma mark- Picker delegate method

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
// tell the picker how many rows are available for a given component

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    if (check) {
        return [hireArray count];
    }else{
        return [stateArr count];
    }
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if (check) {
        return [hireArray objectAtIndex: row];
        
    }else{
        NSString*abbreviation=[[stateArr objectAtIndex:row]objectForKey:@"abbreviation"];
        NSString*stateName=[[stateArr objectAtIndex:row]objectForKey:@"state"];
        return [[abbreviation stringByAppendingString:@"-"] stringByAppendingString:stateName];
    }
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
    if (check) {
        self.hearAboutTextField.text=[hireArray objectAtIndex:row];
        
    }else{
          NSString*abbreviation=[[stateArr objectAtIndex:row]objectForKey:@"abbreviation"];
          NSString*stateName=[[stateArr objectAtIndex:row]objectForKey:@"state"];
       ;

          self.stateTextField.text=[[abbreviation stringByAppendingString:@"-"] stringByAppendingString:stateName];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark- UItouch to began

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
}
#pragma mark- Button Action

- (IBAction)submitBtnaction:(id)sender {
    
    if (self.firstNameTextField.text.length>0) {
        if (self.lastNameTextField.text.length>0) {
            if (self.emailTextField.text.length>0) {
                if ([EZCommonMethod validateEmailWithString:self.emailTextField.text]) {
                    if (self.phonNumberTextField.text.length>0) {
                        if (self.zipCodeTextField.text.length>0) {
                            if (self.stateTextField.text.length>0) {
                                if (self.hearAboutTextField.text.length>0) {
                                    [self signupPostMethod];
                                }else{
                                    [EZCommonMethod showAlert:nil message:@"Please select about E-ZHire"];
                                }
                                
                            }else{
                                [EZCommonMethod showAlert:nil message:@"Please select state"];
                            }
                        }
                        else{
                            [EZCommonMethod showAlert:nil message:@"Please enter zipcode"];
                        }
                        
                    }else{
                        [EZCommonMethod showAlert:nil message:@"Please enter phonenumber"];
                    }
                }else{
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
- (IBAction)stateBtnAction:(UIButton*)sender {
    check=NO;
  
    [self showStateWithActionSheet:@"Please select State"];
}
- (IBAction)hearAboutAction:(id)sender {
    check=YES;
    [self showStateWithActionSheet:@"Please select"];
}
-(void)showStateWithActionSheet:(NSString*)title{
 
    pikerAlert= [[UIAlertView alloc] initWithTitle:title message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    pikerAlert.alertViewStyle = UIAlertViewStyleDefault;
    pikerAlert.tag=102;
    //countryCodePickedView
    pickedView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0,250, 150)];
    [pickedView setDataSource: self];
    [pickedView setDelegate: self];
    pickedView.showsSelectionIndicator = YES;
    [pikerAlert setValue:pickedView forKey:@"accessoryView"];
    [pikerAlert show];
    [self stateGetMethod];
    [pickedView reloadAllComponents];
     
}
#pragma mark- Api Method

-(void)signupPostMethod{
    
    bool checkinternet=[EZCommonMethod checkInternetConnection];
    if(!checkinternet){
        [EZCommonMethod showAlert:nil message:@"Please check your internet connection"];
        return;
    }
    NSString*urlStr=[NSString stringWithFormat:@"%@%@",BaseUrl,Associate_signup];
    NSDictionary*parameter=@{@"firstName":self.firstNameTextField.text,@"lastName":self.lastNameTextField.text,@"email":self.emailTextField.text,@"phone":self.phonNumberTextField.text,@"zip":self.zipCodeTextField.text,@"state":self.stateTextField.text ,@"hearfrom":self.hearAboutTextField.text};
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [[NetworkManager Instance]postRequestWithUrl:urlStr parameter:parameter onCompletion:^(id dict) {
        NSLog(@"%@",dict);
        NSError* error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:dict
                                                             options:kNilOptions
                                                               error:&error];
        NSLog(@"%@",json);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        if ([[json valueForKey:@"success"] boolValue]==1) {
            
            UIAlertController * alert=   [UIAlertController
                                          alertControllerWithTitle:@"WELCOME!"
                                          message:@"Thank you for becoming a valued Associate.\n   Please check your email for account details and login information.\nEmail is being sent NOW from administrator@e-zhire.com"preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* ok = [UIAlertAction
                                 actionWithTitle:@"close"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                  {
                                     [self.navigationController popViewControllerAnimated:YES];
                                     [alert dismissViewControllerAnimated:YES completion:nil];
                                     
                                 }];
            [alert addAction:ok];
            [self presentViewController:alert animated:YES completion:nil];
        }
        
    } onError:^(NSError *Error) {
        NSLog(@"%@",Error);
    }];
    
}

-(void)stateGetMethod{
    bool statecheck=[EZCommonMethod checkInternetConnection];
    if(!statecheck){
        [EZCommonMethod showAlert:nil message:@"Please check your internet connection"];
        return;
    }
    NSString *urlString=[NSString stringWithFormat:@"%@%@",BaseUrl,state_Api];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[NetworkManager Instance] getRequestWithUrl:urlString parameter:nil onCompletion:^(id dict) {
        
        NSError* errorJson=nil;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:dict
                                                             options:kNilOptions
                                                               error:&errorJson];
        NSLog(@"%@",json);
        if ([[json valueForKey:@"success"] boolValue]==1) {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            stateArr=[json valueForKey:@"value"];
            NSLog(@"%@",stateArr);
          //  NSLog(@"%@",self.categoryArray);
             [pickedView reloadAllComponents];
        }
        
    } onError:^(NSError *Error) {
        NSLog(@"%@",Error);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
       [EZCommonMethod showAlert:nil message:@"Please try again"];
        
    }];

}
@end
