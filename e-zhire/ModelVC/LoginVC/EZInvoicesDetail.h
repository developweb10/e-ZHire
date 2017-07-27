//
//  EZInvoicesDetail.h
//  e-zhire
//
//  Created by Developer on 27/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EZInvoicesDetail : UIViewController<UITextFieldDelegate,UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *adddresView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic) NSInteger seletedIndex;
@property (strong, nonatomic) IBOutlet UIView *disputView;
@property (weak, nonatomic) IBOutlet UIView *invoiceDetailView;
@property (weak, nonatomic) IBOutlet UILabel *eventlbl;
@property (weak, nonatomic) IBOutlet UILabel *invoiceDateLbl;
@property (weak, nonatomic) IBOutlet UILabel *invoiceServicelbl;
@property (weak, nonatomic) IBOutlet UILabel *invoiceAssociateLbl;
@property (weak, nonatomic) IBOutlet UILabel *invoicePerHourLbl;
@property (weak, nonatomic) IBOutlet UILabel *invoiceTotalLbl;
@property (weak, nonatomic) IBOutlet UILabel *invoiceHourworkLbl;
@property (weak, nonatomic) IBOutlet UIButton *viewDetailBtn;
- (IBAction)viewDetailAction:(id)sender;
@property(strong)NSString*detailInvoiceId;
@property(strong,nonatomic)NSString*invoiceUserId;
@property(strong,nonatomic)NSMutableArray*invoicePaymentArr;

@end
