//
//  TodoListCell.h
//  e-zhire
//
//  Created by Developer on 03/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodoListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *checkimg;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UILabel *addTextLabel;
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;
@property (weak, nonatomic) IBOutlet UILabel *actionItemMarkLabel;


@end
