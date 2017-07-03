//
//  EZTimeTrackingVC.h
//  e-zhire
//
//  Created by Developer on 03/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EZTimeTrackingVC : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
- (IBAction)workOrderAction:(id)sender;
- (IBAction)returnActiveJobsAction:(id)sender;

@end
