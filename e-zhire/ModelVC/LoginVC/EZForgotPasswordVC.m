//
//  EZForgotPasswordVC.m
//  e-zhire
//
//  Created by Developer on 14/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZForgotPasswordVC.h"

@interface EZForgotPasswordVC ()

@end

@implementation EZForgotPasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.menuContainerViewController setPanMode:MFSideMenuPanModeNone];
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        [self.emailText setFont:[UIFont fontWithName:@"Oswald-Regular" size:15.0f]];
        [self.submitBtn.titleLabel setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:20]];
    }else{
        
    }
}
-(void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
