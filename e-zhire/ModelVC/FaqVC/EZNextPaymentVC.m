//
//  EZNextPaymentVC.m
//  e-zhire
//
//  Created by Developer on 13/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZNextPaymentVC.h"
#import "LoginVC.h"
#define EZblueColor [UIColor colorWithRed:0/255.0 green:131/255.0 blue:255/255.0 alpha:1]

@interface EZNextPaymentVC ()
{
    NSArray*ezAboutArr;
    UIAlertView*pikerAlert;
}
@end

@implementation EZNextPaymentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    ezAboutArr=[NSArray arrayWithObjects:@"Classified Ad",@"Facebook",@"Friend or Neighbor",@"Google search/ Ad",@"Herald Newspaper",@"Instragram",@"Job Post or Job Recruiter Website",@"Referred by Service Provider",@"Twitter", nil];
    [self ipadFontSize];
    
    NSLog(@"%@",_paymentDetailDict);
}
-(void)ipadFontSize{
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        [self.reffredAssociateIdNumberText setFont:[UIFont fontWithName:@"Oswald-Regular" size:15.0f]];
        [self.aboutEzHireText setFont:[UIFont fontWithName:@"Oswald-Regular" size:15.0f]];
        [self.agreeLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:15.0f]];
        [self.createAccountBtn.titleLabel setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:20]];
        
    }else{
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark- Picker delegate method

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
// tell the picker how many rows are available for a given component

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [ezAboutArr count];
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
   return [ezAboutArr objectAtIndex: row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
    self.aboutEzHireText.text=[ezAboutArr objectAtIndex:row];
}
- (IBAction)aboutEzhireAction:(id)sender {
    pikerAlert= [[UIAlertView alloc] initWithTitle:@"Please Select About E-ZHire" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    pikerAlert.alertViewStyle = UIAlertViewStyleDefault;
    pikerAlert.tag=102;
    //countryCodePickedView
    UIPickerView *pickedView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0,250, 150)];
    [pickedView setDataSource: self];
    [pickedView setDelegate: self];
    pickedView.showsSelectionIndicator = YES;
    [pikerAlert setValue:pickedView forKey:@"accessoryView"];
    [pikerAlert show];
    [pickedView reloadAllComponents];
}
- (IBAction)agreeBtnAction:(UIButton*)sender {
    if (sender.selected==NO) {
        [sender setImage:[UIImage imageNamed:@"Check"] forState:UIControlStateNormal];
        [sender setBackgroundColor:EZblueColor];
        sender.layer.borderWidth=0;
        sender.selected=YES;
    }else{
        sender.selected=NO;
        [sender setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        sender.layer.borderWidth=0.5;
        [sender setBackgroundColor:[UIColor whiteColor]];
    }
}
- (IBAction)createAccountBtnAction:(id)sender{
    
    [self.paymentDetailDict setValue:self.aboutEzHireText.text forKey:@"hearfromoption"];
    [self.paymentDetailDict setValue:self.reffredAssociateIdNumberText.text forKey:@"refid"];
    if (self.aboutEzHireText.text.length>0) {
      if (self.reffredAssociateIdNumberText.text.length>0) {
          [self ClientSignupPostMethod];
        }
        else{
            [EZCommonMethod showAlert:nil message:@"Please enter refid"];
        }
    }
    else{
        [EZCommonMethod showAlert:nil message:@"Please select aboutE-ZHire"];
    }


}
#pragma mark- Api Method

-(void)ClientSignupPostMethod{
   
     bool checkinternet=[EZCommonMethod checkInternetConnection];
     if(!checkinternet){
     [EZCommonMethod showAlert:nil message:@"Please check your internet connection"];
     return;
     }
     NSString*urlStr=[NSString stringWithFormat:@"%@%@",BaseUrl,clientSignUp_Api];
     
     [MBProgressHUD showHUDAddedTo:self.view animated:YES];
     [[NetworkManager Instance]postRequestWithUrl:urlStr parameter:self.paymentDetailDict onCompletion:^(id dict) {
     NSLog(@"%@",dict);
     NSError* error;
     NSDictionary* json = [NSJSONSerialization JSONObjectWithData:dict
     options:kNilOptions
     error:&error];
     NSLog(@"json %@",json);
     [MBProgressHUD hideHUDForView:self.view animated:YES];
         
         [MBProgressHUD hideHUDForView:self.view animated:YES];
         if ([[json valueForKey:@"success"] boolValue]==1) {
             
             UIAlertController * alert=   [UIAlertController
                                           alertControllerWithTitle:nil
                                           message:@"client user successfully registered"preferredStyle:UIAlertControllerStyleAlert];
             UIAlertAction* ok = [UIAlertAction
                                  actionWithTitle:@"ok"
                                  style:UIAlertActionStyleDefault
                                  handler:^(UIAlertAction * action)
                                  {
                                      LoginVC *contorller=[self.storyboard instantiateViewControllerWithIdentifier:@"LoginVC"];
                                      [self.navigationController pushViewController:contorller animated:YES];
                                      
//                                      [self.navigationController popViewControllerAnimated:YES];
                                      [alert dismissViewControllerAnimated:YES completion:nil];
                                      
                                  }];
             [alert addAction:ok];
             [self presentViewController:alert animated:YES completion:nil];

         }else{
             UIAlertController * alert=   [UIAlertController
                                           alertControllerWithTitle:nil
                                           message:@"Please enter valid card details"preferredStyle:UIAlertControllerStyleAlert];
             UIAlertAction* ok = [UIAlertAction
                                  actionWithTitle:@"ok"
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

- (IBAction)termsClick:(id)sender
{
    UIViewController *contorller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZTermVC"];
    [self.navigationController pushViewController:contorller animated:YES];
}
@end
