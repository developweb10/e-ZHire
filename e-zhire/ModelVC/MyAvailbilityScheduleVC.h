//
//  MyAvailbilityScheduleVC.h
//  e-zhire
//
//  Created by Developer on 01/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSCalendar.h"
#define EZblueColor [UIColor colorWithRed:0/255.0 green:131/255.0 blue:255/255.0 alpha:1]

@interface MyAvailbilityScheduleVC : UIViewController<UIActionSheetDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UIPopoverPresentationControllerDelegate,UITextFieldDelegate>
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
- (IBAction)dayHoursAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *weekView;
- (IBAction)dayHourCloseAction:(id)sender;
- (IBAction)dateHourDayCheckAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *sundayFromTimeText;
@property (weak, nonatomic) IBOutlet UITextField *sunTimeToText;
@property (weak, nonatomic) IBOutlet UITextField *sundayOptionFromTxt;
@property (weak, nonatomic) IBOutlet UITextField *sundayOptionalToTxt;
@property (weak, nonatomic) IBOutlet UITextField *monTimeFromTxt;
@property (weak, nonatomic) IBOutlet UITextField *monDayTimeToText;
@property (weak, nonatomic) IBOutlet UITextField *monOptionalFromTimeTxt;
@property (weak, nonatomic) IBOutlet UITextField *monOptionalToTxt;
@property (weak, nonatomic) IBOutlet UITextField *tuesdayFromTimeTxt;
@property (weak, nonatomic) IBOutlet UITextField *tuesOptionalTimeTxt;
@property (weak, nonatomic) IBOutlet UITextField *tuesOptionalToTextField;
@property (weak, nonatomic) IBOutlet UITextField *tuesToTimeTxt;
@property (weak, nonatomic) IBOutlet UITextField *wedFromTimeTxt;
@property (weak, nonatomic) IBOutlet UITextField *wedToTimeTxt;
@property (weak, nonatomic) IBOutlet UITextField *wedOptionalFromTime;
@property (weak, nonatomic) IBOutlet UITextField *wedOptionalTotime;
@property (weak, nonatomic) IBOutlet UITextField *thuFromTimeTxt;
@property (weak, nonatomic) IBOutlet UITextField *thuToTimeTxt;
@property (weak, nonatomic) IBOutlet UITextField *thuoptionalFromTime;
@property (weak, nonatomic) IBOutlet UITextField *thursdayOptionalToTime;
@property (weak, nonatomic) IBOutlet UITextField *fridayFromTime;
@property (weak, nonatomic) IBOutlet UITextField *fridayToTime;
@property (weak, nonatomic) IBOutlet UITextField *fridayOptionalFromTime;
@property (weak, nonatomic) IBOutlet UITextField *fridayOptionalToTime;
@property (weak, nonatomic) IBOutlet UITextField *saturdayFromTimeTxt;
@property (weak, nonatomic) IBOutlet UITextField *saturdayToTimeTxt;
@property (weak, nonatomic) IBOutlet UITextField *saturdayOptionalFromTime;
@property (weak, nonatomic) IBOutlet UITextField *satOptionalToTimeTxt;
@property (weak, nonatomic) IBOutlet UITextField *selectDateTxt;
@property (weak, nonatomic) IBOutlet UITextField *minimumTimeTxt;
- (IBAction)helpAction:(id)sender;

@end
