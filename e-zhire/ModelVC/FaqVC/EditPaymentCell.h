//
//  EditPaymentCell.h
//  e-zhire
//
//  Created by Developer on 14/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditPaymentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *visaCradNameLbl;
@property (weak, nonatomic) IBOutlet UILabel *cardNumberLbl;
@property (weak, nonatomic) IBOutlet UILabel *expireDateLbl;
@property (weak, nonatomic) IBOutlet UIButton *editBtn;
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;
@property (weak, nonatomic) IBOutlet UIButton *defaultBtn;
@end
