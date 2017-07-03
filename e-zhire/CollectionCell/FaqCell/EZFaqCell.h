//
//  EZFaqCell.h
//  e-zhire
//
//  Created by Developer on 31/05/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EZFaqCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelQuestion;
@property (weak, nonatomic) IBOutlet UILabel *labelAns;
@property (weak, nonatomic) IBOutlet UIImageView *arrowImgView;

@end
