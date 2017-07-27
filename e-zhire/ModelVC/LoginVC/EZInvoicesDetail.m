//
//  EZInvoicesDetail.m
//  e-zhire
//
//  Created by Developer on 27/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZInvoicesDetail.h"
#import "InvoiceDetailCell.h"
#import "InvoiceAddressCell.h"
#import "EZEditPaymentInformationVc.h"
#import "ViewDetailcell.h"
#import "viewDetailModel.h"
#import "View.h"
#import "EditPaymentCell.h"

@interface EZInvoicesDetail ()
{
    NSDictionary*billingAdd;
    NSMutableArray*detailsArry;
    NSDictionary*serviceAddress;
    NSDictionary*invoice;
    NSString*total_billed;
    NSString*due_date;
    NSString *inVoiceDetailstr;
    NSMutableArray*viewDetailArr;
    viewDetailModel*objget;
    UITextView *textView;
}
@end
@implementation EZInvoicesDetail
@synthesize seletedIndex;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    seletedIndex = -1;
    self.tableView.tableHeaderView=self.adddresView;
    self.disputView.hidden=YES;
    [self.menuContainerViewController setPanMode:MFSideMenuPanModeNone];
    NSLog(@"%@",_detailInvoiceId);
    [self postInvoiveDetailApi];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark- TableView DataSource and Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return viewDetailArr.count+1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section==0) {
        return 1;
        
    }else{
        viewDetailModel*obj=[viewDetailArr objectAtIndex:section-1];
        if (obj.logid!=nil) {
            return 1;
        }else{
            return 1;
        }
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (self.tableView==tableView)
    {
        if (section==0) {
            return 0;
        }
        return 75;
    }
    return 75;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section==0) {
        return nil;
    }
    else{

        View *firstViewUIView = [[[NSBundle mainBundle] loadNibNamed:@"View" owner:self options:nil] firstObject];
        viewDetailModel*obj=[viewDetailArr objectAtIndex:section-1];
        firstViewUIView.associateLbl.text=obj.associateInvoice;
        firstViewUIView.dateLbl.text=obj.date;
        firstViewUIView.eventLbl.text=obj.event;
        firstViewUIView.hourWorkLbl.text=obj.hour_worked;
        firstViewUIView.pricePerHoreLbl.text=[@"$"stringByAppendingString:obj.price_per_hour];
        firstViewUIView.serviceLbl.text=obj.service;
        firstViewUIView.totalCostLbl.text=[@"$"stringByAppendingString:obj.total_cost];
        return firstViewUIView;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        InvoiceAddressCell *cell=[tableView dequeueReusableCellWithIdentifier:@"headerCell"];
        cell.selectPaymentBtn.tag=indexPath.row;
        [cell.selectPaymentBtn addTarget:self action:@selector(selectPaymentAction:) forControlEvents:UIControlEventTouchUpInside];
        NSString *strBill=[NSString stringWithFormat:@"%@\n %@\n %@\n %@\n",[billingAdd valueForKey:@"client_name"],[billingAdd valueForKey:@"bill_address"],[billingAdd valueForKey:@"city"],[billingAdd valueForKey:@"phone"]];
        cell.billingAddLbl.text=strBill;
        NSString *serviceAddressStr=[NSString stringWithFormat:@"%@\n %@\n %@\n %@\n",[serviceAddress valueForKey:@"client_name"],[serviceAddress valueForKey:@"bill_address"],[serviceAddress valueForKey:@"city"],[serviceAddress valueForKey:@"phone"]];
        cell.serviceAddLbl.text=serviceAddressStr;
        cell.invoiceAddLbl.text=inVoiceDetailstr;
        NSString *ezHire=[NSString stringWithFormat:@"%@\n %@\n %@\n",@"848 N.Rainbow Blvd,#732",@"Las Vegas,NV 89107",@"(800) 514-5234"];
        cell.ezHireAddressLbl.text=ezHire;
        
        viewDetailModel*obj=[viewDetailArr objectAtIndex:indexPath.row];
        if (obj.logid!=nil) {
            cell.selectPaymentBtn.hidden=NO;
        }else{
            cell.selectPaymentBtn.hidden=YES;
        }
        return cell;
        
    }else{
        static NSString *MyIdentifier = @"cell";
        InvoiceDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        viewDetailModel*obj=[viewDetailArr objectAtIndex:indexPath.section-1];
        if (obj.logid!=nil) {
            cell.viewDetailConstraintHeight.constant=45;
        }else{
            cell.viewDetailConstraintHeight.constant=0;
        }
        cell.disputBtn.tag=indexPath.row;
        [cell.disputBtn addTarget:self action:@selector(disputBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        //viewDetailModel*obj=[viewDetailArr objectAtIndex:indexPath.section-1];
        cell.cellWorkOrderId.text=obj.workOrder;
        cell.cellAssociateId.text=obj.associate;
        cell.startTime.text=obj.start;
        cell.endTime.text=obj.end;
        cell.dueDateLbl.text=due_date;
        cell.totalBilled.text=[@"$"stringByAppendingString:total_billed];
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return  310;
    }
        else{
            viewDetailModel*obj=[viewDetailArr objectAtIndex:indexPath.section-1];
            if (obj.logid!=nil) {
                return 100;
            }else{
                return 50;
            }
        }
    return 100;
}
-(IBAction)selectPaymentAction:(id)sender{
    EZEditPaymentInformationVc*controller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZEditPaymentInformationVc"];
    controller.userIdStr=_invoiceUserId;
    controller.getPaymentArr=_invoicePaymentArr;
    [self.navigationController pushViewController:controller animated:YES];
}
- (IBAction)disputBtnClicked:(UIButton*)sender {
    
    objget=[viewDetailArr objectAtIndex:sender.tag];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Please Describe why you are Disputing this Event:"
                                                        message:@""
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"Done", nil];
    textView = [UITextView new];
    [alertView setValue:textView forKey:@"accessoryView"];
    [alertView show];
    
}
#pragma mark-AlertView button index

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        NSLog(@"Clicked button index 0");
        
    } else {
        [self disputApi];
        NSLog(@"Clicked button index other than 0");
    }
}
#pragma mark-Disput APi Method

