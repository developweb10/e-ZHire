//
//  ViewDetailcell.h
//  e-zhire
//
//  Created by Developer on 25/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewDetailcell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *cellwokOrderId;
@property (strong, nonatomic) IBOutlet UILabel *cellAssociateId;
@property (strong, nonatomic) IBOutlet UILabel *startTime;
@property (strong, nonatomic) IBOutlet UILabel *cellStopTime;
@property (weak, nonatomic) IBOutlet UIButton *disputBtn;
@end
