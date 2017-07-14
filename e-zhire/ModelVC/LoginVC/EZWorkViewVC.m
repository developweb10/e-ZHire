//
//  EZWorkViewVC.m
//  e-zhire
//
//  Created by Developer on 28/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZWorkViewVC.h"

@interface EZWorkViewVC ()

@end

@implementation EZWorkViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.ratingView.hidden=YES;
    NSLog(@"%@",self.work_ordeId);
    [self viewWorkOrderPostApi];
    
}

- (IBAction)cancelACtion:(id)sender {
}
- (IBAction)sendAction:(id)sender {
    
}
-(void)viewWorkOrderPostApi{
    bool check=[EZCommonMethod checkInternetConnection];
    if(!check){
        [EZCommonMethod showAlert:nil message:@"Please check your internet connection"];
        return;
    }
    NSString*urlStr=[NSString stringWithFormat:@"%@%@",BaseUrl,clientViewWorkOrderApi];
    NSDictionary*parameter=@{@"work_order_id":self.work_ordeId};
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[NetworkManager Instance]postRequestWithUrl:urlStr parameter:parameter onCompletion:^(id dict) {
        NSLog(@"%@",dict);
        NSError* error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:dict
                                                             options:kNilOptions
                                                               error:&error];

        if ([[json valueForKey:@"success"] boolValue]==1) {
            NSDictionary*valueDict=[json valueForKey:@"values"];
            NSDictionary*clientInfomationDict=[[NSDictionary alloc]init];
            NSDictionary*otherInformation=[[NSDictionary alloc]init];
            NSDictionary*recurringService_dates=[[NSDictionary alloc]init];
            NSDictionary*serviceaddress=[[NSDictionary alloc]init];
            NSDictionary*accountAddress=[[NSDictionary alloc]init];
            NSDictionary*associateInformation=[[NSDictionary alloc]init];
            clientInfomationDict=[valueDict valueForKey:@"client_information"];
            otherInformation=[valueDict valueForKey:@"other_information"];
            recurringService_dates=[valueDict valueForKey:@"recurring_service_dates"];
            serviceaddress=[valueDict valueForKey:@"service_address"];
            accountAddress=[valueDict valueForKey:@"account_address"];
            associateInformation=[valueDict valueForKey:@"associate_Information"];
            
            self.accountLabel.text=[clientInfomationDict valueForKey:@"account"];
            self.accountEmailLabel.text=[clientInfomationDict valueForKey:@"email"];
            self.phoneNoLabel.text=[clientInfomationDict valueForKey:@"mobile_phone"];
            self.nameLabel.text=[clientInfomationDict valueForKey:@"name"];
            self.otherPhoneLabel.text=[clientInfomationDict valueForKey:@"other_Phone"];
            // Account address//
            self.addStreet1.text=[accountAddress valueForKey:@"address"];
            self.accountAddCity.text=[accountAddress valueForKey:@"city"];
            
            // Service address//
            self.seriveAddName.text=[serviceaddress valueForKey:@"address"];
            self.seriveAddCity.text=[serviceaddress valueForKey:@"city"];
            // Other Information //
            self.workOrderIdLabel.text=[otherInformation valueForKey:@"work_order"];
            self.serviceTypeLabel.text=[otherInformation valueForKey:@"service_type"];
            self.orderDateLabel.text=[otherInformation valueForKey:@"order_Submited"];
            // Associate Information //
            self.teamLabel.text=[associateInformation valueForKey:@"Associate"];
            self.cellPhoneLabel.text=[associateInformation valueForKey:@"CellPhone"];
            self.teamEmailLabel.text=[associateInformation valueForKey:@"Email"];
            self.teamNameLabel.text=[associateInformation valueForKey:@"Name"];
            self.priceLabel.text=[associateInformation valueForKey:@"PriceHr"];
            self.priceLabel.text=[associateInformation valueForKey:@"PriceHr"];
            NSString *string64 =[associateInformation valueForKey:@"profile"];
            NSURL *url = [NSURL URLWithString:string64];
            NSData *imageData = [NSData dataWithContentsOfURL:url];
            UIImage *ret = [UIImage imageWithData:imageData];
            self.clientPfofileImg.image=ret;
            // Recurring Service Dates //
            self.clientDateLabel.text=[recurringService_dates valueForKey:@"Date"];
            self.clientstartTimeLabel.text=[recurringService_dates valueForKey:@"StartTime"];
            self.estimateHourLabel.text=[recurringService_dates valueForKey:@"EstimatedHourNeeded"];

            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }
      
    } onError:^(NSError *Error) {
        NSLog(@"%@:",Error);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
}
@end
