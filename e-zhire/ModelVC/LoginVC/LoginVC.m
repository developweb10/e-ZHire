//
//  EZLoginVC.m
//  e-zhire
//
//  Created by Developer on 31/05/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "LoginVC.h"
#import "MBProgressHUD.h"
#import "EZClientAccountVC.h"
#import "EZAssociateAccountVC.h"

@interface LoginVC ()
{
    NSDictionary *getResponseFormDict;
    NSString*assUserId;
}
@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        self.loginViewHeightConstraint.constant=400;
        [self.passwordTextfield setFont:[UIFont fontWithName:@"Oswald-Regular" size:15.0f]];
        [self.donotAccountLbl setFont:[UIFont fontWithName:@"Oswald-Regular" size:15.0f]];
        [self.freeAccountLbl setFont:[UIFont fontWithName:@"Oswald-Regular" size:15.0f]];
        [self.passwordTextfield setFont:[UIFont fontWithName:@"Oswald-Regular" size:15.0f]];
        [self.clientFaqBtn.titleLabel setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:20]];
        [self.associateFaqBtn.titleLabel setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:20]];
        [self.clickRegBtn.titleLabel setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:20]];
        [self.submitBtn.titleLabel setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:20]];
        [self.forgotPasswordBtn.titleLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:14]];
    }else{
        
    }
   }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
}
#pragma mark- Button Action
- (IBAction)slideMenuAction:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:^{}];
}
- (IBAction)clientFaqAction:(id)sender{
    
    checkAssociate = NO;
    [self.associateFaqBtn setBackgroundImage:[UIImage imageNamed:@"faqUnSelected"] forState:UIControlStateNormal];
    [self.clientFaqBtn setBackgroundImage:[UIImage imageNamed:@"faqSelected"] forState:UIControlStateNormal];
    self.donotAccountLbl.hidden=NO;
    self.freeAccountLbl.text=@"Create Your FREE Account NOW!";
    NSMutableAttributedString * stringAtr = [[NSMutableAttributedString alloc] initWithString:self.freeAccountLbl.text];
    [stringAtr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:173/255.f green:0/255.f blue:15/255.f alpha:1.0] range:NSMakeRange(11,5)];
    self.freeAccountLbl.attributedText = stringAtr;
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    [style setAlignment:NSTextAlignmentCenter];
    // [style setLineBreakMode:NSLineBreakByWordWrapping];
    
    UIFont *font1 = [UIFont fontWithName:@"HelveticaNeue-Light" size:15.0f];
    NSDictionary *dict1 = @{NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle),
                            NSFontAttributeName:font1,
                            NSParagraphStyleAttributeName:style};
    
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] init];
   [attString appendAttributedString:[[NSAttributedString alloc] initWithString:@"Click to Register"attributes:dict1]];
   [self.clickRegBtn setAttributedTitle:attString forState:UIControlStateNormal];
   [attString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:177/255.f green:30/255.f blue:6/255.f alpha:1.0] range:NSMakeRange(0, [@"Click to Register" length])];
}
- (IBAction)associateFaqAction:(id)sender{
    checkAssociate = YES;
    [self.clientFaqBtn setBackgroundImage:[UIImage imageNamed:@"faqUnSelected"] forState:UIControlStateNormal];
    [self.associateFaqBtn setBackgroundImage:[UIImage imageNamed:@"faqSelected"] forState:UIControlStateNormal];
    self.freeAccountLbl.text=@"Don't Have an Associate Account Yet?";
    self.donotAccountLbl.hidden=YES;
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    [style setAlignment:NSTextAlignmentCenter];
    //[style setLineBreakMode:NSLineBreakByWordWrapping];
    UIFont *font1 = [UIFont fontWithName:@"HelveticaNeue-Light" size:15.0f];
    NSDictionary *dict1 = @{NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle),
                            NSFontAttributeName:font1,
                            NSParagraphStyleAttributeName:style};
    
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] init];
    [attString appendAttributedString:[[NSAttributedString alloc] initWithString:@"Register Now!"attributes:dict1]];
    [self.clickRegBtn setAttributedTitle:attString forState:UIControlStateNormal];
    [attString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:177/255.0 green:30/255.0 blue:6/255.0 alpha:1.0] range:NSMakeRange(0, [@"Register Now!" length])];
}
- (IBAction)registerAction:(id)sender{
    if (checkAssociate == NO) {
        UIViewController *contorller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZSignCreateAccountVC"];
        [self.navigationController pushViewController:contorller animated:YES];
        
    }else{
        UIViewController *contorller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZAssociateSignup"];
        [self.navigationController pushViewController:contorller animated:YES];
    }
}
- (IBAction)forgatePasswordAction:(id)sender {
    
    UIViewController *contorller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZForgotPasswordVC"];
    [self.navigationController pushViewController:contorller animated:YES];
}
- (IBAction)submitACtion:(id)sender {
        if (self.userNameTextField.text.length>0 && self.passwordTextfield.text.length>0) {
            if ([EZCommonMethod validateEmailWithString:self.userNameTextField.text]) {
                [self loginPostApi];
            }
            else{
                [EZCommonMethod showAlert:nil message:@"Please enter valid email id"];
            }
        }
        else{
            // [self showUIAlertControllerWithTitle:@"Successful Client login!"];
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"Please enter username and password" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        [self presentViewController:alertController animated:YES completion:nil];
        }
}
#pragma mark- API implementation

