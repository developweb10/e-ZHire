//
//  EZServiceDetailVC.m
//  e-zhire
//
//  Created by Developer on 14/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZServiceDetailVC.h"
#import "SearchResultJsonModel.h"
#import "EZSearchServiceVC.h"
#import "EZSearchZipeCodeVC.h"
#import <CoreGraphics/CoreGraphics.h>
#import "CKCalendarView.h"

#define EZblueColor [UIColor colorWithRed:0/255.0 green:131/255.0 blue:255/255.0 alpha:1]

@interface EZServiceDetailVC ()
{
    NSString *dateString;
    NSArray*timeArr;
    NSIndexPath*index;
    BOOL serviceCheck;
    NSDictionary*catDetails;
    UIButton *button;
    UIDatePicker *datePicker;
    UIAlertView *pikerAlert;
    UIAlertView *datePikerAlert;
    NSString*estimateStr;
    BOOL searchServiceCheck;
    BOOL recuringBtnCheck;
    NSString *selectedMonthweakString;
    NSMutableArray *selectedDays;
    NSInteger chek;
    CKCalendarView *calendar;
    
}
@property(nonatomic, weak) CKCalendarView *calendar;
@property(nonatomic, strong) NSDateFormatter *dateFormatter;
@property(nonatomic, strong) NSDate *minimumDate;
@property(nonatomic, strong) NSArray *disabledDates;
@property(nonatomic,strong)NSMutableArray*checkRecuring;

@end

@implementation EZServiceDetailVC

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    timeArr=[NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24", nil];
    [self borerLayer];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    [self categoryPostMethod];
    NSLog(@"%@",_sub_id);
    
    self.recuringServiceView.center=self.allDetailView.center ;
    CGRect size=self.recuringServiceView.bounds;
    size.origin.y=150;
    size.origin.x=self.recuringServiceView.frame.origin.x;
    self.recuringServiceView.frame=size;
    [self.allDetailView addSubview:self.recuringServiceView];
    //CGRect newFrame = CGRectMake( self.recuringServiceView.frame.origin.x, self.recuringServiceView.frame.origin.y+30, self.recuringServiceView.frame.size.width, self.recuringServiceView.frame.size.height);
    //self.recuringServiceView.frame=newFrame;
    selectedDays = [NSMutableArray new];
    //    recuringBtnCheck=NO;
    self.recuringServiceView.backgroundColor=[UIColor whiteColor];
    self.recuringServiceView.hidden=YES;
    self.estimatehoursLabel.text=[timeArr objectAtIndex:0];
    self.serviceStartTimeLabel.text = @"09:00AM";
    [self iPadfontSize];
}
-(void)iPadfontSize{
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        [self.searchFreeLabel setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:20.0f]];
        [self.mySeriveLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:18.0f]];
        [self.dateLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:18.0f]];
        [self.startDateLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:18.0f]];
        [self.detailCatLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:18.0f]];
        [self.catNameLabel setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:20.0f]];
        [self.serivceNeedLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:18.0f]];
        [self.estimateLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:18.0f]];
        [self.recuringServiceLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:18.0f]];
        [self.everyweekLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:18.0f]];
        [self.otherWeekLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:18.0f]];
        [self.everyMonthLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:18.0f]];
        [self.mondayLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:18.0f]];
        [self.tuesdayLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:18.0f]];
        [self.wednesdayLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:18.0f]];
        [self.thursdayLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:18.0f]];
        [self.fridayLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:18.0f]];
        [self.saturdayLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:18.0f]];
        [self.sundayLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:18.0f]];
        [self.searchBtn.titleLabel setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:20]];
    }
    else
    {
        
    }
}
#pragma mark- PickerView delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
// tell the picker how many rows are available for a given component

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [timeArr count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [timeArr objectAtIndex: row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
    estimateStr=[timeArr objectAtIndex:row];
    self.estimatehoursLabel.text=[timeArr objectAtIndex:row];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
}
-(void)borerLayer{
    self.serviceShowPopupBtn.layer.borderColor=[UIColor grayColor].CGColor;
    self.serviceShowPopupBtn.layer.cornerRadius=2;
    self.serviceShowPopupBtn.layer.borderWidth=1;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- Button Action
- (IBAction)startTimeBtnAction:(id)sender {
    pikerAlert = [[UIAlertView alloc] initWithTitle:@"Please Select" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    pikerAlert.alertViewStyle = UIAlertViewStyleDefault;
    pikerAlert.tag=100;
    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0,250, 150)];
    datePicker.datePickerMode = UIDatePickerModeTime;
    datePicker.minuteInterval = 30;
    [pikerAlert setValue:datePicker forKey:@"accessoryView"];
    [pikerAlert show];
}

#pragma mark- AlertView Button Index

- (void) alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    NSLog(@"didDISMIS");
    if ((pikerAlert.tag==100)) {
        NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
        [outputFormatter setDateFormat:@"hh:mm a"];
        self.serviceStartTimeLabel.text = [outputFormatter stringFromDate:datePicker.date];
    }
    else if(datePikerAlert.tag==101) {
        NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
        NSDate *eventDate = datePicker.date;
        [dateFormat setDateFormat:@"MM/dd/yyyy"];
        dateString = [dateFormat stringFromDate:eventDate];
        [dateFormat setDateFormat:@"hh:mm a"];
        if (serviceCheck) {
            self.otherDateServiceTextField.text = [NSString stringWithFormat:@"%@",dateString];
        }else{
            self.dateserviceTextFiled.text = [NSString stringWithFormat:@"%@",dateString];
        }
    }
    else{
        self.estimatehoursLabel.text=estimateStr;
    }
}

