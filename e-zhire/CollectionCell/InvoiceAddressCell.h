//
//  InvoiceAddressCell.h
//  e-zhire
//
//  Created by Developer on 24/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InvoiceAddressCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *billingAddLbl;
@property (weak, nonatomic) IBOutlet UILabel *ezHireAddressLbl;
@property (weak, nonatomic) IBOutlet UILabel *serviceAddLbl;
@property (weak, nonatomic) IBOutlet UILabel *invoiceAddLbl;
@property (weak, nonatomic) IBOutlet UIButton *selectPaymentBtn;

@end
