//
//  MyAvailbilityScheduleVC.h
//  e-zhire
//
//  Created by Developer on 01/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSCalendar.h"

@interface MyAvailbilityScheduleVC : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *monthShowTableview;

// for Mothh button Action and UiView
@property (strong, nonatomic) IBOutlet UIView *monthView;
- (IBAction)MothAvailablebtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *WeekDayHoursBtnAction;
- (IBAction)closeButtonAction:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *prvButtonAction;
@property (weak, nonatomic) IBOutlet UIButton *nextButtonAction;

// for DailyAdjutment button Action and UiView
@property (weak, nonatomic) IBOutlet UIButton *dailyAdjustmentsBtn;
- (IBAction)nextButtonAction:(id)sender;
-(IBAction)prvButtonAction:(id)sender;

- (IBAction)closeDailyScheduleViewBtnAction:(id)sender;

- (IBAction)showCalendar_Btn_Action:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *dailyAdjustmentView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property (weak, nonatomic) IBOutlet FSCalendar *calendraView;
- (IBAction)segmentValuChang:(id)sender;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *calendarHeightConstraint;

@property (strong, nonatomic) IBOutlet UIView *weekView;




@end
