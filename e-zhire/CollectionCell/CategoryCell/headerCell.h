//
//  headerCell.h
//  e-zhire
//
//  Created by Developer on 26/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface headerCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIImageView *bannerImg;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bannerConstantHeight;
@property (weak, nonatomic) IBOutlet UIButton *searchForBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *searchBtnHeight;
@end
