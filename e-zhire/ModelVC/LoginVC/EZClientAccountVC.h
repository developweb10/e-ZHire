//
//  EZClientAccountVC.h
//  e-zhire
//
//  Created by Developer on 27/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EZClientAccountVC : UIViewController<UITableViewDataSource,UITableViewDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
- (IBAction)workorderAction:(id)sender;
- (IBAction)saveChangesAction:(id)sender;
- (IBAction)suggestnewPaswordAction:(id)sender;
- (IBAction)editClinetInfoACtion:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *editInfoView;
- (IBAction)closePopupAction:(id)sender;
@property(weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *address1Label;
@property (weak, nonatomic) IBOutlet UILabel *addLabel2;
@property (weak, nonatomic) IBOutlet UILabel *clientIdLabel;
@property (weak, nonatomic) IBOutlet UILabel *clientIdFont;
@property (weak, nonatomic) IBOutlet UILabel *clienySinceLabel;
@property (weak, nonatomic) IBOutlet UILabel *clientSinceFont;
@property (weak, nonatomic) IBOutlet UILabel *mobilePhoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *mobilePhoneFont;
@property (weak, nonatomic) IBOutlet UILabel *otherPhoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *othePhoneFont;
@property (weak, nonatomic) IBOutlet UILabel *personalEmailLabel;
@property (weak, nonatomic) IBOutlet UILabel *personalEmailFont;
@property (weak, nonatomic) IBOutlet UILabel *userNFont;
@property (weak, nonatomic) IBOutlet UILabel *loginPasswordLabel;
@property (weak, nonatomic) IBOutlet UILabel *loginPsTextFont;
@property (weak, nonatomic) IBOutlet UITableView *detailTableView;
@property (weak, nonatomic) IBOutlet UITextField *currentPassTextFiled;
@property (weak, nonatomic) IBOutlet UILabel *changePwTextFont;
@property (weak, nonatomic) IBOutlet UIButton *securePassTextFont;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (strong, nonatomic) IBOutlet UITextField *reTypeTextFiled;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *passwordConditionLabel;

- (IBAction)editClientInfoAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *savePassChangeBtn;
@property (strong, nonatomic) IBOutlet UIButton *workOrderBtn;
@property (strong, nonatomic) IBOutlet UIButton *invoicesBtn;
@property (strong, nonatomic) IBOutlet UITextField *newpass;
- (IBAction)invoiceAction:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *manageAccountDetailFont;
@property (strong, nonatomic) IBOutlet UILabel *EditNameLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *add2ConstraintHeight;
@property (weak, nonatomic) IBOutlet UILabel *accountNameLbl;

@property (strong, nonatomic) IBOutlet UILabel *ZipCodeLabel;
@property (strong, nonatomic) IBOutlet UITextField *currentStreetAddTextFiled;
@property (strong, nonatomic) IBOutlet UITextField *streetAdd2TextField;
@property (strong, nonatomic) IBOutlet UITextField *cityTextFiled;
@property (strong, nonatomic) IBOutlet UITextField *stateTextFiled;
@property (strong, nonatomic) IBOutlet UITextField *zipCodeTextField;
@property (strong, nonatomic) IBOutlet UITextField *cellPhoneTextField;
@property (strong, nonatomic) IBOutlet UITextField *personalEmailTextFiled;
@property (strong, nonatomic) IBOutlet UITextField *cellPhoneCarrierTextFiled;
@property (strong, nonatomic) IBOutlet UIButton *updateBtn;
- (IBAction)updateAction:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *homePhoneTextFiled;
@property(strong,nonatomic)NSString*getUserId;
- (IBAction)cellCarrierAction:(id)sender;



@end
