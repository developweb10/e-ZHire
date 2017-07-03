//
//  EZTermVC.m
//  e-zhire
//
//  Created by Developer on 06/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZTermVC.h"
#import "MBProgressHUD.h"
@interface EZTermVC ()

@end

@implementation EZTermVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title=@"TERMS & CONDITIONS";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    [self getTermMethod];
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        [self.termTxtView setFont:[UIFont fontWithName:@"Oswald-Regular" size:18.0f]];
        
    }else{
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)slideMenuAction:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:^{}];
    
}
#pragma mark- Privacy Api Method

-(void)getTermMethod{
    
    bool check=[EZCommonMethod checkInternetConnection];
    if(!check){
        [EZCommonMethod showAlert:nil message:@"Please check your internet connection"];
        return;
    }
    NSString *urlString=[NSString stringWithFormat:@"%@%@",BaseUrl,term_Api];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[NetworkManager Instance] getRequestWithUrl:urlString parameter:nil onCompletion:^(id dict) {
        NSError* errorJson=nil;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:dict
                                                             options:kNilOptions
                                                               error:&errorJson];
        
        NSLog(@"%@",json);
        if ([[json valueForKey:@"success"] boolValue]==1) {
            termDict=[json valueForKey:@"value"];
            NSLog(@"%@",[termDict valueForKey:@"content"]);
            self.termTxtView.text=[termDict valueForKey:@"content"];
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }
        
    } onError:^(NSError *Error) {
        NSLog(@"%@",Error);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [EZCommonMethod showAlert:nil message:@"Please try again"];
        
    }];
}



@end
