//
//  EZWorkViewVC.m
//  e-zhire
//
//  Created by Developer on 28/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZWorkViewVC.h"
#import "WorkViewDetailCell.h"

@interface EZWorkViewVC ()
{
    NSMutableArray*discriptionArr;
    BOOL sendCheck;
}
@property (nonatomic) NSInteger totalCell;

@end

@implementation EZWorkViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.ratingView.hidden=YES;
    NSLog(@"%@",self.work_ordeId);
    self.totalCell=0;
    discriptionArr=[[NSMutableArray alloc]init];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    //[self viewWorkOrderPostApi];
    [self viewWorkOrderPostApi];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    [self.menuContainerViewController setPanMode:MFSideMenuPanModeNone];
}
#pragma mark- View Work Order APi Method

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
        NSDictionary* json =[NSJSONSerialization JSONObjectWithData:dict
                                                             options:kNilOptions error:&error];

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
                // Client information //
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
                [self sendMessageApi];
                [MBProgressHUD hideHUDForView:self.view animated:YES];
            }else{
                
         }
        
    } onError:^(NSError *Error) {
        NSLog(@"%@:",Error);
        [EZCommonMethod showAlert:nil message:@"please try again"];
        [self viewWorkOrderPostApi];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
}
#pragma mark- Button Action

- (IBAction)ratinViewCloseAction:(id)sender {
    self.ratingView.hidden=YES;
    self.scrollView.userInteractionEnabled=YES;
}
- (IBAction)cancelACtion:(id)sender {
    
}
- (IBAction)reviewAssociateAction:(id)sender{
    
    CGRect size=self.ratingView.bounds;
    size.origin.x= 35;
    size.origin.y= 10;
    self.ratingView.frame=size;
    [self.view addSubview:self.ratingView];
    self.ratingView.hidden=NO;
    self.scrollView.userInteractionEnabled=NO;
}
- (IBAction)acceptAction:(id)sender{
    
}
- (IBAction)sendAction:(id)sender {
    [self sendMessageApi];
// for (int i=0; i < _totalCell; i++){
// WorkViewDetailCell *theCell = (id)[self.associateTableView cellForRowAtIndexPath:[NSIndexPath  indexPathForRow:i inSection:0]];
//   }
//  self.totalCell+=1;
//  self.tableViewheightConstraint.constant = discriptionArr.count*self.totalCell;
    
}
-(void)sendMessageApi{
    
    bool check=[EZCommonMethod checkInternetConnection];
    if(!check){
        [EZCommonMethod showAlert:nil message:@"Please check your internet connection"];
        return;
    }
    NSString*urlStr=[NSString stringWithFormat:@"%@%@",BaseUrl,send_Api];
    NSDictionary*parameter=@{@"woid":self.workOrderIdLabel.text,@"assoc":self.teamLabel.text,@"client": self.accountLabel.text,@"commentBy":@"client",@"comment":self.discriptionTextView.text};
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[NetworkManager Instance]postRequestWithUrl:urlStr parameter:parameter onCompletion:^(id dict) {
        NSLog(@"%@",dict);
        NSError* error;
        NSDictionary* json =[NSJSONSerialization JSONObjectWithData:dict
                                                            options:kNilOptions error:&error];
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            if ([[json valueForKey:@"success"] boolValue]==1) {
                discriptionArr=[json valueForKey:@"value"];
                self.discriptionTextView.text=@"";
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                [_associateTableView reloadData];
            }
            
    } onError:^(NSError *Error) {
        NSLog(@"%@:",Error);
        [EZCommonMethod showAlert:nil message:@"please try again"];
        [self viewWorkOrderPostApi];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];

}
#pragma mark- TableView DataSource and Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

   return discriptionArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"WorkViewDetailCell";
    WorkViewDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    cell.dateTimeLbl.text=[[discriptionArr objectAtIndex:indexPath.row]valueForKey:@"dateTime"];
    cell.clienNameLbl.text=[@"Mtest wrote:"stringByAppendingString:[[discriptionArr objectAtIndex:indexPath.row]valueForKey:@"comment"]];
    return cell;
}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 40;
//}
- (IBAction)postReviewAction:(id)sender {
}
@end
