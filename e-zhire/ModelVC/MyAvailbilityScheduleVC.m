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
    NSMutableArray *timeArr;
    UIAlertView*pikerAlert;
    UIPickerView *pickedView;
    BOOL sundayFromCheck;
    BOOL sundayToCheck;
    BOOL sundayOptFoCheck;
    BOOL sundayOptToCheck;
    BOOL monFromCheck;
    BOOL monToCheck;
    BOOL monOptFoCheck;
    BOOL monOptToCheck;
    
    
    BOOL tusFromCheck;
    BOOL tusToCheck;
    BOOL tusOptFoCheck;
    BOOL tusOptToCheck;
    
    BOOL wedFromCheck;
    BOOL wedToCheck;
    BOOL wedOptFoCheck;
    BOOL wedOptToCheck;
    
    BOOL thFromCheck;
    BOOL thToCheck;
    BOOL thOptFoCheck;
    BOOL thOptToCheck;
    
    BOOL friFromCheck;
    BOOL friToCheck;
    BOOL friOptFoCheck;
    BOOL friOptToCheck;
    
    BOOL satFromCheck;
    BOOL satToCheck;
    BOOL satOptFoCheck;
    BOOL satOptToCheck;
}
@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@property (strong, nonatomic) UIPanGestureRecognizer *scopeGesture;
@property (strong, nonatomic) NSDateFormatter *dateFormatter2;
@property (strong, nonatomic) NSArray *datesWithEvent;
@property (strong, nonatomic) NSArray *datesWithMultipleEvents;

@property (readonly, nonatomic) NSCalendar *gregorian;

@end

