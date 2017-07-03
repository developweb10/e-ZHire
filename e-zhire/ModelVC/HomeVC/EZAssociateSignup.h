//
//  EZAssociateSignup.h
//  e-zhire
//
//  Created by Developer on 13/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EZAssociateSignup : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource,UIPopoverPresentationControllerDelegate>
{
    BOOL check;
  
}
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *phonNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *zipCodeTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateTextField;
@property (weak, nonatomic) IBOutlet UITextField *hearAboutTextField
;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;
- (IBAction)submitBtnaction:(id)sender;
- (IBAction)stateBtnAction:(id)sender;
- (IBAction)hearAboutAction:(id)sender;

@end
