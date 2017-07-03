//
//  EZWorkViewVC.m
//  e-zhire
//
//  Created by Developer on 28/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZWorkViewVC.h"

@interface EZWorkViewVC ()

@end

@implementation EZWorkViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.ratingView.hidden=YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark Button Action
- (IBAction)reviewAssociateAction:(UIButton*)sender {
   // CGRect frame=self.ratingView.bounds;
    //frame.origin.y=100;
//     frame.size.height=frame.size.height-200;
    
 //   self.ratingView.frame=frame;
    
 //   self.view.center=self.ratingView.center;
    
    [self.view addSubview:self.ratingView];
    
    if (sender.selected==NO) {
        sender.selected=YES;
        self.ratingView.hidden=NO;
    }else{
        sender.selected=NO;
        self.ratingView.hidden=YES;
    }
}

@end
