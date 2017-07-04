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
@property (weak, nonatomic) IBOutlet CalendarView *dateCalenderView;
- (IBAction)searchAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *orderIdLabel;
- (IBAction)selectDateAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;
- (IBAction)priviousAction:(id)sender;
- (IBAction)nextAction:(id)sender;

@end
