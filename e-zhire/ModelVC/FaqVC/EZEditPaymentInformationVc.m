//
//  EZEditPaymentInformationVc.m
//  e-zhire
//
//  Created by Developer on 29/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZEditPaymentInformationVc.h"
#import "EditPaymentCell.h"
#import "EditpaymentJsonModel.h"

@interface EZEditPaymentInformationVc ()
{
    BOOL check;
    NSArray*monthArr;
    NSArray*yearArr;
    NSArray*cardTypeArr;
    BOOL checkMonth;
    BOOL checkcardType;
    BOOL checkDefault;
    UIAlertView*pikerAlert;
    UIPickerView *pickedView;
    NSMutableArray*paymentDetailArr;
    NSMutableArray *cellDetailArr;
    NSString*cardDetName;
    NSString*cardDetNo;
    NSString *expirDetStr;
    NSString*deleteId;
    EditpaymentJsonModel*objEdit;
    NSInteger selectedTag;
    NSInteger deleteTag;
    BOOL checkAdd;
    EditpaymentJsonModel*objDelete;
}
@end

@implementation EZEditPaymentInformationVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    monthArr=[NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12", nil];
    yearArr=[NSArray arrayWithObjects:@"2017",@"2018",@"2019",@"2020",@"2021",@"2022",@"2023",@"2024",@"2025",@"2026",@"2027" ,@"2028" ,@"2029",@"2030",@"2031",@"2032",nil];
    cardTypeArr=[NSArray arrayWithObjects:@"Visa",@"Master Card",@"Discover",@"American Express", nil];
    [self.menuContainerViewController setPanMode:MFSideMenuPanModeNone];
    NSLog(@"%@",_userIdStr);
    NSLog(@"%@",_getPaymentArr);
    paymentDetailArr=[[NSMutableArray alloc]init];
    cellDetailArr=[[NSMutableArray alloc]init];
    self.creditView.hidden=YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)editPaymentAccountApi{
    bool checkNet=[EZCommonMethod checkInternetConnection];
    if(!checkNet){
        [EZCommonMethod showAlert:nil message:@"Please check your internet connection"];
        return;
    }
    NSString*urlStr;
    NSDictionary*parameter;
    NSString*selectMonth=self.selectMonthLbl.text;
    NSString*selectYear=self.selectYearLbl.text;
    NSMutableArray *myStrings = [[NSMutableArray alloc] initWithObjects:selectMonth, selectYear,nil];
    NSString *selectExpir = [myStrings componentsJoinedByString:@"/"];
    if (checkAdd) {
        urlStr=[NSString stringWithFormat:@"%@%@",BaseUrl,saveCreditdetails_Api];
        parameter=@{@"cardname":self.cardNameTextField.text,@"cardtype":self.cardTypeLbl.text,@"expiry":selectExpir,@"cvv":self.cvvTextField.text,@"clientid":_userIdStr,@"cardno":self.cardNumberTextField.text};
        
        //        {"cardname":"Test Again","cardtype":"visa","expiry":"8/2019","cvv":"123","clientid":"1178","cardno":"4929000000014"}
        
    }else{
        urlStr=[NSString stringWithFormat:@"%@%@",BaseUrl,editPaymentAcc_Api];
        parameter=@{@"clientid":_userIdStr,@"id":_paymentIdStr,@"expiry":selectExpir,@"cardno":self.cardNumberTextField.text,@"cardname":self.cardNameTextField.text,@"cardtype":self.cardTypeLbl.text,@"cvv":self.cvvTextField.text};
    }
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[NetworkManager Instance]postRequestWithUrl:urlStr parameter:parameter onCompletion:^(id dict) {
        NSLog(@"%@",dict);
        NSError* error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:dict
                                                             options:kNilOptions
                                                               error:&error];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        if([[json valueForKey:@"success"] boolValue]==1)
        {
            if (checkAdd) {
                EditpaymentJsonModel*addInfo=[EditpaymentJsonModel new];
                addInfo.name=self.cardTypeLbl.text;
                addInfo.account=self.cardNumberTextField.text;
                NSString*selectDetMonth=self.selectMonthLbl.text;
                NSString*selectDetYear=self.selectYearLbl.text;
                NSMutableArray *myStrings = [[NSMutableArray alloc] initWithObjects:selectDetMonth, selectDetYear,nil];
                expirDetStr = [myStrings componentsJoinedByString:@"/"];
                addInfo.expiry=expirDetStr;
                [_getPaymentArr addObject:addInfo];
                [self.delegate reloadDataWithArray:_getPaymentArr];
                [self.editPaymentTableView reloadData];
                [self.navigationController popViewControllerAnimated:YES];
                
            }else{
                objEdit.name=self.cardTypeLbl.text;
                objEdit.account=self.cardNumberTextField.text;
                objEdit.expiry=selectExpir;
                [_getPaymentArr replaceObjectAtIndex:selectedTag withObject:objEdit];
                objEdit=nil;
                selectedTag=-1;
                self.cardTypeLbl.text=nil;
                self.cardNumberTextField.text=nil;
                self.cardNameTextField.text=nil;
                self.selectMonthLbl.text=nil;
                self.selectYearLbl.text=nil;
                self.cvvTextField.text=nil;
                [self.delegate reloadDataWithArray:_getPaymentArr];
                [self.editPaymentTableView reloadData];
                [EZCommonMethod showAlert:nil message:@"payment successfully updated"];
                [self.navigationController popViewControllerAnimated:YES];
            }
        }
        else{
            [EZCommonMethod showAlert:nil message:@"Please enter valid card details"];
        }
    } onError:^(NSError *Error) {
        NSLog(@"%@:",Error);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
}
#pragma mark- TableView DataSource and Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _getPaymentArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"EditPaymentCell";
    EditPaymentCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    EditpaymentJsonModel*obj=[_getPaymentArr objectAtIndex:indexPath.row];
    cell.visaCradNameLbl.text=obj.name;
    cell.cardNumberLbl.text=obj.account;
    cell.expireDateLbl.text=obj.expiry;
    _paymentIdStr=obj.id;
    cell.deleteBtn.tag=indexPath.row;
    cell.editBtn.tag=indexPath.row;
    [cell.deleteBtn addTarget:self action:@selector(deleteBtn:) forControlEvents:UIControlEventTouchUpInside];
    [cell.editBtn addTarget:self action:@selector(editAction:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
-(IBAction)deleteBtn:(UIButton*)sender{
    deleteTag=sender.tag;
    objDelete=[self.getPaymentArr objectAtIndex:deleteTag];
    //  NSString*selectId=[NSString stringWithFormat:@"_%lu", (unsigned long)indx];
    deleteId=objDelete.id;
    [self deleteApi];
}
-(IBAction)editAction:(UIButton*)sender{
    checkAdd=NO;
    selectedTag=sender.tag;
    [UIView transitionWithView:self.creditView
                      duration:0.5
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        // self.view.backgroundColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.2];
                        self.creditView.hidden=NO;
                        objEdit=[_getPaymentArr objectAtIndex:selectedTag];
                        self.cardTypeLbl.text=objEdit.name;
                        self.cardNumberTextField.text= objEdit.account;
                        NSString *str=objEdit.expiry;
                        NSArray *items = [str componentsSeparatedByString:@"/"];
                        NSString *str1=[items objectAtIndex:0];
                        NSArray *itemStr1 = [str1 componentsSeparatedByString:@"."];
                        NSString *str2=[items objectAtIndex:1];
                        NSString *str3=[itemStr1 objectAtIndex:1];
                        self.selectMonthLbl.text=str3;
                        self.selectYearLbl.text=str2;
                            }
                    completion:NULL];
}
-(void)deleteApi{
    bool checkNet=[EZCommonMethod checkInternetConnection];
    if(!checkNet){
        [EZCommonMethod showAlert:nil message:@"Please check your internet connection"];
        return;
    }
    NSString*urlStr=[NSString stringWithFormat:@"%@%@",BaseUrl,delete_Api];
    NSDictionary*parameter=@{@"del_id":deleteId,@"client_id":_userIdStr};
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[NetworkManager Instance]postRequestWithUrl:urlStr parameter:parameter onCompletion:^(id dict) {
        NSLog(@"%@",dict);
        NSError* error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:dict
                                                             options:kNilOptions
                                                               error:&error];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        if([[json valueForKey:@"success"] boolValue]==1)
        {
            
            [_getPaymentArr removeObjectAtIndex:deleteTag];
            [self.editPaymentTableView reloadData];
            [self.delegate reloadDataWithArray:_getPaymentArr];
            [EZCommonMethod showAlert:nil message:@"Deleted successfull"];
        }
        else{
            [EZCommonMethod showAlert:nil message:@"There is some problem to proceed"];
        }
        
    } onError:^(NSError *Error) {
        NSLog(@"%@:",Error);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
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
    checkAdd=YES;
    [UIView transitionWithView:self.creditView
                      duration:0.5
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                    //  self.view.backgroundColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.2];
                        self.creditView.hidden=NO;
                        self.cardNameTextField.text=nil;
                        self.cardTypeLbl.text=nil;
                        self.cardNumberTextField.text=nil;
                        self.selectMonthLbl.text=nil;
                        self.selectYearLbl.text=nil;
                        self.cvvTextField.text=nil;
                    }
                    completion:NULL];
}
- (IBAction)changeDefaultAction:(UIButton*)sender {
    CGRect size=self.changeDefaultView.bounds;
    size.origin.x=50;
    size.origin.y=130;
    self.changeDefaultView.frame=size;
    [self.view addSubview:self.changeDefaultView];
    self.changeDefaultView.hidden=NO;
    EditpaymentJsonModel*obj=[_getPaymentArr objectAtIndex:sender.tag];
    NSString *titleStr =[NSString stringWithFormat:@"%@ %@ %@",obj.name,obj.account,obj.expiry];
    self.selectDefaultCradLabel.text=titleStr;
}
- (IBAction)saveDetailAction:(id)sender {
    [self editPaymentAccountApi];
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
    else if (checkDefault) {
        return _getPaymentArr.count;
    }
    else{
        return [monthArr count];
    }
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (checkMonth) {
        NSString*yearStr=[yearArr objectAtIndex: row];
        return yearStr;
    }
    else if (checkcardType) {
        NSString*cardTypeStr=[cardTypeArr objectAtIndex: row];
        return cardTypeStr;
    }
    else if (checkDefault) {
        EditpaymentJsonModel *obj=[_getPaymentArr objectAtIndex:row];
        NSString *title =[NSString stringWithFormat:@"%@ %@ %@",obj.name,obj.account,obj.expiry];
        return title;
    }
    else{
        NSString*monthStr=[monthArr objectAtIndex: row];
        return monthStr;
    }
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
    
    if (checkMonth) {
        self.selectYearLbl.text=[yearArr objectAtIndex:row];
    }
    else if (checkcardType) {
        self.cardTypeLbl.text=[cardTypeArr objectAtIndex:row];
    }
    else if (checkDefault) {
        EditpaymentJsonModel*obj=[_getPaymentArr objectAtIndex:row];
        NSString *titleStr =[NSString stringWithFormat:@"%@ %@ %@",obj.name,obj.account,obj.expiry];
        self.selectDefaultCradLabel.text=titleStr;
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
    //pickedView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0,250, 150)];
    [pickedView setDataSource: self];
    [pickedView setDelegate: self];
    pickedView.showsSelectionIndicator = YES;
    [pikerAlert setValue:pickedView forKey:@"accessoryView"];
    [pikerAlert show];
    [pickedView reloadAllComponents];
}
- (IBAction)changeDefaultCloseAction:(id)sender {
    self.changeDefaultView.hidden=YES;
}
- (IBAction)selectDefaultCardAction:(id)sender {
    checkcardType=NO;
    checkMonth=NO;
    checkDefault=YES;
    [self monthPickerViewMethod:@""];
    //  [pickedView reloadAllComponents];
}
- (IBAction)changeDefaultCardAction:(id)sender {
    
    
}
@end
