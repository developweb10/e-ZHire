//
//  HappyCustomerVC.m
//  e-zhire
//
//  Created by Developer on 05/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "HappyCustomerVC.h"
#import "CustomerCell.h"
#import "MBProgressHUD.h"
#import "UIImageView+WebCache.h"

@interface HappyCustomerVC ()

@end

@implementation HappyCustomerVC

- (void)viewDidLoad {
   [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title=@"HAPPY CUSTOMER";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    [self getHappyCustomer];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark- UITableView delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return happyArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"CustomerCell";
    CustomerCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    NSLog(@"%@",[[happyArr objectAtIndex:indexPath.item]valueForKey:@"cust_name"]);
    NSString*profileImg=[[happyArr objectAtIndex:indexPath.item]valueForKey:@"feature_image"];
    [cell.profileImage sd_setImageWithURL:[NSURL URLWithString:profileImg] placeholderImage:[UIImage imageNamed:@""]];
    
    cell.profileView.layer.borderColor=[UIColor colorWithRed:225/255.0f green:225/255.0f blue:225/255.0f alpha:1.0].CGColor;
    cell.profileInsideView.layer.borderColor=[UIColor colorWithRed:225/255.0f green:225/255.0f blue:225/255.0f alpha:1.0].CGColor;
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        [cell.cityLable setFont:[UIFont fontWithName:@"Oswald-Regular" size:18.0f]];
        [cell.descLable setFont:[UIFont fontWithName:@"Oswald-Regular" size:18.0f]];
        cell.cityLable.text=[[happyArr objectAtIndex:indexPath.item]valueForKey:@"cust_name"];
        cell.descLable.text=[[happyArr objectAtIndex:indexPath.item]valueForKey:@"cust_message"];
    }else{
        cell.cityLable.text=[[happyArr objectAtIndex:indexPath.item]valueForKey:@"cust_name"];
        cell.descLable.text=[[happyArr objectAtIndex:indexPath.item]valueForKey:@"cust_message"];
    }

    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
#pragma mark- UITableView delegate

-(void)getHappyCustomer{
    bool check=[EZCommonMethod checkInternetConnection];
    if(!check){
        [EZCommonMethod showAlert:nil message:@"Please check your internet connection"];
        return;
    }
    NSString *urlString=[NSString stringWithFormat:@"%@%@",BaseUrl,happy_Customer];
     [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [[NetworkManager Instance] getRequestWithUrl:urlString parameter:nil onCompletion:^(id dict) {
        NSError* errorJson=nil;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:dict
                                                             options:kNilOptions
                                                               error:&errorJson];
        NSLog(@"%@",json);
        if ([[json valueForKey:@"success"] boolValue]==1) {
            happyArr=[json valueForKey:@"value"];
            NSLog(@"%@",happyArr);
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [self.reviewTableView reloadData];
        }
        
    } onError:^(NSError *Error) {
        NSLog(@"%@",Error);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        //[EZCommonMethod showAlert:nil message:@"Please try again"];
        
    }];
}

- (IBAction)slideMenu:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:^{}];
}
@end
