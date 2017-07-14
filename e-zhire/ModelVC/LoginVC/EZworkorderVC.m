//
//  EZworkorderVC.m
//  e-zhire
//
//  Created by Developer on 27/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZworkorderVC.h"
#import "EZOrderCell.h"
#import "EZWorkViewVC.h"
@interface EZworkorderVC ()
{
    NSMutableArray*workOrderArr;
    NSString*workOrderId;
    BOOL CheckSearch;
}
@end

@implementation EZworkorderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self workOrderApi];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark- TableView DataSource and Delegate

-(void)workOrderApi{
    
    bool check=[EZCommonMethod checkInternetConnection];
    if(!check){
        [EZCommonMethod showAlert:nil message:@"Please check your internet connection"];
        return;
    }
    NSString*urlStr;
    NSDictionary*parameter;
    
    if (CheckSearch) {
        urlStr=[NSString stringWithFormat:@"%@%@",BaseUrl,workOrderSearchApi];
       parameter=@{@"workOrder":self.workOrderNoTextFiled.text,@"userId":_sendUserId,};
    }
    else{
        urlStr=[NSString stringWithFormat:@"%@%@",BaseUrl,workOrder_Api];
        parameter=@{@"user_id":_sendUserId};
    }
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[NetworkManager Instance]postRequestWithUrl:urlStr parameter:parameter onCompletion:^(id dict) {
        NSLog(@"%@",dict);
        NSError* error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:dict
                                                             options:kNilOptions
                                                               error:&error];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        if ([[json valueForKey:@"success"] boolValue]==1) {
             workOrderArr=[json valueForKey:@"value"];
            NSDictionary*orderId=[workOrderArr objectAtIndex:0];
            workOrderId=[orderId valueForKey:@"work_order_id"];

             if ([workOrderArr count] > 0) {
                  [self.workOrderTableView reloadData];
                 
            }
        }
        else{
            [self showUIAlertControllerWithTitle:@"No Work Orders Found!"];
        }
        
    } onError:^(NSError *Error) {
        NSLog(@"%@:",Error);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField == self.workOrderNoTextFiled)
    {
        return NO;
    }
    else
        return YES;
}
-(void)showUIAlertControllerWithTitle:(NSString*)Title{
    
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:nil
                                  message:Title
                                  preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                            [self.navigationController popViewControllerAnimated:YES];
                            [alert dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return workOrderArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"EZOrderCell";
    EZOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    cell.viewOrderBtn.tag=indexPath.row;
    [cell.viewOrderBtn addTarget:self action:@selector(viewOrderClicked:) forControlEvents:UIControlEventTouchUpInside];
     cell.workorderLbl.text=[[workOrderArr objectAtIndex:indexPath.row]valueForKey:@"work_order"];
     cell.serviceTypeLbl.text=[[workOrderArr objectAtIndex:indexPath.row]valueForKey:@"service_type"];
     cell.dateSechduleLbl.text=[[workOrderArr objectAtIndex:indexPath.row]valueForKey:@"schedule_service_date"];
     cell.statrTimeLbl.text=[[workOrderArr objectAtIndex:indexPath.row]valueForKey:@"schedule_start_time"];
     cell.clientNameLbl.text=[[workOrderArr objectAtIndex:indexPath.row]valueForKey:@"client"];
     cell.associate.text=[[workOrderArr objectAtIndex:indexPath.row]valueForKey:@"type_value"];
    
    return cell;
}
-(IBAction)viewOrderClicked:(id)sender{
    EZWorkViewVC*controller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZWorkViewVC"];
    controller.work_ordeId=workOrderId;
    [self.navigationController pushViewController:controller animated:YES];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
 }
- (IBAction)searchAction:(id)sender {
    CheckSearch=YES;
    [self workOrderApi];
}

@end