@implementation MyAvailbilityScheduleVC

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    monthArray = [NSArray arrayWithObjects:@"January",@"February",@"March",@"April",@"May",@"June",@"July",@"August",@"September",@"October",@"November",@"December", nil];
    
    checkArray=[NSMutableArray arrayWithObjects:@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0", nil];

    timeArr=[NSMutableArray arrayWithObjects:@"None",@"12:00AM",@"12:30AM",@"1:00AM",@"1:30AM",@"2:00AM",@"2:30AM",@"3:00AM",@"3:30AM",@"4:00AM",@"4:30AM",@"5:00AM",@"5:30AM",@"6:00AM",@"6:30AM",@"7:00AM",@"7:30AM",@"8:00AM",@"9:00AM",@"9:30AM",@"10:00AM",@"10:30AM",@"11:00AM",@"11:30AM",@"12:00PM",@"12:30PM",@"1:00PM",@"1:30PM",@"2:00PM",@"2:30PM",@"3:00PM",@"3:30PM",@"4:00PM",@"4:30PM",@"5:00PM",@"5:30PM",@"6:00PM",@"6:30PM",@"7:00PM",@"7:30PM",@"8:00PM",@"8:30PM",@"9:00PM",@"9:30PM",@"10:00PM",@"10:30PM",@"11:00PM",@"11:30PM",nil];
    
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
    [self textFiledDelegate];
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
        cell.checkImgeView.image=[UIImage imageNamed:@""];
        cell.checkImgeView.backgroundColor=[UIColor whiteColor];

    }else{
        cell.checkImgeView.image=[UIImage imageNamed:@"Check"];
        cell.checkImgeView.backgroundColor=[UIColor blueColor];
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
#pragma mark - Button Action

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
        NSDate *currentMonth = self.calendraView.currentPage;
        NSDate *previousMonth = [self.gregorian dateByAddingUnit:NSCalendarUnitMonth value:-1 toDate:currentMonth options:0];
        [self.calendraView setCurrentPage:previousMonth animated:YES];
        [self.calendraView setScope:FSCalendarScopeMonth animated:YES];
    }
}
-(IBAction)prvButtonAction:(id)sender{
    NSDate *currentMonth = self.calendraView.currentPage;
    NSDate *previousMonth = [self.gregorian dateByAddingUnit:NSCalendarUnitMonth value:-1 toDate:currentMonth options:0];
    [self.calendraView setCurrentPage:previousMonth animated:YES];
    [self.calendraView setScope:FSCalendarScopeMonth animated:YES];
}
-(IBAction)nextButtonAction:(id)sender{
    NSDate *currentMonth = self.calendraView.currentPage;
    NSDate *nextMonth = [self.gregorian dateByAddingUnit:NSCalendarUnitMonth value:1 toDate:currentMonth options:0];
    [self.calendraView setCurrentPage:nextMonth animated:YES];
    //self.calendraView setCurrentPage:
}
- (IBAction)dayHoursAction:(id)sender {
    self.weekView.hidden=NO;
    CGRect frame=self.weekView.bounds;
    frame.origin.y=50;
    frame.size.width=self.view.bounds.size.width;
    self.weekView.frame=frame;
    [self.view addSubview:self.weekView];
    
}
- (IBAction)dayHourCloseAction:(id)sender {
    self.weekView.hidden=YES;

}
- (IBAction)dateHourDayCheckAction:(UIButton*)sender {
    if (sender.selected==NO) {
        sender.selected=YES;
        [sender setImage:[UIImage imageNamed:@"Check"] forState:UIControlStateNormal];
        [sender setBackgroundColor:EZblueColor];
//        [selectedDays addObject:sender.titleLabel.text];
         sender.layer.borderWidth=0;
        
    }else
    {
        sender.selected=NO;
     //   __weak NSMutableArray *temp=selectedDays;
     //        for (int i=0;i<temp.count;i++) {
    //            NSString *tempString=[temp objectAtIndex:i];
    //            if ([sender.titleLabel.text isEqualToString:tempString]) {
   //                [selectedDays removeObjectAtIndex:i];
   //                break;
//            }
//        }
      //  temp=nil;
        [sender setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        sender.layer.borderWidth=0.5;
        [sender setBackgroundColor:[UIColor whiteColor]];
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

    if (sundayFromCheck) {
        sundayFromCheck=NO;
       self.sundayFromTimeText.text=[timeArr objectAtIndex:row];
    }else if (sundayToCheck){
        sundayToCheck=NO;
        self.sunTimeToText.text=[timeArr objectAtIndex:row];
    }
    else if (sundayOptFoCheck){
        sundayOptFoCheck=NO;
        self.sundayOptionFromTxt.text=[timeArr objectAtIndex:row];
    }
    else if (sundayOptToCheck){
         sundayOptToCheck=NO;
        self.sundayOptionalToTxt.text=[timeArr objectAtIndex:row];
    }
   else if (monFromCheck) {
        monFromCheck=NO;
        self.monTimeFromTxt.text=[timeArr objectAtIndex:row];
    }else if (monToCheck){
        monToCheck=NO;
        self.monDayTimeToText.text=[timeArr objectAtIndex:row];
    }
    else if (monOptFoCheck){
        monOptFoCheck=NO;
        self.monOptionalFromTimeTxt.text=[timeArr objectAtIndex:row];
    }
    else if (monOptToCheck){
        monOptToCheck=NO;
        self.monOptionalToTxt.text=[timeArr objectAtIndex:row];
    }
    
    ////
    
    if (tusFromCheck) {
        tusFromCheck=NO;
        self.tuesdayFromTimeTxt.text=[timeArr objectAtIndex:row];
    }else if (tusToCheck){
        tusToCheck=NO;
        self.tuesToTimeTxt.text=[timeArr objectAtIndex:row];
    }
    else if (tusOptFoCheck){
        tusOptFoCheck=NO;
        self.tuesOptionalTimeTxt.text=[timeArr objectAtIndex:row];
    }
    else if (tusOptToCheck){
        tusOptToCheck=NO;
        self.tuesOptionalToTxt.text=[timeArr objectAtIndex:row];
    }
    else if (wedFromCheck) {
        wedFromCheck=NO;
        self.wedFromTimeTxt.text=[timeArr objectAtIndex:row];
    }else if (wedToCheck){
        wedToCheck=NO;
        self.wedToTimeTxt.text=[timeArr objectAtIndex:row];
    }
    else if (wedOptFoCheck){
        wedOptFoCheck=NO;
        self.wedOptionalFromTime.text=[timeArr objectAtIndex:row];
    }
    else if (wedOptToCheck){
        wedOptToCheck=NO;
        self.wedOptionalTotime.text=[timeArr objectAtIndex:row];
    }
    ////
    if (thFromCheck) {
        thFromCheck=NO;
        self.thuFromTimeTxt.text=[timeArr objectAtIndex:row];
    }else if (thToCheck){
        thToCheck=NO;
        self.thuToTimeTxt.text=[timeArr objectAtIndex:row];
    }
    else if (thOptFoCheck){
        thOptFoCheck=NO;
        self.thuoptionalFromTime.text=[timeArr objectAtIndex:row];
    }
    else if (thOptToCheck){
        thOptToCheck=NO;
        self.thursdayOptionalToTime.text=[timeArr objectAtIndex:row];
    }
    else if (friFromCheck) {
        friFromCheck=NO;
        self.fridayFromTime.text=[timeArr objectAtIndex:row];
    }else if (friToCheck){
        friToCheck=NO;
        self.fridayToTime.text=[timeArr objectAtIndex:row];
    }
    else if (friOptFoCheck){
        friOptFoCheck=NO;
        self.fridayOptionalFromTime.text=[timeArr objectAtIndex:row];
    }
    else if (friOptToCheck){
        friOptToCheck=NO;
        self.fridayOptionalToTime.text=[timeArr objectAtIndex:row];
    }
    else if (satFromCheck) {
        satFromCheck=NO;
        self.saturdayFromTimeTxt.text=[timeArr objectAtIndex:row];
    }else if (satToCheck){
        satToCheck=NO;
        self.saturdayToTimeTxt.text=[timeArr objectAtIndex:row];
    }
    else if (satOptFoCheck){
        satOptFoCheck=NO;
        self.saturdayOptionalFromTime.text=[timeArr objectAtIndex:row];
    }
    else if (satOptToCheck){
        satOptToCheck=NO;
        self.satOptionalToTimeTxt.text=[timeArr objectAtIndex:row];
    }

}

#pragma make Select time picker  Method
-(void)timePickerView{
    pikerAlert= [[UIAlertView alloc] initWithTitle:@"Please Select" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    pikerAlert.alertViewStyle = UIAlertViewStyleDefault;
    pikerAlert.tag=102;
    //countryCodePickedView
    pickedView=[[UIPickerView alloc]init];
    [pickedView setDataSource: self];
    [pickedView setDelegate: self];
    pickedView.showsSelectionIndicator = YES;
    [pikerAlert setValue:pickedView forKey:@"accessoryView"];
    [pikerAlert show];
    [pickedView reloadAllComponents];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if (textField.tag ==100 ) {
        sundayFromCheck=YES;
     [self timePickerView];
    }else if (textField.tag ==101){
        sundayToCheck=YES;
        [self timePickerView];
    }
    else if (textField.tag ==102){
        sundayOptFoCheck=YES;
        [self timePickerView];
    }
    else if (textField.tag ==103){
         sundayOptToCheck=YES;
        [self timePickerView];
    }
    ///////
    else if (textField.tag ==200 ) {
        monFromCheck=YES;
        [self timePickerView];
    }else if (textField.tag ==201){
        monToCheck=YES;
        [self timePickerView];
    }
    else if (textField.tag ==202){
        monOptFoCheck=YES;
        [self timePickerView];
    }
    else if (textField.tag ==203){
        monOptToCheck=YES;
        [self timePickerView];
    }

    //////
    else if (textField.tag ==300 ) {
        tusFromCheck=YES;
        [self timePickerView];
    }else if (textField.tag ==301){
        tusToCheck=YES;
        [self timePickerView];
    }
    else if (textField.tag ==302){
        tusOptFoCheck=YES;
        [self timePickerView];
    }
    else if(textField.tag ==3000){
        tusOptToCheck=YES;
        [self timePickerView];
    }
    //////
    else if (textField.tag ==400 ) {
        wedFromCheck=YES;
        [self timePickerView];
    }else if (textField.tag ==401){
        wedToCheck=YES;
        [self timePickerView];
    }
    else if (textField.tag ==402){
        wedOptFoCheck=YES;
        [self timePickerView];
    }
    else if (textField.tag ==403){
        wedOptToCheck=YES;
        [self timePickerView];
        
    }
    //////
    else if (textField.tag ==500 ) {
        thFromCheck=YES;
        [self timePickerView];
    }else if (textField.tag ==501){
        thToCheck=YES;
        [self timePickerView];
    }
    else if (textField.tag ==502){
        thOptFoCheck=YES;
        [self timePickerView];
    }
    else if (textField.tag ==503){
        thOptToCheck=YES;
        [self timePickerView];
    }
  
    //////
    else if (textField.tag ==600 ) {
        friFromCheck=YES;
        [self timePickerView];
    }else if (textField.tag ==601){
        friToCheck=YES;
        [self timePickerView];
    }
    else if (textField.tag ==602){
        friOptFoCheck=YES;
        [self timePickerView];
    }
    else if (textField.tag ==603){
        friOptToCheck=YES;
        [self timePickerView];
    }
    //////
    else if (textField.tag ==700 ) {
        satFromCheck=YES;
        [self timePickerView];
    }else if (textField.tag ==701){
        satToCheck=YES;
        [self timePickerView];
    }
    else if (textField.tag ==702){
        satOptFoCheck=YES;
        [self timePickerView];
    }
    else if (textField.tag ==703){
        satOptToCheck=YES;
        [self timePickerView];
    }
    
    
    
    
}
-(void)textFiledDelegate{
     self.sundayFromTimeText.delegate=self;
     self.sunTimeToText.delegate=self;
     self.sundayOptionFromTxt.delegate=self;
    self.sundayOptionalToTxt.delegate=self;
    self.monTimeFromTxt.delegate=self;
    self.monDayTimeToText.delegate=self;
    self.monOptionalToTxt.delegate=self;
    self.monOptionalFromTimeTxt.delegate=self;

    self.tuesdayFromTimeTxt.delegate=self;
    self.tuesToTimeTxt.delegate=self;
    self.tuesOptionalTimeTxt.delegate=self;
    self.tuesToTimeTxt.delegate=self;

    self.wedFromTimeTxt.delegate=self;
    self.wedToTimeTxt.delegate=self;
    self.wedOptionalFromTime.delegate=self;
    self.wedOptionalTotime.delegate=self;
    
    self.thuFromTimeTxt.delegate=self;
    self.thuToTimeTxt.delegate=self;
    self.thuoptionalFromTime.delegate=self;
    self.thursdayOptionalToTime.delegate=self;
    
    self.fridayFromTime.delegate=self;
    self.fridayToTime.delegate=self;
    self.fridayOptionalFromTime.delegate=self;
    self.fridayOptionalToTime.delegate=self;
    
    self.saturdayFromTimeTxt.delegate=self;
    self.saturdayToTimeTxt.delegate=self;
    self.saturdayOptionalFromTime.delegate=self;
    self.satOptionalToTimeTxt.delegate=self;

   
}

@end
