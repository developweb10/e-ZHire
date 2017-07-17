//
//  PaySetupVC.m
//  e-zhire
//
//  Created by Developer on 11/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "PaySetupVC.h"

@interface PaySetupVC ()
{
    BOOL check;
    NSArray*monthArr;
    NSArray*yearArr;
    NSArray*cardTypeArr;
    BOOL checkMonth;
    BOOL checkcardType;
    UIAlertView*pikerAlert;
    UIPickerView *pickedView;
}

@end

@implementation PaySetupVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.bankAccountView.hidden=NO;
    self.debitcardView.hidden=YES;
    monthArr=[NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12", nil];
    yearArr=[NSArray arrayWithObjects:@"2017",@"2018",@"2019",@"2020",@"2021",@"2022",@"2023",@"2024",@"2025",@"2026",@"2027" ,@"2028" ,@"2029",@"2030",@"2031",@"2032",nil];
    cardTypeArr=[NSArray arrayWithObjects:@"Visa",@"Master Card",@"Discover",@"American Express", nil];
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.menuContainerViewController setPanMode:MFSideMenuPanModeNone];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark- PickerView delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
// tell the picker how many rows are available for a given component

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (checkMonth) {
        return [yearArr count];
    }
    else if (checkcardType) {
        return [cardTypeArr count];
    }
    else{
        return [monthArr count];
    }
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if (checkMonth) {
        return [yearArr objectAtIndex: row];
    }
    else if (checkcardType) {
        return [cardTypeArr objectAtIndex: row];
    }
    else{
        return [monthArr objectAtIndex: row];
    }
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
    
    if (checkMonth) {
        self.selectYearLbl.text=[yearArr objectAtIndex:row];
    }
    else if (checkcardType) {
        self.selectTypeLbl.text=[cardTypeArr objectAtIndex:row];
    }
    else{
        self.monthLbl.text=[monthArr objectAtIndex:row];
    }
}
#pragma make Select Month and Year Method

-(void)monthPickerViewMethod:(NSString*)strText{
    pikerAlert= [[UIAlertView alloc] initWithTitle:@"Please Select" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    pikerAlert.alertViewStyle = UIAlertViewStyleDefault;
    pikerAlert.tag=102;
    //countryCodePickedView
    pickedView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0,250, 150)];
    [pickedView setDataSource: self];
    [pickedView setDelegate: self];
    pickedView.showsSelectionIndicator = YES;
    [pikerAlert setValue:pickedView forKey:@"accessoryView"];
    [pikerAlert show];
    [pickedView reloadAllComponents];
}
- (IBAction)helpAction:(id)sender {

}
- (IBAction)bankAccDebitAction:(UIButton*)sender{
    if (sender.tag == 101 || sender.tag == 102) {
        if (sender.tag == 101) {
            [sender setImage:[UIImage imageNamed:@"circleSelected"] forState:UIControlStateNormal];
            UIButton *buttonWithTag = (UIButton *)[self.allDetailView viewWithTag:102];
            [buttonWithTag setImage:[UIImage imageNamed:@"circle"] forState:UIControlStateNormal];
            self.bankAccountView.hidden=NO;
            self.debitcardView.hidden=YES;
            self.heightBottomConstraint.constant=1113.5;
        }else
        {
            [sender setImage:[UIImage imageNamed:@"circleSelected"] forState:UIControlStateNormal];
            UIButton *buttonWithTag = (UIButton *)[self.allDetailView viewWithTag:101];
            [buttonWithTag setImage:[UIImage imageNamed:@"circle"] forState:UIControlStateNormal];
            self.bankAccountView.hidden=YES;
            self.debitcardView.hidden=NO;
            self.heightBottomConstraint.constant=720;
        }
    }else
        {
          [sender setImage:[UIImage imageNamed:@"circleSelected"] forState:UIControlStateNormal];
          UIButton *buttonWithTag = (UIButton *)[self.allDetailView viewWithTag:101];
          [buttonWithTag setImage:[UIImage imageNamed:@"circle"] forState:UIControlStateNormal];
      }
}
- (IBAction)agreeAction:(id)sender {
    if (check == YES) {
        check = NO;
        [sender setImage:[UIImage imageNamed:@"uncheck"] forState:UIControlStateNormal];
    }else
    {
      check = YES;
      [sender setImage:[UIImage imageNamed:@"checkbox"] forState:UIControlStateNormal];
    }
}
- (IBAction)upadateAccountAction:(id)sender {
}
- (IBAction)selectTypeAction:(id)sender {
    checkcardType=YES;
    checkMonth=NO;
    [self monthPickerViewMethod:@"Select Card Type"];
}
- (IBAction)selctMonthAction:(id)sender {
    checkMonth=NO;
    checkcardType=NO;
    [self monthPickerViewMethod:@"Select Month"];
}
- (IBAction)selectYearAction:(id)sender {
    checkMonth=YES;
    checkcardType=NO;
    [self monthPickerViewMethod:@"Select Year"];
}
- (IBAction)whatisThisAction:(id)sender {
    
}

@end
