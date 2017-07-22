//
//  EZSearchZipeCodeVC.h
//  e-zhire
//
//  Created by Developer on 24/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface EZSearchZipeCodeVC : UIViewController<MFMailComposeViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *firstLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;
@property (weak, nonatomic) IBOutlet UILabel *thirdLabel;
@property (weak, nonatomic) IBOutlet UITextField *nameTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *emailTextFiled;

@property (weak, nonatomic) IBOutlet UITextField *zipeCodeTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *serviceRequiredTextFiled;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;
- (IBAction)submitBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *gotQuestionBtn;
@property (weak, nonatomic) IBOutlet UIButton *gotQuestionAction;
@property (weak, nonatomic) IBOutlet UILabel *sorryLabel;
@property(nonatomic)NSString*passMessage;
@property(nonatomic)NSString*sendZipCode;
- (IBAction)gotqusetionAction:(id)sender;

@end
