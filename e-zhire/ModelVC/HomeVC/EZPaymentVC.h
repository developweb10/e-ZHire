//
//  EZPaymentVC.h
//  e-zhire
//
//  Created by Developer on 08/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EZPaymentVC : UIViewController<UIActionSheetDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UIPopoverPresentationControllerDelegate>
- (IBAction)nextBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *selectCardTypeTextField;
- (IBAction)selectCardTypeAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *nameCardTextField;
@property (weak, nonatomic) IBOutlet UITextField *cardNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *selectMonthTextField;
@property (weak, nonatomic) IBOutlet UITextField *selcYearTextField;
- (IBAction)selectMonthAction:(id)sender;
- (IBAction)selectYearAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *veryFicationTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *selectStateTextField;
- (IBAction)selectStateAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *zipCodeTexTFiled;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property(nonatomic,strong)NSMutableDictionary*clientPaymentDeict;
@property (weak, nonatomic) IBOutlet UITextField *streetAddress2Textfiled;

@end
