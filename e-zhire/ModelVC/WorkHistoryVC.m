//
//  WorkHistoryVC.m
//  e-zhire
//
//  Created by Developer on 04/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "WorkHistoryVC.h"

@interface WorkHistoryVC ()
{
    UIDatePicker*datePicker;
    UIAlertView*datePikerAlert;
    NSString*dateString;
}
@end

@implementation WorkHistoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dateCalenderView.hidden=YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectDateAction:(UIButton*)sender {
    /*
    self.dateCalenderView.hidden=NO;
    self.dateCalenderView.calendarDelegate = self;
    self.dateCalenderView.shouldShowHeaders = YES;
    self.dateCalenderView.dayCellWidth = 40;
    self.dateCalenderView.dayCellHeight = 40;
    self.dateCalenderView.monthCellWidth = 80;
    self.dateCalenderView.monthCellHeight = 30;
    self.dateCalenderView.yearCellWidth = 60;
    self.dateCalenderView.yearCellHeight = 30;
    
    [self.dateCalenderView refresh];
     */
    [self selectDate];

    
//    if (sender.selected==NO) {
//        sender.selected=YES;
//         [self selectDate];
//        datePikerAlert.hidden=NO;
//        
//    }else{
//       datePikerAlert.hidden=YES;
//    }
    
}
-(void)selectDate{

    datePikerAlert = [[UIAlertView alloc] initWithTitle:@"Please Select Date" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    datePikerAlert.tag=101;
    datePikerAlert.alertViewStyle = UIAlertViewStyleDefault;
    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0,250, 150)];
    datePicker.datePickerMode = UIDatePickerModeDate;
    datePicker.minuteInterval = 30;
    [datePikerAlert setValue:datePicker forKey:@"accessoryView"];
    [datePikerAlert show];

}
//- (void)dateIsChanged:(UIDatePicker*)sender{
//    NSLog(@"Date changed");
//    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
//    NSDate *eventDate = sender.date;
//    [dateFormat setDateFormat:@"MM/dd/yyyy"];
//    dateString = [dateFormat stringFromDate:eventDate];
//    [dateFormat setDateFormat:@"hh:mm a"];
//   self.selectDateText.text = [NSString stringWithFormat:@"%@",dateString];
//
//   }

- (void) alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    NSLog(@"didDISMIS");
    
    if(datePikerAlert.tag==101) {
        NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
        NSDate *eventDate = datePicker.date;
        [dateFormat setDateFormat:@"MM/dd/yyyy"];
        dateString = [dateFormat stringFromDate:eventDate];
        [dateFormat setDateFormat:@"hh:mm a"];
        self.selectDateText.text = [NSString stringWithFormat:@"%@",dateString];
  }
}


- (IBAction)searchAction:(id)sender {
    
}


@end
