//
//  MyAvailbilityScheduleVC.m
//  e-zhire
//
//  Created by Developer on 01/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "MyAvailbilityScheduleVC.h"
#import "MonthCell.h"

@interface MyAvailbilityScheduleVC ()<UIGestureRecognizerDelegate>
{
    NSArray *monthArray;
    void * _KVOContext;

    NSMutableArray *checkArray;
    
    
}
@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@property (strong, nonatomic) UIPanGestureRecognizer *scopeGesture;
@property (strong, nonatomic) NSDateFormatter *dateFormatter2;
@property (strong, nonatomic) NSArray *datesWithEvent;
@property (strong, nonatomic) NSArray *datesWithMultipleEvents;




@end


@implementation MyAvailbilityScheduleVC

#pragma mark - Life cycle

    
- (void)viewDidLoad {
    [super viewDidLoad];
    monthArray = [NSArray arrayWithObjects:@"January",@"February",@"March",@"April",@"May",@"June",@"July",@"August",@"September",@"October",@"November",@"December", nil];
    
    checkArray=[NSMutableArray arrayWithObjects:@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0", nil];
    
    
    self.dateFormatter = [[NSDateFormatter alloc] init];
    self.dateFormatter.dateFormat = @"yyyy/MM/dd";
    self.dateFormatter2 = [[NSDateFormatter alloc] init];
    self.dateFormatter2.dateFormat = @"yyyy/MM/dd";
    CGRect frame=self.monthView.bounds;
    frame.size.height=300;
    frame.origin.x=40;
    frame.origin.y=100;
    frame.size.width=self.view.bounds.size.width-80;
    self.monthView.frame=frame;
    self.monthView.hidden=YES;
    [self.view addSubview:self.monthView];
    
    CGRect frame2=self.dailyAdjustmentView.bounds;
    frame2.size.height=400;
    frame2.origin.x=40;
    frame2.origin.y=100;
    frame2.size.width=self.view.bounds.size.width-80;
    self.dailyAdjustmentView.frame=frame2;
    self.dailyAdjustmentView.hidden=YES;
    [self.view addSubview:self.dailyAdjustmentView];
    
    
    CGRect frame3=self.weekView.bounds;
    frame3.size.height=400;
    frame3.origin.x=40;
    frame3.origin.y=100;
    frame3.size.width=self.view.bounds.size.width-80;
    self.weekView.frame=frame3;
    self.weekView.hidden=YES;
    [self.view addSubview:self.weekView];
    
    [self.calendraView selectDate:[NSDate date] scrollToDate:YES];
    self.calendraView.allowsMultipleSelection = YES;

    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self.calendraView action:@selector(handleScopeGesture:)];
    panGesture.delegate = self;
    panGesture.minimumNumberOfTouches = 1;
    panGesture.maximumNumberOfTouches = 2;
    [self.view addGestureRecognizer:panGesture];
    self.scopeGesture = panGesture;
    self.dailyAdjustmentView.backgroundColor=[UIColor whiteColor];
    [self.calendraView addObserver:self forKeyPath:@"scope" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:_KVOContext];
    self.calendraView.scope = FSCalendarScopeMonth;
    
    // For UITest
    self.calendraView.accessibilityIdentifier = @"calendar";

    
    // Do any additional setup after loading the view.
}