-(void)timeIsChanged:(UIDatePicker*)sender {
    NSLog(@"Date changed");
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:@"hh:mm a"];
    self.serviceStartTimeLabel.text = [outputFormatter stringFromDate:sender.date];
}

- (IBAction)estimateHoursAction:(id)sender {
    pikerAlert= [[UIAlertView alloc] initWithTitle:@"Please Select" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    pikerAlert.alertViewStyle = UIAlertViewStyleDefault;
    pikerAlert.tag=102;
    //countryCodePickedView
    UIPickerView *countryCodePickedView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0,250, 150)];
    [countryCodePickedView setDataSource: self];
    [countryCodePickedView setDelegate: self];
    countryCodePickedView.showsSelectionIndicator = YES;
    [pikerAlert setValue:countryCodePickedView forKey:@"accessoryView"];
    [pikerAlert show];
    [countryCodePickedView reloadAllComponents];
}


- (IBAction)recurringServiceAction:(UIButton*)sender {
    if (sender.selected==NO) {
        sender.selected=YES;
        recuringBtnCheck=YES;
        
        [UIView transitionWithView:self.recuringServiceView
                          duration:1.0
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:^{
                            self.recuringServiceView.hidden=NO;
                            self.allDetailView.backgroundColor=[UIColor grayColor];
                            [sender setBackgroundColor:EZblueColor];
                        }
                        completion:NULL];
        
        [sender setImage:[UIImage imageNamed:@"Check"] forState:UIControlStateNormal];
        [sender setBackgroundColor:EZblueColor];
        
    }
    else{
        recuringBtnCheck=NO;
        sender.selected=NO;
        [UIView transitionWithView:self.recuringServiceView
                          duration:0.5
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:^{
                            self.recuringServiceView.hidden=YES;
                            self.allDetailView.backgroundColor=[UIColor whiteColor];
                        }
                        completion:NULL];
        [sender setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [sender setBackgroundColor:[UIColor whiteColor]];
    }
}
- (IBAction)searchBtnAction:(UIButton*)sender {
    
    if (self.zipcodeServiceTexfield.text.length>0) {
        if (self.dateserviceTextFiled.text.length>0) {
            if ([EZCommonMethod validateZip:self.zipcodeServiceTexfield.text]) {
                if (recuringBtnCheck) {
                    if (selectedMonthweakString!=nil) {
                        if (selectedDays.count>0) {
                            if (self.otherDateServiceTextField.text.length>0) {
                                [self SearchApiMethod];
                            }else{
                                [EZCommonMethod showAlert:nil message:@"Please select Until date"];
                            }
                        }
                        else{
                            [EZCommonMethod showAlert:nil message:@"Please select atleast one Day"];
                        }
                    }
                    else{
                        [EZCommonMethod showAlert:nil message:@"Please select recurring frequence"];
                    }
                }
                else{
                    [self SearchApiMethod];
                }
                
            }
            else{
                [EZCommonMethod showAlert:nil message:@"Please enter valid zipCode"];
            }
        }
        else{
            [EZCommonMethod showAlert:nil message:@"Please select date of service"];
        }
    }
    else{
        [EZCommonMethod showAlert:nil message:@"Please enter zipCode"];
    }
}
- (IBAction)dateServiceAction:(id)sender {
    serviceCheck=NO;
    [self dateServicePicker];
}
#pragma mark - Date picker

-(void)dateServicePicker{
    calendar = [[CKCalendarView alloc] initWithStartDay:startMonday];
    self.calendar = calendar;
    calendar.delegate = self;
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:@"MM/dd/yyyy"];
    calendar.onlyShowCurrentMonth = NO;
    calendar.adaptHeightToNumberOfWeeksInMonth = YES;
    calendar.frame = CGRectMake(40, 50, 300, 320);
    [self.view addSubview:calendar];
    self.view.backgroundColor = [UIColor whiteColor];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localeDidChange) name:NSCurrentLocaleDidChangeNotification object:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void)localeDidChange {
    [self.calendar setLocale:[NSLocale currentLocale]];
}

