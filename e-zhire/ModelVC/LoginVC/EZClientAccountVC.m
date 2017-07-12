//
//  EZClientAccountVC.m
//  e-zhire
//
//  Created by Developer on 27/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZClientAccountVC.h"
#import "EZPaymentinformationCell.h"
#import "EZEditPaymentcell.h"
#import "EZworkorderVC.h"

@interface EZClientAccountVC ()
{
    NSDictionary*clientInfo;
    BOOL checkPassword;
    NSString*userId;
    NSMutableArray*workOrderArr;
}
@end

@implementation EZClientAccountVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.editInfoView.hidden=YES;
    self.paymentInfo=[[NSMutableArray alloc]init];
    userId=[EZCommonMethod getUserId];
    NSLog(@"user id %@",userId);
//
//    if (self.addLabel2.text==nil) {
//        self.add2ConstraintHeight.constant=0;
//    }else{
//         self.add2ConstraintHeight.constant=30;
//    }
    [self PostApiMethod];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)workOrderApi{
    
    bool check=[EZCommonMethod checkInternetConnection];
    if(!check){
        [EZCommonMethod showAlert:nil message:@"Please check your internet connection"];
        return;
    }
    NSString*urlStr=[NSString stringWithFormat:@"%@%@",BaseUrl,workOrder_Api];
    NSDictionary*parameter=@{@"user_id":userId};

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
            
            EZworkorderVC*viewcontroller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZworkorderVC"];
            viewcontroller.orderDetailArr=workOrderArr;
            [self.navigationController pushViewController:viewcontroller animated:YES];
            
        }
        else{
            [EZCommonMethod showAlert:nil message:@"No Work Orders Found!"];
        }
        
    } onError:^(NSError *Error) {
        NSLog(@"%@:",Error);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
}
- (IBAction)closePopupAction:(id)sender {
    self.editInfoView.hidden=YES;
    self.scrollView.userInteractionEnabled=YES;
}
- (IBAction)invoiceAction:(id)sender {
    UIViewController*viewcontroller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZInvoicesVC"];
    [self.navigationController pushViewController:viewcontroller animated:YES];
}
- (IBAction)saveChangesAction:(id)sender {
    if (self.currentPassTextFiled.text.length>0) {
             if (self.newpass.text.length>0) {
                 if (self.reTypeTextFiled.text.length>0) {
                      if ([self.newpass.text isEqualToString:self.reTypeTextFiled.text]){
                           [self PostChangePasswordApi];
                      }
                      else{
                          [EZCommonMethod showAlert:nil message:@"Please enter valid retype"];
                      }
                 }
                 else{
                     [EZCommonMethod showAlert:nil message:@"Please enter retype password"];
                 }
             }
             else{
                 [EZCommonMethod showAlert:nil message:@"Please enter new password"];
             }
        }
    else{
        [EZCommonMethod showAlert:nil message:@"Please enter current password"];
    }
}
- (IBAction)suggestnewPaswordAction:(id)sender {
    
}
-(void)PostChangePasswordApi{
    
    bool check=[EZCommonMethod checkInternetConnection];
    if(!check){
        [EZCommonMethod showAlert:nil message:@"Please check your internet connection"];
        return;
    }
    NSString*urlStr=[NSString stringWithFormat:@"%@%@",BaseUrl,changePwd_Api];
    NSDictionary*parameter=@{@"user_id":userId,@"currentPWD":self.currentPassTextFiled.text,@"newPWD1":self.newpass.text};
  
       [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[NetworkManager Instance]postRequestWithUrl:urlStr parameter:parameter onCompletion:^(id dict) {
        NSLog(@"%@",dict);
        NSError* error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:dict
                                                             options:kNilOptions
                                                               error:&error];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        if([[json valueForKey:@"success"] boolValue]==0)
        {

            [EZCommonMethod showAlert:nil message:@"Password Updated Successfully!"];
            self.loginPasswordLabel.text=self.reTypeTextFiled.text;
            self.currentPassTextFiled.text=nil;
            self.newpass.text=nil;
            self.reTypeTextFiled.text=nil;
        }
        else{
            [EZCommonMethod showAlert:nil message:@"Please check your password!"];
        }
        
    } onError:^(NSError *Error) {
        NSLog(@"%@:",Error);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];

}
- (IBAction)editClinetInfoACtion:(UIButton*)sender {
    [self.view addSubview:self.editInfoView];
    CGRect size=self.editInfoView.bounds;
    size.origin.y=50;
    size.origin.x=35;
    self.editInfoView.frame=size;
    if (sender.selected==NO) {
        sender.selected=YES;
         self.editInfoView.hidden=NO;
        self.scrollView.userInteractionEnabled=NO;
    }else{
        sender.selected=NO;
        self.editInfoView.hidden=YES;
        self.scrollView.userInteractionEnabled=YES;
    }
}
#pragma mark- TableView DataSource and Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.paymentInfo.count;
}
-(void) tableView:(UITableView *)tableView willDisplayCell:(EZEditPaymentcell *) cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == [tableView numberOfRowsInSection:indexPath.section] - 1) {
        
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EZEditPaymentcell *cell=[tableView dequeueReusableCellWithIdentifier:@"EZEditPaymentcell"];
    if (cell==nil) {
        EZEditPaymentcell *cell=[tableView dequeueReusableCellWithIdentifier:@"EZEditPaymentcell"];
        cell.editPayment.tag=indexPath.row;
        [cell.editPayment addTarget:self action:@selector(editPaymentActionCell:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }
    static NSString *MyIdentifier = @"EZPaymentinformationCell";
    EZPaymentinformationCell *infoCell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    infoCell.accountDetailLabel.text=[self.paymentInfo objectAtIndex:indexPath.item];
    
    return infoCell;
}

-(IBAction)editPaymentActionCell:(id)sender{
  UIViewController*controller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZEditPaymentInformationVc"];
    
    [self.navigationController pushViewController:controller animated:YES];
}
- (IBAction)editClientInfoAction:(id)sender {
}
- (IBAction)updateAction:(id)sender {
}
#pragma mark- API implementation

-(void)PostApiMethod{
    bool check=[EZCommonMethod checkInternetConnection];
    if(!check){
        [EZCommonMethod showAlert:nil message:@"Please check your internet connection"];
        return;
    }
    NSString*urlStr=[NSString stringWithFormat:@"%@%@",BaseUrl,myAccount_Api];
    NSDictionary*parameter=@{@"user_id":userId};
     [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[NetworkManager Instance]postRequestWithUrl:urlStr parameter:parameter onCompletion:^(id dict) {
        NSLog(@"%@",dict);
        NSError* error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:dict
                                                             options:kNilOptions
                                                               error:&error];
        
        if ([[json valueForKey:@"success"] boolValue]==1) {
                    clientInfo = [json objectForKey:@"client_info"];
                    self.paymentInfo = [json objectForKey:@"payment_info"];
                    self.nameLabel.text=[clientInfo valueForKey:@"name"];
                     self.address1Label.text=[clientInfo valueForKey:@"street_address1"];
                    self.addLabel2.text=[clientInfo valueForKey:@""];
                      self.add2ConstraintHeight.constant=0;
//                   if (!self.address1Label.text==nil) {
//                       self.add2ConstraintHeight.constant=0;
//                   }else{
//                     self.add2ConstraintHeight.constant=30;
//                   }
                    self.ZipCodeLabel.text=[clientInfo valueForKey:@"city"];
                    self.clientIdLabel.text=[clientInfo valueForKey:@"client_id"];
                    self.clienySinceLabel.text=[clientInfo valueForKey:@"client_since"];
                    self.mobilePhoneLabel.text=[clientInfo valueForKey:@"mobile"];
                    self.otherPhoneLabel.text=[clientInfo valueForKey:@"other_phone"];
                    self.personalEmailLabel.text=[clientInfo valueForKey:@"personal_email_id"];
                    self.userNameLabel.text=[clientInfo valueForKey:@"login_user_name"];
                    self.loginPasswordLabel.text=[clientInfo valueForKey:@"password"];
                    [self.detailTableView reloadData];
                  [MBProgressHUD hideHUDForView:self.view animated:YES];
                }
            else{
            [EZCommonMethod showAlert:nil message:@"Please check your email and password!"];
        }
        
    } onError:^(NSError *Error) {
        NSLog(@"%@:",Error);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
}



@end