- (void)dealloc
{
    [self.calendraView removeObserver:self forKeyPath:@"scope" context:_KVOContext];
    NSLog(@"%s",__FUNCTION__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





#pragma mark- TableView DataSource and Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return monthArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    static NSString *MyIdentifier = @"MonthCell";
    MonthCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    cell.monthTitle.text=[monthArray objectAtIndex:indexPath.row];
    
    NSInteger chek=[[checkArray objectAtIndex:indexPath.row] integerValue];
    if (chek==0) {
        cell.imageView.image=[UIImage imageNamed:@""];
    }else{
        cell.imageView.image=[UIImage imageNamed:@"CheckInRed"];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger check=[[checkArray objectAtIndex:indexPath.row] integerValue];
    if (check==0) {
        [checkArray removeObjectAtIndex:indexPath.row];
        [checkArray insertObject:@"1" atIndex:indexPath.row];
    }
    else{
        [checkArray removeObjectAtIndex:indexPath.row];
        [checkArray insertObject:@"0" atIndex:indexPath.row];
    }
    [_monthShowTableview reloadData];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)MothAvailablebtnAction:(id)sender {
    [UIView transitionWithView:self.monthView
                      duration:0.5
                       options:UIViewAnimationOptionTransitionCurlDown
                    animations:^{
                        self.view.backgroundColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.2];
                        self.monthView.hidden=NO;
                    }
                    completion:NULL];
}

- (IBAction)closeButtonAction:(id)sender {
    [UIView transitionWithView:self.monthView
                      duration:0.5
                       options:UIViewAnimationOptionTransitionCurlUp
                    animations:^{
                        self.view.backgroundColor=[UIColor whiteColor];

                        self.monthView.hidden=YES;
                    }
                    completion:NULL];
}

- (IBAction)closeDailyScheduleViewBtnAction:(id)sender {
    [UIView transitionWithView:self.dailyAdjustmentView
                      duration:0.5
                       options:UIViewAnimationOptionTransitionCurlUp
                    animations:^{
                        self.view.backgroundColor=[UIColor whiteColor];

                        self.dailyAdjustmentView.hidden=YES;
                    }
                    completion:NULL];
}

- (IBAction)showCalendar_Btn_Action:(id)sender {

    [UIView transitionWithView:self.dailyAdjustmentView
                      duration:0.5
                       options:UIViewAnimationOptionTransitionCurlDown
                    animations:^{
                        self.view.backgroundColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.2];
                        self.dailyAdjustmentView.hidden=NO;
                    }
                    completion:NULL];
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if (context == _KVOContext) {
        
        FSCalendarScope oldScope = [change[NSKeyValueChangeOldKey] unsignedIntegerValue];
        FSCalendarScope newScope = [change[NSKeyValueChangeNewKey] unsignedIntegerValue];
        NSLog(@"From %@ to %@",(oldScope==FSCalendarScopeWeek?@"week":@"month"),(newScope==FSCalendarScopeWeek?@"week":@"month"));
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

#pragma mark - <UIGestureRecognizerDelegate>

// Whether scope gesture should begin
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{/*
    BOOL shouldBegin = self.tableView.contentOffset.y <= -self.tableView.contentInset.top;
    
    if (shouldBegin) {
        CGPoint velocity = [self.scopeGesture velocityInView:self.view];
        switch (self.calendraView.scope) {
            case FSCalendarScopeMonth:
                return velocity.y < 0;
            case FSCalendarScopeWeek:
                return velocity.y > 0;
        }
    }
    return shouldBegin;
  */
    return nil;
    
}


#pragma mark - <FSCalendarDelegate>


- (NSInteger)calendar:(FSCalendar *)calendar numberOfEventsForDate:(NSDate *)date {
    NSString *dateString = [self.dateFormatter2 stringFromDate:date];
    if ([_datesWithEvent containsObject:dateString]) {
        return 1;
    }
    if ([_datesWithMultipleEvents containsObject:dateString]) {
        return 3;
    }
    return 0;
}

- (void)calendar:(FSCalendar *)calendar boundingRectWillChange:(CGRect)bounds animated:(BOOL)animated
{
    //    NSLog(@"%@",(calendar.scope==FSCalendarScopeWeek?@"week":@"month"));
    _calendarHeightConstraint.constant = CGRectGetHeight(bounds);
    [self.view layoutIfNeeded];
}

- (void)calendar:(FSCalendar *)calendar didSelectDate:(NSDate *)date atMonthPosition:(FSCalendarMonthPosition)monthPosition
{
    NSLog(@"did select date %@",[self.dateFormatter stringFromDate:date]);
    
    NSMutableArray *selectedDates = [NSMutableArray arrayWithCapacity:calendar.selectedDates.count];
    [calendar.selectedDates enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [selectedDates addObject:[self.dateFormatter stringFromDate:obj]];
    }];
    NSLog(@"selected dates is %@",selectedDates);
    if (monthPosition == FSCalendarMonthPositionNext || monthPosition == FSCalendarMonthPositionPrevious) {
        [calendar setCurrentPage:date animated:YES];
    }
}

- (UIColor *)calendar:(FSCalendar *)calendar appearance:(FSCalendarAppearance *)appearance fillDefaultColorForDate:(NSDate *)date
{
        return [UIColor lightGrayColor];
}

- (UIColor *)calendar:(FSCalendar *)calendar appearance:(FSCalendarAppearance *)appearance fillSelectionColorForDate:(NSDate *)date
{
        return [UIColor redColor];
  
}
- (void)calendarCurrentPageDidChange:(FSCalendar *)calendar
{
    NSLog(@"%s %@", __FUNCTION__, [self.dateFormatter stringFromDate:calendar.currentPage]);
}

#pragma mark- Segment Controle value change method
- (IBAction)segmentValuChang:(id)sender {
    if (_segmentControl.selectedSegmentIndex==1) {
        [self.calendraView setScope:FSCalendarScopeWeek animated:YES];
    }else{
        [self.calendraView setScope:FSCalendarScopeMonth animated:YES];
    }
}
@end