//
//  SearchServiceCell.m
//  e-zhire
//
//  Created by Developer on 22/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "SearchServiceCell.h"

@implementation SearchServiceCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self ipadFrontSize];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
-(void)ipadFrontSize{
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        
        [self.rateLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:20.0f]];
        [self.nameLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:20.0f]];
        [self.associateForLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:20.0f]];
        [self.ageLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:20.0f]];
        [self.idLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:20.0f]];
        [self.ratePerHourLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:20.0f]];
        [self.serviceLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:20.0f]];
        [self.availabilityLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:20.0f]];
        [self.dateLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:20.0f]];
        [self.startTimeLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:20.0f]];
        [self.estTimeLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:20.0f]];
        [self.recuringServiceLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:20.0f]];
        [self.profileLabel setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:20.0f]];
        [self.personalInfoLabel setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:20.0f]];
        [self.searchResultLabel setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:20.0f]];
        [self.hireMeBtn.titleLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:20]];
        [self.reviewProfileBtn.titleLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:20]];
        
        UIView *superVeiw= self;
        for (UIView *view in [superVeiw subviews] ) {
            for (UIView *sub in [view subviews]) {
                for (_celldetailView in [sub subviews]) {
                    for (UIView* subViewCat in [_celldetailView subviews]) {
                    if ([subViewCat isKindOfClass:[UILabel class]]) {
                        UILabel *lbl=(UILabel*)subViewCat;
                        if (lbl.tag>99 && lbl.tag<113) {
                            [lbl setFont:[UIFont fontWithName:@"Oswald-Regular" size:20.0f]];

                        }
                        
                    }
                  }
                }
                
            }
            
        }
    }
        else{
        
    }
   
}
@end
