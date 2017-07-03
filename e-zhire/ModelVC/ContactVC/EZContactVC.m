//
//  EZContactVC.m
//  e-zhire
//
//  Created by Developer on 31/05/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZContactVC.h"

@interface EZContactVC ()

@end

@implementation EZContactVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _textFieldYourName.layer.borderColor=[UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1].CGColor;
    _textFieldZipCode.layer.borderColor=[UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1].CGColor;
    _textFieldYourEmail.layer.borderColor=[UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1].CGColor;
    _textViewMessage.layer.borderColor=[UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1].CGColor;
    _textFieldYourEmail.layer.borderWidth=1.0;
    _textFieldZipCode.layer.borderWidth=1.0;
    _textFieldYourName.layer.borderWidth=1.0;
    _textViewMessage.layer.borderWidth=1.0;
    
    // Do any additional setup after loading the view.
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        self.viewConstraintHeight.constant=350;
        [self.loactionLabel setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:10.0f]];
        [self.ezHireLabel setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:10.0f]];
        [self.questionLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:14.0f]];
        [self.addressLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:14.0f]];
        [self.textFieldYourName setFont:[UIFont fontWithName:@"Oswald-Regular" size:14.0f]];
        [self.textFieldYourEmail setFont:[UIFont fontWithName:@"Oswald-Regular" size:14.0f]];
        [self.textViewMessage setFont:[UIFont fontWithName:@"Oswald-Regular" size:14.0f]];
        [self.submitBtn.titleLabel setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:20]];
        
    }else{
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark- Button Action

- (IBAction)SubmitAction:(id)sender {
    if (self.textFieldYourName.text.length>0) {
        if (self.textFieldYourEmail.text.length>0) {
            if ([EZCommonMethod validateEmailWithString:self.textFieldYourEmail.text]) {
                if (self.textFieldZipCode.text.length>0) {
                    if (self.textViewMessage.text.length>0) {
                        
                         [self contactUsPostMethod];
                        
                    }else{
                        
                        [EZCommonMethod showAlert:nil message:@"Please enter message"];
                    }
                }else{
                    [EZCommonMethod showAlert:nil message:@"Please enter Your zipcode"];
                    
                }
            }
            else{
                [EZCommonMethod showAlert:nil message:@"Please enter valid email"];
                
            }
        }
        else{
            [EZCommonMethod showAlert:nil message:@"Please enter Your email"];
        }
    }
    else{
        [EZCommonMethod showAlert:nil message:@"Please enter Your name"];
    }
}

- (IBAction)slideMenuAction:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:^{}];
}

#pragma mark- Api Method

-(void)contactUsPostMethod{
    
    bool checkinternet=[EZCommonMethod checkInternetConnection];
    if(!checkinternet){
        [EZCommonMethod showAlert:nil message:@"Please check your internet connection"];
        return;
    }
    NSString*urlStr=[NSString stringWithFormat:@"%@%@",BaseUrl,contactUs_Api];
    NSDictionary*parameter=@{@"name":self.textFieldYourName.text,@"email":self.textFieldYourEmail.text,@"zipCode":self.textFieldZipCode.text,@"message":self.textViewMessage.text};
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
                                          alertControllerWithTitle:@"Thank You!"
                                          message:@"Your message has been sent successfully"
                                          preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* ok = [UIAlertAction
                                 actionWithTitle:@"OK"
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

@end
