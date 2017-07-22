//
//  EZSearchZipeCodeVC.m
//  e-zhire
//
//  Created by Developer on 24/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZSearchZipeCodeVC.h"

@interface EZSearchZipeCodeVC ()

@end

@implementation EZSearchZipeCodeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.thirdLabel.text=@"You can encourage us to work even harder, by leaving us your email address, and we will let our Service Recruiters know that you are tired of waiting for E-ZHire's Associates to provide you service. We will also send you a notice of when we recruit an Associate in your area to fulfill your service needs. Don't Worry, we promise your email is safe with us. We will NEVER give away or sell your personal information, we promise ...... and a promise still means something to us";
    [self iPadfontSize];
    NSLog(@"%@",_passMessage);
    NSLog(@"zipCode%@",_sendZipCode);
    if (![_sendZipCode isEqual:@"11111"]) {
        self.firstLabel.text=_passMessage;
        
    }else{
        self.firstLabel.text=@"Looks like we currently don't have an Amazing Associate available to provide you the service type you are requesting.";
        self.secondLabel.text =@"You might first want to try searching Other in your requested Service Category. Also, please consider our extensive list of other services offered. You should know that we are continuously adding new Associates in your area, and appreciate your interest in the most innovative E-Service Business on the Planet!";
    }
    self.zipeCodeTextFiled.text=_sendZipCode;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.menuContainerViewController setPanMode:MFSideMenuPanModeNone];
}
-(void)iPadfontSize{
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        [self.sorryLabel setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:24.0f]];
        [self.firstLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:20.0f]];
        [self.secondLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:18.0f]];
        [self.thirdLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:15.0f]];
        [self.nameTextFiled setFont:[UIFont fontWithName:@"Oswald-Regular" size:15.0f]];
        [self.emailTextFiled setFont:[UIFont fontWithName:@"Oswald-Regular" size:15.0f]];
        [self.zipeCodeTextFiled setFont:[UIFont fontWithName:@"Oswald-Regular" size:15.0f]];
        [self.serviceRequiredTextFiled setFont:[UIFont fontWithName:@"Oswald-Regular" size:15.0f]];
        [self.submitBtn.titleLabel setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:20]];
        [self.gotQuestionBtn.titleLabel setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:20]];
    }else{
        
   }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)submitBtn:(id)sender {
    [self requestpostApi];
}
#pragma mark-submit request api

-(void)requestpostApi{
    bool checkNet=[EZCommonMethod checkInternetConnection];
    if(!checkNet){
        [EZCommonMethod showAlert:nil message:@"Please check your internet connection"];
        return;
    }
    NSString*urlStr=[NSString stringWithFormat:@"%@%@",BaseUrl,sendRequest_Api];
    NSDictionary*parameter=@{@"name":self.nameTextFiled.text,@"email":self.emailTextFiled.text,@"zip":self.zipeCodeTextFiled.text,@"service":self.serviceRequiredTextFiled.text};
   // {"name":"ABC","email":"developer.inext@gmail.com","zip":"160022","service":"Hello test email"}

    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[NetworkManager Instance]postRequestWithUrl:urlStr parameter:parameter onCompletion:^(id dict) {
        NSLog(@"%@",dict);
        NSError* error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:dict
                                                             options:kNilOptions
                                                               error:&error];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        if([[json valueForKey:@"success"] boolValue]==1){
            
            [EZCommonMethod showAlert:@"Your request has been sent successfully." message:@"Thank You!"];
            self.nameTextFiled.text=nil;
            self.emailTextFiled.text=nil;
            self.zipeCodeTextFiled.text=nil;
            self.serviceRequiredTextFiled.text=nil;
        }
        else{
            [EZCommonMethod showAlert:nil message:@"please check email"];
        }
    } onError:^(NSError *Error) {
        NSLog(@"%@:",Error);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
}
#pragma mark-got reuest mail
- (IBAction)gotqusetionAction:(id)sender {
    
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];
        mail.mailComposeDelegate = self;
        [mail setSubject:@"Sample Subject"];
        [mail setMessageBody:@"Here is some main text in the email!" isHTML:NO];
        [mail setToRecipients:@[@"USA@e-zhire.com"]];
        
        [self presentViewController:mail animated:YES completion:NULL];
    }
    else
    {
        [EZCommonMethod showAlert:nil message:@"This device cannot send email"];
    }
}
- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
