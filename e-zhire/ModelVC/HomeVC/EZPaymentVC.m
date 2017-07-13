//
//  EZPaymentVC.m
//  e-zhire
//
//  Created by Developer on 08/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZPaymentVC.h"
#import "EZNextPaymentVC.h"

@interface EZPaymentVC ()
{
    NSArray*monthArr;
    NSArray*yearArr;
    NSArray*cardTypeArr;
    NSMutableArray*StateArr;
    BOOL checkMonth;
    BOOL checkcardType;
    BOOL selectState;
    UIAlertView*pikerAlert;
    UIPickerView *pickedView;
}
@end

@implementation EZPaymentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    StateArr=[[NSMutableArray alloc]init];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    monthArr=[NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12", nil];
    yearArr=[NSArray arrayWithObjects:@"2017",@"2018",@"2019",@"2020",@"2021",@"2022",@"2023",@"2024",@"2025",@"2026",@"2027" ,@"2028" ,@"2029",@"2030",@"2031",@"2032",nil];
    cardTypeArr=[NSArray arrayWithObjects:@"Visa",@"Master Card",@"Discover",@"American Express", nil];
    NSLog(@"%@",_clientPaymentDeict);
    [self iPadfontSize];
}
-(void)iPadfontSize{
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        [self.addressTextField setFont:[UIFont fontWithName:@"Oswald-Regular" size:14.0f]];
        [self.cityTextField setFont:[UIFont fontWithName:@"Oswald-Regular" size:14.0f]];
        [self.selectCardTypeTextField setFont:[UIFont fontWithName:@"Oswald-Regular" size:14.0f]];
        [self.nameCardTextField setFont:[UIFont fontWithName:@"Oswald-Regular" size:14.0f]];
        [self.cardNumberTextField setFont:[UIFont fontWithName:@"Oswald-Regular" size:14.0f]];
        [self.zipCodeTexTFiled setFont:[UIFont fontWithName:@"Oswald-Regular" size:14.0f]];
        [self.selectMonthTextField setFont:[UIFont fontWithName:@"Oswald-Regular" size:14.0f]];
        [self.selcYearTextField setFont:[UIFont fontWithName:@"Oswald-Regular" size:14.0f]];
        [self.veryFicationTextFiled setFont:[UIFont fontWithName:@"Oswald-Regular" size:14.0f]];
        [self.selectStateTextField setFont:[UIFont fontWithName:@"Oswald-Regular" size:14.0f]];
        [self.nextBtn.titleLabel setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:20]];
    }else{
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- PickerView delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
// tell the picker how many rows are available for a given component

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (checkMonth) {
        return [yearArr count];
    }
    else if (checkcardType) {
        return [cardTypeArr count];
    }
    else if (selectState) {
        return [StateArr count];
    }
    else{
        return [monthArr count];
    }
    
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if (checkMonth) {
        return [yearArr objectAtIndex: row];
    }
    else if (checkcardType) {
        return [cardTypeArr objectAtIndex: row];
    }
    else if (selectState) {
        NSString*abbreviation=[[StateArr objectAtIndex:row]objectForKey:@"abbreviation"];
        NSString*stateName=[[StateArr objectAtIndex:row]objectForKey:@"state"];
        return [[abbreviation stringByAppendingString:@"-"] stringByAppendingString:stateName];
    }
    else{
        return [monthArr objectAtIndex: row];
    }
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
    
    if (checkMonth) {
        self.selcYearTextField.text=[yearArr objectAtIndex:row];
    }
    else if (checkcardType) {
        self.selectCardTypeTextField.text=[cardTypeArr objectAtIndex:row];
    }
    else if (selectState) {
        NSString*abbreviation=[[StateArr objectAtIndex:row]objectForKey:@"abbreviation"];
        NSString*stateName=[[StateArr objectAtIndex:row]objectForKey:@"state"];
        self.selectStateTextField.text=[[abbreviation stringByAppendingString:@"-"] stringByAppendingString:stateName];
    }
    else{
        self.selectMonthTextField.text=[monthArr objectAtIndex:row];
    }
}
#pragma make Button Action

