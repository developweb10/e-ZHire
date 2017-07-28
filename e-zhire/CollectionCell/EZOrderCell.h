//
//  EZOrderCell.h
//  e-zhire
//
//  Created by Developer on 27/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EZOrderCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *viewOrderBtn;
@property (weak, nonatomic) IBOutlet UILabel *workorderLbl;
@property (weak, nonatomic) IBOutlet UILabel *serviceTypeLbl;

@property (weak, nonatomic) IBOutlet UILabel *dateSechduleLbl;
@property (weak, nonatomic) IBOutlet UILabel *statrTimeLbl;
@property (weak, nonatomic) IBOutlet UILabel *clientNameLbl;
@property (weak, nonatomic) IBOutlet UILabel *associate;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *associateViewConstaintHeight;
@property (weak, nonatomic) IBOutlet UILabel *orderTypeLbl;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *typeViewContsintHeight;
@end
