//
//  ManageAssociateBusiness.m
//  e-zhire
//
//  Created by Developer on 13/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "ManageAssociateBusiness.h"

@interface ManageAssociateBusiness ()

@end

@implementation ManageAssociateBusiness

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.menuContainerViewController setPanMode:MFSideMenuPanModeNone];
    
}
- (IBAction)helpAction:(id)sender {
}
- (IBAction)phoneAction:(id)sender {
}

- (IBAction)emailAction:(id)sender {
}
@end
