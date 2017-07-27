//
//  EZInvoicesVC.m
//  e-zhire
//
//  Created by Developer on 27/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZInvoicesVC.h"
#import "InvoicesCell.h"
#import "EZInvoicesDetail.h"

@interface EZInvoicesVC ()
{
   NSMutableArray*inVoiceArr;
    NSString*invoceId;
}
@end

@implementation EZInvoicesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self invoiceApi];
     [self.menuContainerViewController setPanMode:MFSideMenuPanModeNone];
    NSLog(@"%@",_getPaymentArr);
    NSLog(@"%@",_userId);
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
    
    return inVoiceArr.count+1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"InvoicesCell";
    InvoicesCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (indexPath.row==0) {
        cell.inVoiceIdLbl.text=@"INVOICE #";
        cell.cellPricelbl.text=@"TOTAL BILLED";
        cell.cellDateLbl.text=@"DUE DATE";
        cell.disputLbl.text=@"STATUS";
        cell.cellViewInvoiceLbl.text=@"";
        [cell contentView].backgroundColor=[UIColor lightGrayColor];
    }
    else{
      cell.cellViewInvoiceLbl.text=@"View Invoice";
      cell.disputLbl.text=[[inVoiceArr objectAtIndex:indexPath.row-1]valueForKey:@"status"];
      cell.cellDateLbl.text=[[inVoiceArr objectAtIndex:indexPath.row-1]valueForKey:@"due_date"];
      cell.cellPricelbl.text=[[inVoiceArr objectAtIndex:indexPath.row-1]valueForKey:@"total_billed"];
        invoceId=[[inVoiceArr objectAtIndex:indexPath.row-1]valueForKey:@"invoice_id"];
        cell.inVoiceIdLbl.text=invoceId;
      [cell contentView].backgroundColor=[UIColor whiteColor];
  }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row==0) {
        return;
    }
    EZInvoicesDetail*controller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZInvoicesDetail"];
    
    NSString*invoceIdDet =[[inVoiceArr objectAtIndex:indexPath.row-1]valueForKey:@"invoice_id"];
    NSString*codeId=[invoceIdDet substringFromIndex:[invoceId length]-2];
    controller.detailInvoiceId=codeId;
    controller.invoiceUserId=_userId;
    controller.invoicePaymentArr=_getPaymentArr;
    [self.navigationController pushViewController:controller animated:YES];
    
}
#pragma mark-invoice Api
-(void)invoiceApi{
    
    bool check=[EZCommonMethod checkInternetConnection];
    if(!check){
        [EZCommonMethod showAlert:nil message:@"Please check your internet connection"];
        return;
    }
    NSString*urlStr=[NSString stringWithFormat:@"%@%@",BaseUrl,inVoice_Api];
    NSDictionary*parameter=@{@"userId":_userId};
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
            inVoiceArr=[json valueForKey:@"value"];
            [self.invoiceTableVIew reloadData];
        }
        else{
            [EZCommonMethod showAlert:nil message:@"No invoice found"];
        }
        
    } onError:^(NSError *Error) {
        NSLog(@"%@:",Error);
        [EZCommonMethod showAlert:nil message:@"please try again"];
        [self invoiceApi];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
}

@end
