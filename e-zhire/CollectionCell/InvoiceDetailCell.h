//
//  InvoiceDetailCell.h
//  e-zhire
//
//  Created by Developer on 27/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InvoiceDetailCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *viewDetailAction;
@property (weak, nonatomic) IBOutlet UIButton *disputBtn;
@property (strong, nonatomic) IBOutlet UILabel *eventLbl;
@property (strong, nonatomic) IBOutlet UILabel *dateLbl;
@property (strong, nonatomic) IBOutlet UILabel *seriveDiscriptionLbl;
@property (strong, nonatomic) IBOutlet UILabel *associateLbl;
@property (strong, nonatomic) IBOutlet UILabel *priceHourLbl;
@property (strong, nonatomic) IBOutlet UILabel *hoursWorkLbl;
@property (strong, nonatomic) IBOutlet UILabel *totalCostLbl;
@property (strong, nonatomic) IBOutlet UILabel *cellEventName;
@property (strong, nonatomic) IBOutlet UILabel *cellDateLbl;
@property (strong, nonatomic) IBOutlet UILabel *cellSeriveNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *cellAssociateLbl;
@property (strong, nonatomic) IBOutlet UILabel *cellPricePerHours;
@property (strong, nonatomic) IBOutlet UILabel *cellHourswokedLbl;
@property (strong, nonatomic) IBOutlet UILabel *cellTotalCostLbl;
@property (strong, nonatomic) IBOutlet UILabel *detailworkOrder;
@property (strong, nonatomic) IBOutlet UILabel *detailStartLbl;
@property (strong, nonatomic) IBOutlet UILabel *detailAssociateIdLbl;
@property (strong, nonatomic) IBOutlet UILabel *stopLbl;
@property (strong, nonatomic) IBOutlet UILabel *cellwokOrderId;
@property (strong, nonatomic) IBOutlet UILabel *cellAssociateId;
@property (strong, nonatomic) IBOutlet UILabel *startTime;
@property (strong, nonatomic) IBOutlet UILabel *cellStopTime;
@property (weak, nonatomic) IBOutlet UILabel *totalBilled;

@end
