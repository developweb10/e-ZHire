//
//  EZServiceDetailVC.m
//  e-zhire
//
//  Created by Developer on 14/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZServiceDetailVC.h"
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
}
@end

@implementation EZServiceDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    timeArr=[NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24", nil];
    [self borerLayer];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    [self categoryPostMethod];
    NSLog(@"%@",_sub_id);
    
    [self.allDetailView addSubview:self.recuringServiceView];
    self.recuringServiceView.center=self.allDetailView.center ;
    CGRect newFrame = CGRectMake( self.recuringServiceView.frame.origin.x, self.recuringServiceView.frame.origin.y+70, self.recuringServiceView.frame.size.width, self.recuringServiceView.frame.size.height);
    self.recuringServiceView.frame=newFrame;
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
    }else{
        
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
-(void)timeIsChanged:(UIDatePicker*)sender{
    
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
- (IBAction)searchBtnAction:(id)sender {
    if (self.zipcodeServiceTexfield.text.length>0) {
        if (self.dateserviceTextFiled.text.length>0) {
               if ([EZCommonMethod validateZip:self.zipcodeServiceTexfield.text]) {
              UIViewController *contorller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZSearchServiceVC"];
              [self.navigationController pushViewController:contorller animated:YES];
            }
            else{
                UIViewController *contorller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZSearchZipeCodeVC"];
                [self.navigationController pushViewController:contorller animated:YES];
            }
          }
          else{
             [EZCommonMethod showAlert:nil message:@"Please select date of service"];
            }
          }
    else{
        [EZCommonMethod showAlert:nil message:@"Please enter Zipcode"];
    }
}
- (IBAction)dateServiceAction:(id)sender {
    serviceCheck=NO;
    [self dateServicePicker];
}
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

#pragma mark- Day button Action
- (IBAction)mondayAction:(UIButton*)sender {
    if (sender.selected==NO) {
        [sender setImage:[UIImage imageNamed:@"Check"] forState:UIControlStateNormal];
        [sender setBackgroundColor:EZblueColor];
        sender.layer.borderWidth=0;
        sender.selected=YES;
    }else
    {
        sender.selected=NO;
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
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    NSDictionary*parameter=@{@"subcat_id":_sub_id };
//    [self.activityIndicator startAnimating];
//    self.activityIndicator.hidden=NO;
      self.activityIndicator.hidden=YES;
    [[NetworkManager Instance]postRequestWithUrl:urlStr parameter:parameter onCompletion:^(id dict) {
        NSLog(@"%@",dict);
        NSError* error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:dict
                                                             options:kNilOptions
                                                               error:&error];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSLog(@"%@",json);
        [self.activityIndicator startAnimating];
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
        
    } onError:^(NSError *Error) {
        NSLog(@"%@:",Error);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        //[EZCommonMethod showAlert:nil message:@"Please try again"];
    }];
}

@end
