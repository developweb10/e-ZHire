//
//  AssociateManagementVC.h
//  e-zhire
//
//  Created by Developer on 30/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AssociateManagementVC : UIViewController
{
    BOOL check;
}
- (IBAction)helpAction:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *birthDateLbel;
- (IBAction)birthDateAction:(id)sender;
@property (weak,nonatomic) IBOutlet NSLayoutConstraint *profileHelpConstant;
@property (weak, nonatomic) IBOutlet UILabel *profileHelpLbl;
@property (strong, nonatomic) IBOutlet UILabel *profileTextFont;
- (IBAction)continuesetupAction:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *associateIdLbl;
@property (strong, nonatomic) IBOutlet UILabel *associateTextFont;
@property (strong, nonatomic) IBOutlet UILabel *userNameLbl;
@property (strong, nonatomic) IBOutlet UILabel *usernTextFont;
@property (strong, nonatomic) IBOutlet UILabel *associateSinceLbl;
@property (strong, nonatomic) IBOutlet UILabel *associateSTextFont;
@property (strong, nonatomic) IBOutlet UILabel *laoginPasswordLbl;
@property (strong, nonatomic) IBOutlet UILabel *loginPasswordTextFont;
@property (strong, nonatomic) IBOutlet UILabel *informationTextFont;
@property (strong, nonatomic) IBOutlet UITextField *frstNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *middleNTextFiled;
@property (strong, nonatomic) IBOutlet UITextField *lastNameTextFiled;
@property (strong, nonatomic) IBOutlet UITextField *currentStreetAdd;
@property (strong, nonatomic) IBOutlet UITextField *streetAdd2TextFiled;
@property (strong, nonatomic) IBOutlet UITextField *cityTextFieldTxt;
@property (strong, nonatomic) IBOutlet UITextField *stateTxt;
@property (strong, nonatomic) IBOutlet UITextField *zipCodeTxt;
@property (strong, nonatomic) IBOutlet UITextField *homePhoneTxt;
@property (strong, nonatomic) IBOutlet UITextField *cellPhoneTxt;
@property (strong, nonatomic) IBOutlet UITextField *cellPhoneCarrierTxt;
@property (strong, nonatomic) IBOutlet UITextField *personalEmailTxt;
@property (weak, nonatomic) IBOutlet UITextField *typeNewPassTxt;
@property (weak, nonatomic) IBOutlet UITextField *retypeTxt;
@property (strong, nonatomic) IBOutlet UILabel *ageLbl;
- (IBAction)saveChangeAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *signByTxt;



@end
