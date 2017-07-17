//
//  EZEditPaymentInformationVc.m
//  e-zhire
//
//  Created by Developer on 29/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZEditPaymentInformationVc.h"
#import "EditPaymentCell.h"
@interface EZEditPaymentInformationVc ()
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

@implementation EZEditPaymentInformationVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    monthArr=[NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12", nil];
    yearArr=[NSArray arrayWithObjects:@"2017",@"2018",@"2019",@"2020",@"2021",@"2022",@"2023",@"2024",@"2025",@"2026",@"2027" ,@"2028" ,@"2029",@"2030",@"2031",@"2032",nil];
    cardTypeArr=[NSArray arrayWithObjects:@"Visa",@"Master Card",@"Discover",@"American Express", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- TableView DataSource and Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"EditPaymentCell";
    EditPaymentCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
//    cell.viewDetailAction.tag=indexPath.row;
//    cell.disputBtn.tag=indexPath.row;
//    [cell.viewDetailAction addTarget:self action:@selector(yourButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
//    [cell.disputBtn addTarget:self action:@selector(disputBtnClicked:) forControlEvents:UIControlEventTouchUpInside];

    return cell;
}
- (IBAction)selectMonthAction:(id)sender {
    checkMonth=NO;
    checkcardType=NO;
    [self monthPickerViewMethod:@"Select Month"];

}
- (IBAction)selectYearAction:(id)sender{
    checkMonth=YES;
    checkcardType=NO;
    [self monthPickerViewMethod:@"Select Year"];
}
- (IBAction)addAnotherAction:(id)sender {
    
}
- (IBAction)changeDefaultAction:(id)sender {
    
}
- (IBAction)saveDetailAction:(id)sender {
    
}

- (IBAction)selectCardTypeAction:(id)sender {
    checkcardType=YES;
    checkMonth=NO;
    [self monthPickerViewMethod:@"Select Card Type"];
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
        self.cardTypeLbl.text=[cardTypeArr objectAtIndex:row];
    }
    else{
        self.selectMonthLbl.text=[monthArr objectAtIndex:row];
    }
}
#pragma make Select Month and Year Method

-(void)monthPickerViewMethod:(NSString*)strText{
    pikerAlert= [[UIAlertView alloc] initWithTitle:@"Please Select" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    pikerAlert.alertViewStyle = UIAlertViewStyleDefault;
    pikerAlert.tag=102;
    //countryCodePickedView
    pickedView=[[UIPickerView alloc]init];
//    pickedView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0,250, 150)];
    [pickedView setDataSource: self];
    [pickedView setDelegate: self];
    pickedView.showsSelectionIndicator = YES;
    [pikerAlert setValue:pickedView forKey:@"accessoryView"];
    [pikerAlert show];
    [pickedView reloadAllComponents];
}
@end
