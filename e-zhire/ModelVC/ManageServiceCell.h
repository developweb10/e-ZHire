//
//  ManageServiceCell.h
//  e-zhire
//
//  Created by Developer on 12/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManageServiceCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *serviceIdLbl;
@property (weak, nonatomic) IBOutlet UILabel *seriveIdFont;
@property (weak, nonatomic) IBOutlet UILabel *teamNameLbl;
@property (weak, nonatomic) IBOutlet UILabel *teamNFont;
@property (weak, nonatomic) IBOutlet UILabel *pricePerHoursLbl;
@property (weak, nonatomic) IBOutlet UILabel *pricePerHourFont;
@property (weak, nonatomic) IBOutlet UILabel *teamMeamberLbl;
@property (weak, nonatomic) IBOutlet UILabel *seriveLbl;
@property (weak, nonatomic) IBOutlet UILabel *seriveFont;
@property (weak, nonatomic) IBOutlet UIButton *manageBtn;
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;
@end
