//
//  WorkViewDetailCell.h
//  e-zhire
//
//  Created by Developer on 14/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WorkViewDetailCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *dateTimeLbl;
@property (weak, nonatomic) IBOutlet UILabel *clienNameLbl;
@property (weak, nonatomic) IBOutlet UILabel *serviceDetailLbl;

@end
