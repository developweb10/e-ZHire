//
//  InvoiceDetailCell.h
//  e-zhire
//
//  Created by Developer on 27/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InvoiceDetailCell : UITableViewCell<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *disputBtn;
@property (strong, nonatomic) IBOutlet UILabel *seriveDiscriptionLbl;
@property (weak, nonatomic) IBOutlet UILabel *totalBilled;
@property (weak, nonatomic) IBOutlet UILabel *dueDateLbl;
@property (weak, nonatomic) IBOutlet UILabel *cellWorkOrderId;
@property (weak, nonatomic) IBOutlet UILabel *cellAssociateId;
@property (weak, nonatomic) IBOutlet UILabel *startTime;
@property (weak, nonatomic) IBOutlet UILabel *endTime;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewDetailConstraintHeight;

@end
