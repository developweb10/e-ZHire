//
//  EZContactVC.h
//  e-zhire
//
//  Created by Developer on 31/05/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextField.h"

@interface EZContactVC : UIViewController
@property (weak, nonatomic) IBOutlet TextField *textFieldYourName;
@property (weak, nonatomic) IBOutlet TextField *textFieldYourEmail;
@property (weak, nonatomic) IBOutlet TextField *textFieldZipCode;
@property (weak, nonatomic) IBOutlet UITextView *textViewMessage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewConstraintHeight;
@property (weak, nonatomic) IBOutlet UILabel *loactionLabel;
@property (weak, nonatomic) IBOutlet UILabel *ezHireLabel;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *sendMessageLabel;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;
- (IBAction)SubmitAction:(id)sender;
- (IBAction)slideMenuAction:(id)sender;

@end
