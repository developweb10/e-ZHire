//
//  EZServiceDetailVC.h
//  e-zhire
//
//  Created by Developer on 14/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextField.h"

@interface EZServiceDetailVC : UIViewController<UIActionSheetDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UIPopoverPresentationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *detailCatLabel;
@property (weak, nonatomic) IBOutlet TextField *zipcodeServiceTexfield;
@property (weak, nonatomic) IBOutlet TextField *dateserviceTextFiled;
@property (weak, nonatomic) IBOutlet UILabel *serviceStartTimeLabel;
@property (strong, nonatomic) IBOutlet UIView *recuringServiceView;
@property (weak, nonatomic) IBOutlet UIView *allDetailView;
- (IBAction)mondayAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *catNameLabel;
@property (weak, nonatomic) IBOutlet TextField *otherDateServiceTextField;
- (IBAction)everyWeekBtn:(id)sender;
- (IBAction)serviceDateAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *estimatehoursLabel;
- (IBAction)startTimeBtnAction:(id)sender;
- (IBAction)estimateHoursAction:(id)sender;
- (IBAction)recurringServiceAction:(id)sender;
- (IBAction)searchBtnAction:(id)sender;
- (IBAction)dateServiceAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *serviceShowPopupBtn;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UILabel *searchFreeLabel;
@property (weak, nonatomic) IBOutlet UILabel *startDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *mySeriveLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *estimateLabel;
@property (weak, nonatomic) IBOutlet UILabel *recuringServiceLabel;
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;
@property (weak, nonatomic) IBOutlet UILabel *everyweekLabel;
@property (weak, nonatomic) IBOutlet UILabel *otherWeekLabel;
@property (weak, nonatomic) IBOutlet UILabel *everyMonthLabel;
@property (weak, nonatomic) IBOutlet UILabel *mondayLabel;
@property (weak, nonatomic) IBOutlet UILabel *tuesdayLabel;
@property (weak, nonatomic) IBOutlet UILabel *thursdayLabel;
@property (weak, nonatomic) IBOutlet UILabel *fridayLabel;
@property (weak, nonatomic) IBOutlet UILabel *saturdayLabel;
@property (weak, nonatomic) IBOutlet UILabel *sundayLabel;
@property (weak, nonatomic) IBOutlet UILabel *serivceNeedLabel;

@property (weak, nonatomic) IBOutlet UILabel *wednesdayLabel;
@property(nonatomic,strong)NSString*sub_id;
@end
