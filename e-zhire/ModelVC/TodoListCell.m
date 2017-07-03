//
//  TodoListCell.m
//  e-zhire
//
//  Created by Developer on 03/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "TodoListCell.h"

@implementation TodoListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.actionItemMarkLabel.adjustsFontSizeToFitWidth=YES;
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