- (IBAction)nextBtnAction:(id)sender {
    
    [self.clientPaymentDeict setObject:self.addressTextField.text forKey:@"streetaddress"];
    [self.clientPaymentDeict setObject:self.streetAddress2Textfiled.text forKey:@"streetaddress2"];
     [self.clientPaymentDeict setObject:self.cityTextField.text forKey:@"city"];
    [self.clientPaymentDeict setObject:self.selectStateTextField.text forKey:@"state"];
    [self.clientPaymentDeict setObject:self.selectCardTypeTextField.text forKey:@"cardtype"];
    [self.clientPaymentDeict setObject:self.cardNumberTextField.text forKey:@"cardnumber"];
    [self.clientPaymentDeict setObject:self.nameCardTextField.text forKey:@"cardname"];
    [self.clientPaymentDeict setObject:self.veryFicationTextFiled.text forKey:@"cvv"];
    [self.clientPaymentDeict setObject:self.selectMonthTextField.text forKey:@"expmonth"];
    [self.clientPaymentDeict setObject:self.selcYearTextField.text forKey:@"expyear"];

    if (self.addressTextField.text.length>0) {
        if (self.cityTextField.text.length>0) {
            if (self.selectStateTextField.text.length>0) {
                    if (self.zipCodeTexTFiled.text.length>0) {
                        if (self.selectCardTypeTextField.text.length>0) {
                            if (self.nameCardTextField.text.length>0){
                                if (self.cardNumberTextField.text.length>0) {
                                if (self.selectMonthTextField.text.length>0) {
                                     if (self.selcYearTextField.text.length>0) {
                                           if (self.veryFicationTextFiled.text.length>0) {
                                    EZNextPaymentVC *contorller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZNextPaymentVC"];
                                   contorller.paymentDetailDict=  self.clientPaymentDeict;
                                    [self.navigationController pushViewController:contorller animated:YES];
                                }
                                           else{
                                               [EZCommonMethod showAlert:nil message:@"Please enter CVV#"];
                                           }
                                     }
                                    
                                     else{
                                         [EZCommonMethod showAlert:nil message:@"Please select year"];
                                     }
                                }
                                    else{
                                        [EZCommonMethod showAlert:nil message:@"Please select month"];
                                    }
                                }
                                else{
                                    [EZCommonMethod showAlert:nil message:@"Please select card number"];
                                }
                            }
                            else{
                                [EZCommonMethod showAlert:nil message:@"Please select card name"];
                            }
                        }
                        else{
                            [EZCommonMethod showAlert:nil message:@"Please selct card type"];
                        }
                    }
                    else{
                        [EZCommonMethod showAlert:nil message:@"Please enter zipCode"];
                    }
                }else{
                [EZCommonMethod showAlert:nil message:@"Please select state"];
            }
        }
        else{
            [EZCommonMethod showAlert:nil message:@"Please enter city"];
        }
    }
    else{
        [EZCommonMethod showAlert:nil message:@"Please enter Address 1"];
    }

    
}
- (IBAction)selectStateAction:(id)sender {
    selectState=YES;
    checkMonth=NO;
    checkcardType=NO;
    [self monthPickerViewMethod:@"Select State"];
}
- (IBAction)selectCardTypeAction:(id)sender {
    checkcardType=YES;
    checkMonth=NO;
    selectState=NO;
    [self monthPickerViewMethod:@"Select Card Type"];
    
}
- (IBAction)selectMonthAction:(id)sender {
    checkMonth=NO;
    checkcardType=NO;
    selectState=NO;

    [self monthPickerViewMethod:@"Select Month"];
}
- (IBAction)selectYearAction:(id)sender{
    checkMonth=YES;
    checkcardType=NO;
    selectState=NO;
    [self monthPickerViewMethod:@"Select Year"];
}
#pragma make Select Month and Year Method

-(void)monthPickerViewMethod:(NSString*)strText{
    pikerAlert= [[UIAlertView alloc] initWithTitle:@"Please Select" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    pikerAlert.alertViewStyle = UIAlertViewStyleDefault;
    pikerAlert.tag=102;
    //countryCodePickedView
     pickedView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0,250, 150)];
    [pickedView setDataSource: self];
    [pickedView setDelegate: self];
    pickedView.showsSelectionIndicator = YES;
    [pikerAlert setValue:pickedView forKey:@"accessoryView"];
    [self stateGetMethod];
    [pikerAlert show];
    [pickedView reloadAllComponents];

}
#pragma make State Method

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
            
            StateArr=[json valueForKey:@"value"];
            NSLog(@"%@",StateArr);
            
            //  NSLog(@"%@",self.categoryArray);
            [pickedView reloadAllComponents];
        }
        
    } onError:^(NSError *Error) {
        NSLog(@"%@",Error);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
       // [EZCommonMethod showAlert:nil message:@"Please try again"];
        
    }];
    
}

@end
