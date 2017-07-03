//
//  EZSignCreateAccountVC.h
//  e-zhire
//
//  Created by Developer on 06/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EZSignCreateAccountVC : UIViewController<UIActionSheetDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UIPopoverPresentationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *retypePasswordTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *cellPhoneCarrierTextFiled;
- (IBAction)nextPaymentBtn:(id)sender;
- (IBAction)forgotPasswordBtnAction:(id)sender;
- (IBAction)cellPhoneCarrerAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *middleNameTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *homePhoneTextField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewHeightConstraint;
@property (weak, nonatomic) IBOutlet UIButton *forgotPasswordBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextPayMentBtn;
@property (weak, nonatomic) IBOutlet UILabel *notificationLabel;

@end
