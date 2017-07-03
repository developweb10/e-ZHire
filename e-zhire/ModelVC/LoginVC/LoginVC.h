//
//  EZLoginVC.h
//  e-zhire
//
//  Created by Developer on 31/05/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginVC : UIViewController
{
    BOOL checkAssociate;
}
@property (weak, nonatomic) IBOutlet UIButton *clientFaqBtn,*associateFaqBtn;
@property (weak, nonatomic) IBOutlet UILabel *freeAccountLbl;
@property (weak, nonatomic) IBOutlet UILabel *donotAccountLbl;
@property (weak, nonatomic) IBOutlet UIButton *clickRegBtn;
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;
- (IBAction)forgatePasswordAction:(id)sender;
- (IBAction)submitACtion:(id)sender;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginViewHeightConstraint;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;
@property (weak, nonatomic) IBOutlet UIButton *forgotPasswordBtn;
- (IBAction)slideMenuAction:(id)sender;

@end
