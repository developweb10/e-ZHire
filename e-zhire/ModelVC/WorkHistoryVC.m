//
//  WorkHistoryVC.m
//  e-zhire
//
//  Created by Developer on 04/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "WorkHistoryVC.h"

@interface WorkHistoryVC ()

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

- (IBAction)selectDateAction:(id)sender {
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
}
#pragma mark -Date DidChangeCalendarDate

- (void)didChangeCalendarDate:(NSDate *)date{
    NSLog(@"didChangeCalendarDate:%@", date);
       NSString*dateStr=[NSString stringWithFormat:@"%@",date];
       self.selectDateText.text=dateStr;
     // self.dateCalenderView.hidden=YES;
}
- (void)didChangeCalendarDate:(NSDate *)date withType:(NSInteger)type withEvent:(NSInteger)event
{
    NSLog(@"didChangeCalendarDate:%@ withType:%ld withEvent:%ld", date, (long)type, (long)event);
//   NSString*dateStr=[NSString stringWithFormat:@"%@",date];
//   self.selectDateText.text=dateStr;
    //self.dateCalenderView.hidden=YES;

}
- (void)didDoubleTapCalendar:(NSDate *)date withType:(NSInteger)type{
    NSLog(@"didDoubleTapCalendar:%@ withType:%ld", date, (long)type);
//    NSString*dateStr=[NSString stringWithFormat:@"%@",date];
//    self.selectDateText.text=dateStr;

}

- (IBAction)searchAction:(id)sender {
    
}
- (IBAction)priviousAction:(id)sender {
    [self.dateCalenderView advanceCalendarContents];

}
- (IBAction)nextAction:(id)sender {
    [self.dateCalenderView rewindCalendarContents];

}
@end