- (BOOL)dateIsDisabled:(NSDate *)date {
    for (NSDate *disabledDate in self.disabledDates) {
        if ([disabledDate isEqualToDate:date]) {
            return YES;
        }
    }
    return NO;
}

#pragma mark - CKCalendarDelegate

- (void)calendar:(CKCalendarView *)calendar configureDateItem:(CKDateItem *)dateItem forDate:(NSDate *)date {
    // TODO: play with the coloring if we want to...
    if ([self dateIsDisabled:date]) {
        dateItem.backgroundColor = [UIColor redColor];
        dateItem.textColor = [UIColor whiteColor];
    }
}
- (BOOL)calendar:(CKCalendarView *)calendar willSelectDate:(NSDate *)date {
    return ![self dateIsDisabled:date];
}
- (void)calendar:(CKCalendarView *)calendar didSelectDate:(NSDate *)date {
    NSTimeInterval secondsBetween = [date timeIntervalSinceDate:[NSDate date]];
    int days= (int)secondsBetween/86500;
    if(days<0){
        [EZCommonMethod showAlert:@"Oops," message:@"Please enter a valid date"];
        return;
    }else if(days>90){
        [EZCommonMethod showAlert:@"Oops," message:@"Please select a date within 90 days"];
        return;
    }
    NSLog(@"%d",days);
    if (serviceCheck) {
        self.otherDateServiceTextField.text = [self.dateFormatter stringFromDate:date];
        self.calendar.hidden=YES;
        
    }else{
        self.dateserviceTextFiled.text = [self.dateFormatter stringFromDate:date];
        self.calendar.hidden=YES;
    }
}
- (BOOL)calendar:(CKCalendarView *)calendar willChangeToMonth:(NSDate *)date andButtonPressed:(NSString *)str {
    
    NSLog(@"%@", [self.calendar datesShowing]);
    NSDate *dddate = [[self.calendar datesShowing] lastObject];
    NSTimeInterval secondsBetween = [dddate timeIntervalSinceDate:[NSDate date]];
    int days= (int)secondsBetween/86500;
    NSLog(@"%d",days);
    
    if (days>0 && days<90) {
        
        return YES;
    }
    else {
        if (days>91) {
            if ([str isEqualToString:@"prev"]) {
                return YES;
            }
        }
        else if (days<0){
            if ([str isEqualToString:@"next"]) {
                return YES;
            }
        }
        return NO;
    }
    /*if ([date laterDate:self.minimumDate] == date) {
     //  self.calendar.backgroundColor = [UIColor blueColor];
     return YES;
     } else {
     //   self.calendar.backgroundColor = [UIColor redColor];
     return NO;
     }
     */
}

