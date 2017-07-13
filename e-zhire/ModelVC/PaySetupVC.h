//
//  PaySetupVC.h
//  e-zhire
//
//  Created by Developer on 11/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaySetupVC : UIViewController<UIActionSheetDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UIPopoverPresentationControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *paysetupLabel;
@property (weak, nonatomic) IBOutlet UILabel *depositLbl;
- (IBAction)helpAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *notLabel;
- (IBAction)bankAccDebitAction:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *bankAccountLbl;
@property (weak, nonatomic) IBOutlet UILabel *debitCardLbl;
@property (weak, nonatomic) IBOutlet UILabel *bankNameTextFontLbl;
@property (weak, nonatomic) IBOutlet UILabel *routingTextFonLbl;
@property (weak, nonatomic) IBOutlet UITextField *bankNameTxtFiled;
@property (weak, nonatomic) IBOutlet UITextField *bankRoutingTextFiled;
@property (weak, nonatomic) IBOutlet UILabel *accountFontLbl;
@property (weak, nonatomic) IBOutlet UITextField *bankAccTextFiled;
@property (weak, nonatomic) IBOutlet UILabel *nameAccountFontLbl;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightBottomConstraint;
@property (weak, nonatomic) IBOutlet UIView *allDetailView;
@property (weak, nonatomic) IBOutlet UITextField *nameAccTextFiled;
@property (weak, nonatomic) IBOutlet UILabel *dobFontLbl;
@property (weak, nonatomic) IBOutlet UIButton *dobTextFiled;
@property (weak, nonatomic) IBOutlet UILabel *addressLine1FontLbl;
@property (weak, nonatomic) IBOutlet UITextField *addressLine1textFiled;
@property (weak, nonatomic) IBOutlet UILabel *addressLine2FontLbl;
@property (weak, nonatomic) IBOutlet UITextField *address2TextFiled;
@property (weak, nonatomic) IBOutlet UILabel *cityFontLbl;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UILabel *zipFontLbl;
@property (weak, nonatomic) IBOutlet UITextField *zipTextField;
@property (weak, nonatomic) IBOutlet UILabel *stateFontLbl;
@property (weak, nonatomic) IBOutlet UITextField *stateTextField;
@property (weak, nonatomic) IBOutlet UIView *securityView;
@property (weak, nonatomic) IBOutlet UIView *bankAccountView;
@property (weak, nonatomic) IBOutlet UILabel *securityNoFontLbl;
@property (weak, nonatomic) IBOutlet UILabel *agreeLbl;
@property (weak, nonatomic) IBOutlet UITextField *securityTextField;
- (IBAction)agreeAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *agreBtn;
@property (weak, nonatomic) IBOutlet UILabel *agreeDetailLbl;
@property (weak, nonatomic) IBOutlet UILabel *slectTypeFont;
@property (weak, nonatomic) IBOutlet UITextField *fullSignTextField;
- (IBAction)upadateAccountAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *updateAccountBtn;
@property (weak, nonatomic) IBOutlet UILabel *selectTypeLbl;
- (IBAction)selectTypeAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *debitNameCardTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *debitCradNumberTextField;

@property (weak, nonatomic) IBOutlet UILabel *debitNamefont;
@property (weak, nonatomic) IBOutlet UILabel *debitNumberFont;
@property (weak, nonatomic) IBOutlet UILabel *expirationDateFont;
- (IBAction)selctMonthAction:(id)sender;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *securityViewHeightConstarint;
@property (weak, nonatomic) IBOutlet UILabel *monthLbl;
- (IBAction)selectYearAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *selectYearLbl;
@property (weak, nonatomic) IBOutlet UILabel *cvvFontLbl;
- (IBAction)whatisThisAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *cvvTexTField;
@property (weak, nonatomic) IBOutlet UIView *debitcardView;

@end
