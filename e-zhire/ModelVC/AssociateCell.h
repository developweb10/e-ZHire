//
//  AssociateCell.h
//  e-zhire
//
//  Created by Developer on 13/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AssociateCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cellImage;
@property (weak, nonatomic) IBOutlet UILabel *serviceIdLbl;
@property (weak, nonatomic) IBOutlet UILabel *teamNameLbl;
@property (weak, nonatomic) IBOutlet UILabel *marketingLbl;
@property (weak, nonatomic) IBOutlet UIButton *marketingBtn;
@end