- (void)calendar:(CKCalendarView *)calendar didLayoutInRect:(CGRect)frame {
    NSLog(@"calendar layout: %@", NSStringFromCGRect(frame));
}

/*
 -(void)dateServicePicker{
 datePikerAlert = [[UIAlertView alloc] initWithTitle:@"Please Select Date" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
 datePikerAlert.tag=101;
 datePikerAlert.alertViewStyle = UIAlertViewStyleDefault;
 datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0,250, 150)];
 datePicker.datePickerMode = UIDatePickerModeDate;
 datePicker.minuteInterval = 30;
 [datePikerAlert setValue:datePicker forKey:@"accessoryView"];
 
 [datePikerAlert show];
 }
 
 - (void)dateIsChanged:(UIDatePicker*)sender{
 NSLog(@"Date changed");
 NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
 NSDate *eventDate = sender.date;
 [dateFormat setDateFormat:@"MM/dd/yyyy"];
 dateString = [dateFormat stringFromDate:eventDate];
 [dateFormat setDateFormat:@"hh:mm a"];
 if (serviceCheck) {
 self.otherDateServiceTextField.text = [NSString stringWithFormat:@"%@",dateString];
 }else{
 self.dateserviceTextFiled.text = [NSString stringWithFormat:@"%@",dateString];
 }
 }
 */
#pragma mark- Day button Action

