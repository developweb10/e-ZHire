//
//  EZAccountingCell.h
//  e-zhire
//
//  Created by Developer on 03/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EZAccountingCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *datelabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *dateConstraintHeight;
@property (weak, nonatomic) IBOutlet UICollectionView *historyCollectionView;
@end
