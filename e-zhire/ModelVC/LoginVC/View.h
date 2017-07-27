//
//  View.h
//  e-zhire
//
//  Created by Developer on 26/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface View : UIView
@property (weak, nonatomic) IBOutlet UILabel *eventLbl;
@property (weak, nonatomic) IBOutlet UILabel *dateLbl;
@property (weak, nonatomic) IBOutlet UILabel *associateLbl;
@property (weak, nonatomic) IBOutlet UILabel *pricePerHoreLbl;
@property (weak, nonatomic) IBOutlet UILabel *totalCostLbl;
@property (weak, nonatomic) IBOutlet UIButton *viewDetailBtn;
@property (weak, nonatomic) IBOutlet UILabel *serviceLbl;
@property (weak, nonatomic) IBOutlet UILabel *hourWorkLbl;
@end