- (IBAction)mondayAction:(UIButton*)sender {
    if (sender.selected==NO) {
        sender.selected=YES;
        [sender setImage:[UIImage imageNamed:@"Check"] forState:UIControlStateNormal];
        [sender setBackgroundColor:EZblueColor];
        [selectedDays addObject:sender.titleLabel.text];
        sender.layer.borderWidth=0;
        
    }else
    {
        sender.selected=NO;
        __weak NSMutableArray *temp=selectedDays;
        for (int i=0;i<temp.count;i++) {
            NSString *tempString=[temp objectAtIndex:i];
            if ([sender.titleLabel.text isEqualToString:tempString]) {
                [selectedDays removeObjectAtIndex:i];
                break;
            }
        }
        temp=nil;
        [sender setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        sender.layer.borderWidth=0.5;
        [sender setBackgroundColor:[UIColor whiteColor]];
    }
}
- (IBAction)everyWeekBtn:(UIButton*)sender {
    UIView *superVeiw= [sender  superview];
    for (UIView *view in [superVeiw subviews] ) {
        if ([view isKindOfClass:[UIButton class]]) {
            if (view.tag ==101 || view.tag == 102 || view.tag==103) {
                if (view.tag==sender.tag) {
                    selectedMonthweakString=sender.titleLabel.text;
                    sender.selected=YES;
                    sender.layer.cornerRadius=10;
                    sender.layer.borderWidth=8;
                    sender.layer.borderColor=EZblueColor.CGColor;
                }
                else{
                    view.layer.cornerRadius=10;
                    view.layer.borderWidth=0.5;
                    view.layer.borderColor=[UIColor grayColor].CGColor;
                }
            }
        }
    }
}

- (IBAction)serviceDateAction:(id)sender {
    serviceCheck=YES;
    [self dateServicePicker];
}
#pragma mark- Api Post Method
-(void)categoryPostMethod{
    bool check=[EZCommonMethod checkInternetConnection];
    if(!check){
        [EZCommonMethod showAlert:nil message:@"Please check your internet connection"];
        return;
    }
    NSString*urlStr=[NSString stringWithFormat:@"%@%@",BaseUrl,catDetails_Api];
    NSDictionary*parameter=@{@"subcat_id":_sub_id };
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.activityIndicator.hidden=YES;
    [[NetworkManager Instance]postRequestWithUrl:urlStr parameter:parameter onCompletion:^(id dict) {
        NSLog(@"%@",dict);
        NSError* error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:dict
                                                             options:kNilOptions
                                                               error:&error];
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSLog(@"%@",json);
        self.activityIndicator.hidden=NO;
        if ([[json valueForKey:@"success"] boolValue]==1) {
            catDetails=[json valueForKey:@"value"];
            self.catNameLabel.text=[catDetails valueForKey:@"name"];
            self.detailCatLabel.text=[catDetails valueForKey:@"description"];
            NSString*catImageUrl=[catDetails valueForKey:@"image"];
            [self.profileImage sd_setImageWithURL:[NSURL URLWithString:catImageUrl] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                [self.activityIndicator stopAnimating];
                self.activityIndicator.hidden=YES;
            }];
        }
        else{
            
        }
    } onError:^(NSError *Error) {
        NSLog(@"%@:",Error);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        //[EZCommonMethod showAlert:nil message:@"Please try again"];
    }];
}
-(void)SearchApiMethod{
    bool check=[EZCommonMethod checkInternetConnection];
    if(!check){
        [EZCommonMethod showAlert:nil message:@"Please check your internet connection"];
        return;
    }
    NSString*urlStr;
    urlStr=[NSString stringWithFormat:@"%@%@",BaseUrl,search_Api];
    NSMutableDictionary *parameter=[NSMutableDictionary new];
    if (recuringBtnCheck) {
        [parameter setObject:self.dateserviceTextFiled.text forKey:@"dateofservice"];
        [parameter setObject:_sub_id forKey:@"tos"];
        [parameter setObject:self.otherDateServiceTextField.text forKey:@"until_date"];
        [parameter setObject:self.zipcodeServiceTexfield.text forKey:@"zipcode"];
        [parameter setObject:self.serviceStartTimeLabel.text forKey:@"tosfrom"];
        [parameter setObject:self.estimatehoursLabel.text forKey:@"esthrs"];
        if (selectedDays.count>0) {
            NSString *string=[selectedDays componentsJoinedByString:@","];
            [parameter setObject:string forKey:@"wkday"];
        }
        
        [parameter setObject:@"Closest Availability Match" forKey:@"sortby"];
        [parameter setObject:selectedMonthweakString forKey:@"timespan"];
      //  [parameter setObject:@(selectedDays.count).stringValue forKey:@"fwkday"];
       // [parameter setObject:@"1" forKey:@"fwkday"];
    }
    else{
        [parameter setObject:self.dateserviceTextFiled.text forKey:@"dateofservice"];
        [parameter setObject:_sub_id forKey:@"tos"];
        [parameter setObject:self.estimatehoursLabel.text forKey:@"esthrs"];
        [parameter setObject:self.zipcodeServiceTexfield.text forKey:@"zipcode"];
        [parameter setObject:self.serviceStartTimeLabel.text forKey:@"tosfrom"];
    }
    
     [MBProgressHUD showHUDAddedTo:self.view animated:YES];
     [[NetworkManager Instance]postRequestWithUrl:urlStr parameter:parameter onCompletion:^(id dict) {
        NSError* error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:dict
                                                             options:kNilOptions
                                                               error:&error];
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSLog(@"%@",json);
        if ([[json valueForKey:@"success"] boolValue]==1) {
            NSLog(@"json%@",json);
            NSMutableArray *result=[NSMutableArray new];
            result =[SearchResultJsonModel arrayOfModelsFromDictionaries:[json valueForKey:@"value"] error:&error];
            EZSearchServiceVC *object=[self.storyboard instantiateViewControllerWithIdentifier:@"EZSearchServiceVC"];
            object.passingArray=[NSMutableArray new];
            object.passingArray=result;
            [self.navigationController pushViewController:object animated:YES];
            NSLog(@"%@",result);
            
        }
        else{
            
            NSString*zipCode=self.zipcodeServiceTexfield.text;
            NSString*message=[json valueForKey:@"message"];
            EZSearchZipeCodeVC *contorller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZSearchZipeCodeVC"];
            contorller.passMessage=message;
            contorller.sendZipCode=zipCode;
            [self.navigationController pushViewController:contorller animated:YES];
        }
    }onError:^(NSError *Error) {
        NSLog(@"%@:",Error);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        //[EZCommonMethod showAlert:nil message:@"Please try again"];
    }];
    
    
    
}

@end
