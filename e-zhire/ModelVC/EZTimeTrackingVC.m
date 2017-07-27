//
//  EZTimeTrackingVC.m
//  e-zhire
//
//  Created by Developer on 03/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZTimeTrackingVC.h"

@interface EZTimeTrackingVC ()

@end

@implementation EZTimeTrackingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     [self.menuContainerViewController setPanMode:MFSideMenuPanModeNone];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)workOrderAction:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"SELECT WORK ORDER" message:@"No Work Order Found" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    
    [self presentViewController:alertController animated:YES completion:nil];
}
- (IBAction)returnActiveJobsAction:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"No Work Order Found" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    
    [self presentViewController:alertController animated:YES completion:nil];
}
@end