-(void)disputApi{
    
    bool check=[EZCommonMethod checkInternetConnection];
    if(!check){
        [EZCommonMethod showAlert:nil message:@"Please check your internet connection"];
        return;
    }
    NSString*assoviateId=objget.associate;
    NSString*event_id=objget.event;
    NSString*hr_rate=objget.price_per_hour;
    NSString*log_id=objget.logid;
    NSString*logtime=[NSString stringWithFormat:@"%d",[objget.end intValue]-[objget.start intValue]];
    NSString*urlStr=[NSString stringWithFormat:@"%@%@",BaseUrl,addDispute_Api];
 NSDictionary*parameter=@{@"associate_id":assoviateId,@"comment":textView.text,@"invoice_id":_detailInvoiceId,@"event_id":event_id,@"hr_rate":hr_rate,@"log_id":log_id,@"logtime":logtime};

    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[NetworkManager Instance]postRequestWithUrl:urlStr parameter:parameter onCompletion:^(id dict) {
        NSLog(@"%@",dict);
        NSError* error;
        NSDictionary* json =[NSJSONSerialization JSONObjectWithData:dict
                                                            options:kNilOptions error:&error];
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        if ([[json valueForKey:@"success"] boolValue]==1) {
            [EZCommonMethod showAlert:nil message:@"Dispute added successfully"];
            [self.tableView reloadData];
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
        }else{
            [EZCommonMethod showAlert:nil message:@"please check server issuse"];
        }
        
    } onError:^(NSError *Error) {
        NSLog(@"%@:",Error);
        [EZCommonMethod showAlert:nil message:@"please try again"];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
}
- (IBAction)viewDetailAction:(UIButton*)sender {
    if (sender.tag==seletedIndex) {
        seletedIndex=-1;
    }else{
        self.seletedIndex=sender.tag;
    }
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
}
#pragma mark-ApiMethod

-(void)postInvoiveDetailApi{
    
    bool check=[EZCommonMethod checkInternetConnection];
    if(!check){
        [EZCommonMethod showAlert:nil message:@"Please check your internet connection"];
        return;
    }
    NSString*urlStr=[NSString stringWithFormat:@"%@%@",BaseUrl,viewInvoice_Api];
    NSDictionary*parameter=@{@"auto_inv":_detailInvoiceId};
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[NetworkManager Instance]postRequestWithUrl:urlStr parameter:parameter onCompletion:^(id dict) {
        NSLog(@"%@",dict);
        NSError* error;
        NSDictionary* json =[NSJSONSerialization JSONObjectWithData:dict
                                                            options:kNilOptions error:&error];
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        if ([[json valueForKey:@"success"] boolValue]==1) {
            total_billed =[json valueForKey:@"total_billed"];
            due_date =[json valueForKey:@"due_date"];
            billingAdd =[json valueForKey:@"billingAddress"];
            serviceAddress =[json valueForKey:@"serviceAddress"];
            invoice =[json valueForKey:@"invoice"];
            viewDetailArr=[viewDetailModel arrayOfModelsFromDictionaries:[json valueForKey:@"value"] error:&error];
            inVoiceDetailstr=[NSString stringWithFormat:@"%@\n%@\n%@\n",[@"Invoice:"stringByAppendingString:[invoice valueForKey:@"invoiceId"]],[@"Invoice Date:"stringByAppendingString:[invoice valueForKey:@"invoiceDate"]],[@"Due Date:"stringByAppendingString:[invoice valueForKey:@"dueDate"]]];
            [self.tableView reloadData];
            
        }else{
            [EZCommonMethod showAlert:nil message:@"please check server issuse"];
        }
        
    } onError:^(NSError *Error) {
        NSLog(@"%@:",Error);
        [self postInvoiveDetailApi];
        [EZCommonMethod showAlert:nil message:@"please wait"];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
    
}
@end
