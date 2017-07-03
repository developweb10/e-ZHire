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

@interface EZClientAccountVC ()

@end

@implementation EZClientAccountVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        self.editInfoView.hidden=YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)workorderAction:(id)sender {
    UIViewController*viewcontroller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZworkorderVC"];
    [self.navigationController pushViewController:viewcontroller animated:YES];
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
    
}
- (IBAction)suggestnewPaswordAction:(id)sender {
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
    
    return 2;
}
-(void) tableView:(UITableView *)tableView willDisplayCell:(EZEditPaymentcell *) cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.row == [tableView numberOfRowsInSection:indexPath.section] - 1) {
        
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.item == 0) {
        EZEditPaymentcell *cell=[tableView dequeueReusableCellWithIdentifier:@"EZEditPaymentcell"];
       
            cell.editPayment.tag=indexPath.row;
            [cell.editPayment addTarget:self action:@selector(editPaymentActionCell:) forControlEvents:UIControlEventTouchUpInside];
         return cell;

    }
    static NSString *MyIdentifier = @"EZPaymentinformationCell";
    EZPaymentinformationCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
//    cell.viewDetailAction.tag=indexPath.row;
//    cell.disputBtn.tag=indexPath.row;
//    [cell.viewDetailAction addTarget:self action:@selector(yourButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
//    
//    [cell.disputBtn addTarget:self action:@selector(disputBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    return cell;
}
-(IBAction)editPaymentActionCell:(id)sender{
UIViewController*controller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZEditPaymentInformationVc"];
    [self.navigationController pushViewController:controller animated:YES];
}
@end