-(void)loginPostApi{
    
    bool check=[EZCommonMethod checkInternetConnection];
    if(!check){
        [EZCommonMethod showAlert:nil message:@"Please check your internet connection"];
        return;
    }
    NSString*urlStr;
    if(checkAssociate){
        
        urlStr=[NSString stringWithFormat:@"%@%@",BaseUrl,associate_login];
    }
    else{
        
        urlStr=[NSString stringWithFormat:@"%@%@",BaseUrl,client_login];
    }
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSDictionary*parameter=@{@"username":self.userNameTextField.text,@"password":self.passwordTextfield.text };
    [[NetworkManager Instance]postRequestWithUrl:urlStr parameter:parameter onCompletion:^(id dict) {

        NSLog(@"%@",dict);
        NSError* error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:dict
                                                             options:kNilOptions
                                                               error:&error];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        if ([[json valueForKey:@"success"] boolValue]==1) {
            if(checkAssociate){
                NSArray* associateArr = [json objectForKey:@"data"];
                NSDictionary *AssgetResponseFormDict=[associateArr objectAtIndex:0];
                [[NSUserDefaults standardUserDefaults] setValue:[AssgetResponseFormDict valueForKey:@"userEmail"] forKey:associateUserEmail];
                [[NSUserDefaults standardUserDefaults] setValue:[AssgetResponseFormDict valueForKey:@"userId"] forKey:associateUserId];
                [[NSUserDefaults standardUserDefaults] setValue:[AssgetResponseFormDict valueForKey:@"username"] forKey:associateUserName];
                [[NSUserDefaults standardUserDefaults] setValue:[AssgetResponseFormDict valueForKey:@"niceName"] forKey:associateNiceName];
                NSLog(@"Save Success");
                [[NSUserDefaults standardUserDefaults] synchronize];
                [self showUIAlertControllerWithTitle:@"Successful Associate login!"];
            }
            else{
                
                NSArray* clientArr = [json objectForKey:@"data"];
                 getResponseFormDict=[clientArr objectAtIndex:0];
                [EZCommonMethod saveUserEmail:[getResponseFormDict valueForKey:@"userEmail"]];
                [EZCommonMethod saveUserName:[getResponseFormDict valueForKey:@"username"]];
                [EZCommonMethod saveUserNiceName:[getResponseFormDict valueForKey:@"niceName"]];
                [EZCommonMethod saveUserId:[getResponseFormDict valueForKey:@"userId"]];
                [self showUIAlertControllerWithTitle:@"Successful Client login!"];
                NSLog(@"latestLoans: %@", clientArr);

            }
            
        }else{
            [EZCommonMethod showAlert:nil message:@"Please check your email and password!"];
        }
        
    } onError:^(NSError *Error) {
        NSLog(@"%@:",Error);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
}
-(void)showUIAlertControllerWithTitle:(NSString*)Title{

    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:nil
                                  message:Title
                                  preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             if(checkAssociate){
                                 UIViewController*controller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZAssociateAccountVC"];
                                 [self.navigationController pushViewController:controller animated:YES];
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                             }else{
                                 NSString*userId=[EZCommonMethod getUserId];
                                 if (userId!=nil) {
                                     EZClientAccountVC*viewController=[self.storyboard instantiateViewControllerWithIdentifier:@"EZClientAccountVC"];
                                     viewController.getUserId=userId;
                                     [self.navigationController pushViewController:viewController animated:YES];
                                     [alert dismissViewControllerAnimated:YES completion:nil];
   
                                 }else{
                                     [EZCommonMethod showAlert:nil message:@"Please login Client email"];
                                 }
                             }
                            
                         }];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
    
}
@end
