//
//  EZEditPaymentInformationVc.h
//  e-zhire
//
//  Created by Developer on 29/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EZEditPaymentInformationVc : UIViewController<UIActionSheetDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UIPopoverPresentationControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *paymentInfoLbl;
@property (weak, nonatomic) IBOutlet UILabel *activeAccountLbl;
- (IBAction)selectMonthAction:(id)sender;
- (IBAction)selectYearAction:(id)sender;
- (IBAction)addAnotherAction:(id)sender;
- (IBAction)changeDefaultAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *cardLbl;
@property (weak, nonatomic) IBOutlet UITableView *editPaymentTableView;
@property (weak, nonatomic) IBOutlet UIImageView *cardImage;
@property (weak, nonatomic) IBOutlet UILabel *creditAndDebitcardLbl;
@property (weak, nonatomic) IBOutlet UITextField *cardTypeLbl;
@property (weak, nonatomic) IBOutlet UIButton *selectCardTypeBtn;
@property (weak, nonatomic) IBOutlet UITextField *cardNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *cardNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *selectMonthLbl;
@property (weak, nonatomic) IBOutlet UIButton *selectYearBtn;
@property (weak, nonatomic) IBOutlet UITextField *selectYearLbl;
@property (weak, nonatomic) IBOutlet UITextField *cvvTextField;
@property (weak, nonatomic) IBOutlet UIButton *selctMonthBtn;
- (IBAction)saveDetailAction:(id)sender;
- (IBAction)selectCardTypeAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *changeDefaultView;
- (IBAction)changeDefaultCloseAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *defaultcardLabel;
- (IBAction)selectDefaultCardAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *selectDefaultCradLabel;

- (IBAction)changeDefaultCardAction:(id)sender;


@end
