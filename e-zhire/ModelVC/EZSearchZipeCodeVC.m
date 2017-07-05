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
}

@end
