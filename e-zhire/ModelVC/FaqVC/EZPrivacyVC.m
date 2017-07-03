//
//  EZPrivacyVC.m
//  e-zhire
//
//  Created by Developer on 06/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZPrivacyVC.h"
#import "MBProgressHUD.h"

@interface EZPrivacyVC ()

@end

@implementation EZPrivacyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title=@"PRIVACY POLICY";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    [self getPrivacyMethod];
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        [self.privacyTextView setFont:[UIFont fontWithName:@"Oswald-Regular" size:18.0f]];
        
    }else{
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark- Privacy Api method

-(void)getPrivacyMethod{
    
    bool check=[EZCommonMethod checkInternetConnection];
    if(!check){
        [EZCommonMethod showAlert:nil message:@"Please check your internet connection"];
        return;
    }
    NSString *urlString=[NSString stringWithFormat:@"%@%@",BaseUrl,privacyPolicy_Api];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[NetworkManager Instance] getRequestWithUrl:urlString parameter:nil onCompletion:^(id dict) {
        NSError* errorJson=nil;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:dict
                                                             options:kNilOptions
                                                               error:&errorJson];
        
        NSLog(@"%@",json);
        if ([[json valueForKey:@"success"] boolValue]==1) {
            privacyDict=[json valueForKey:@"value"];
            NSLog(@"%@",[privacyDict valueForKey:@"content"]);
            self.privacyTextView.text=[privacyDict valueForKey:@"content"];

            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }
        
    } onError:^(NSError *Error) {
        NSLog(@"%@",Error);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
      //  [EZCommonMethod showAlert:nil message:@"Please try again"];
        
    }];

}

- (IBAction)slideMenuAction:(id)sender {
      [self.menuContainerViewController toggleLeftSideMenuCompletion:^{}];
}
@end
