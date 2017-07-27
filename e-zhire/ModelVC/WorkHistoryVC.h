//
//  WorkHistoryVC.h
//  e-zhire
//
//  Created by Developer on 04/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalendarView.h"

@interface WorkHistoryVC : UIViewController<CalendarViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *selectDateText;
@property (weak, nonatomic) IBOutlet UILabel *workOrderNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *typeworkOrderTestFiled;
- (IBAction)searchAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *orderIdLabel;
- (IBAction)selectDateAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;


@end
