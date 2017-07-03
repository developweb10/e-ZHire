//
//  EZNextPaymentVC.h
//  e-zhire
//
//  Created by Developer on 13/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EZNextPaymentVC : UIViewController<UIActionSheetDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UIPopoverPresentationControllerDelegate>
{
    BOOL check;
}
@property (weak, nonatomic) IBOutlet UITextField *reffredAssociateIdNumberText;
@property (weak, nonatomic) IBOutlet UITextField *aboutEzHireText;
- (IBAction)aboutEzhireAction:(id)sender;
- (IBAction)agreeBtnAction:(id)sender;
- (IBAction)createAccountBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *createAccountBtn;
@property (weak, nonatomic) IBOutlet UILabel *agreeLabel;
@property(nonatomic,strong)NSMutableDictionary*paymentDetailDict;

@end
