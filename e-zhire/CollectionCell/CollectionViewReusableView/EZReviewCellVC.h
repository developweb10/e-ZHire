//
//  EZReviewCellVC.h
//  e-zhire
//
//  Created by Developer on 23/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

#import"HCSStarRatingView.h"

@interface EZReviewCellVC : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentDetailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *arrow_iconImg;
@property (weak, nonatomic) IBOutlet UILabel *dateLbl;
@property (weak, nonatomic) IBOutlet HCSStarRatingView *starView;

@end
