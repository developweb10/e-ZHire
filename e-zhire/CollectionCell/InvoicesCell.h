//
//  InvoicesCell.h
//  e-zhire
//
//  Created by Developer on 27/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InvoicesCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *invoiceHeaderLbl;
@property (strong, nonatomic) IBOutlet UILabel *dueDateHeaderLbl;
@property (strong, nonatomic) IBOutlet UILabel *statusHeaderLbl;
@property (strong, nonatomic) IBOutlet UILabel *totalBilledHeaderLbl;
@property (strong, nonatomic) IBOutlet UILabel *cellViewInvoiceLbl;
@property (strong, nonatomic) IBOutlet UILabel *inVoiceIdLbl;
@property (strong, nonatomic) IBOutlet UILabel *disputLbl;
@property (strong, nonatomic) IBOutlet UILabel *cellPricelbl;

@property (strong, nonatomic) IBOutlet UILabel *cellDateLbl;
@end
