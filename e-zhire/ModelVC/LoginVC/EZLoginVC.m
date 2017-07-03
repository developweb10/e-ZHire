//
//  EZLoginVC.m
//  e-zhire
//
//  Created by Developer on 31/05/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZLoginVC.h"

@interface EZLoginVC ()

@end

@implementation EZLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.

   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark- Button Action

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
    UIViewController *contorller=[self.storyboard instantiateViewControllerWithIdentifier:@"createSignUp"];
    [self.navigationController pushViewController:contorller animated:YES];
        
    }else{
        UIViewController *contorller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZAssociateSignup"];
        [self.navigationController pushViewController:contorller animated:YES];
    }
}
- (IBAction)forgatePasswordAction:(id)sender {
    
}

- (IBAction)submitACtion:(id)sender {
    if (self.userNameTextField.text.length==nil) {
        sef.us
        
    }
   else if (self.passwordTextfield.text.length==nil) {
       [self loginPostApi];
 
   }
   else{
       
       UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"Please enter password" preferredStyle:UIAlertControllerStyleAlert];
       UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
       [alertController addAction:ok];
       [self presentViewController:alertController animated:YES completion:nil];
    }
    else{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"Please enter username" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}


-(void)loginPostApi{
  
    NSString*urlStr;
    if(checkAssociate){
    
        urlStr=[NSString stringWithFormat:@"%@%@",BaseUrl,associate_login];
    }
    else{
    
        urlStr=[NSString stringWithFormat:@"%@%@",BaseUrl,client_login];

    }
    
    NSDictionary*parameter=@{@"username":self.userNameTextField.text,@"password":self.passwordTextfield.text };
    [[NetworkManager Instance]postRequestWithUrl:urlStr parameter:parameter onCompletion:^(id dict) {
        
        NSLog(@"%@",dict);
        NSError* error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:dict
                                                             options:kNilOptions
                                                               error:&error];
        
        if ([[json valueForKey:@"success"] boolValue]==1) {
            
            if(checkAssociate){
                NSArray* associateArr = [json objectForKey:@"data"];
                NSDictionary *getResponseFormDict=[associateArr objectAtIndex:0];
                NSLog(@"%@",[getResponseFormDict valueForKey:@"userEmail"]);
                NSLog(@"latestLoans: %@", associateArr);
                NSString*userEmail=[getResponseFormDict valueForKey:@"userEmail"];
                NSString*userId=[getResponseFormDict valueForKey:@"userId"];
                NSString*username=[getResponseFormDict valueForKey:@"username"];
                NSString*niceName=[getResponseFormDict valueForKey:@"niceName"];
                [[NSUserDefaults standardUserDefaults] setValue:userEmail forKey:associateUserEmail];
                [[NSUserDefaults standardUserDefaults] setValue:userId forKey:associateUserId];
                [[NSUserDefaults standardUserDefaults] setValue:username forKey:associateUserName];
                [[NSUserDefaults standardUserDefaults] setValue:niceName forKey:associateNiceName];
                NSLog(@"Save Success");
                [[NSUserDefaults standardUserDefaults] synchronize];
                
            }
            else{
                NSArray* clientArr = [json objectForKey:@"data"];
                NSDictionary *getResponseFormDict=[clientArr objectAtIndex:0];
                NSLog(@"%@",[getResponseFormDict valueForKey:@"userEmail"]);
                [EZCommonMethod saveUserEmail:[getResponseFormDict valueForKey:@"userEmail"]];
                [EZCommonMethod saveUserName:[getResponseFormDict valueForKey:@"username"]];
                [EZCommonMethod saveUserNiceName:[getResponseFormDict valueForKey:@"niceName"]];
                [EZCommonMethod saveUserId:[getResponseFormDict valueForKey:@"userId"]];
                NSLog(@"latestLoans: %@", clientArr);
            }
            
        }
        
    } onError:^(NSError *Error) {
        NSLog(@"%@:",Error);

    }];
}

@end
