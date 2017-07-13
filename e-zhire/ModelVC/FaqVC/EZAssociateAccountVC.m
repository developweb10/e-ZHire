//
//  EZAssociateAccountVC.m
//  e-zhire
//
//  Created by Developer on 29/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZAssociateAccountVC.h"
#import "AssociateAccountCell.h"
#import "EZTimeTrackingVC.h"
#import "EZTodoListVC.h"
@interface EZAssociateAccountVC ()
{
    NSArray*profileArr;
    NSInteger selectindex;
  
}

@end

@implementation EZAssociateAccountVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    profileArr=[NSArray arrayWithObjects:@"Set-up Your Account",@"Time Tracking",@"Account Info",@"Accountting",@"Add Service",@"Event Calender",@"Set My Schedule",@"To-do-List",@"My Marketing Page",@"Work History",@"My Pay Setup",@"Learning center",@"Manage Team", nil];
    self.managementHeightConstant.constant = profileArr.count*50;
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
    
    return profileArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"cell";
    AssociateAccountCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    cell.titileNameLabel.text=[profileArr objectAtIndex:indexPath.row];

    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    selectindex= indexPath.row;
    if (indexPath.row==0) {
        UIViewController*controller=[self.storyboard instantiateViewControllerWithIdentifier:@"AssociateManagementVC"];
        [self.navigationController pushViewController:controller animated:YES];
    }
    else if(indexPath.row==1){
        UIViewController*controller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZTimeTrackingVC"];
        [self.navigationController pushViewController:controller animated:YES];
    }
    else if(indexPath.row==2){
        UIViewController*controller=[self.storyboard instantiateViewControllerWithIdentifier:@"AssociateManagementVC"];
        [self.navigationController pushViewController:controller animated:YES];
    }else if(indexPath.row==3){
        
        UIViewController*controller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZAccountingVC"];
        [self.navigationController pushViewController:controller animated:YES];
        
    }else if(indexPath.row==4){
        
        UIViewController*controller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZAddServiceVC"];
        [self.navigationController pushViewController:controller animated:YES];
    }
    else if(indexPath.row==6){
        UIViewController*controller=[self.storyboard instantiateViewControllerWithIdentifier:@"MyAvailbilityScheduleVC"];
        [self.navigationController pushViewController:controller animated:YES];
    }
    else if(indexPath.row==7){
        UIViewController*controller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZTodoListVC"];
        [self.navigationController pushViewController:controller animated:YES];
    }
    else if(indexPath.row==8){
        
        UIViewController*controller=[self.storyboard instantiateViewControllerWithIdentifier:@"MaketingPageVC"];
        [self.navigationController pushViewController:controller animated:YES];
    }
    else if(indexPath.row==9){

        UIViewController*controller=[self.storyboard instantiateViewControllerWithIdentifier:@"WorkHistoryVC"];
        [self.navigationController pushViewController:controller animated:YES];
    }
    else if(indexPath.row==10){
        
        UIViewController*controller=[self.storyboard instantiateViewControllerWithIdentifier:@"PaySetupVC"];
        [self.navigationController pushViewController:controller animated:YES];
    }
    else if(indexPath.row==11){
        
        UIViewController*controller=[self.storyboard instantiateViewControllerWithIdentifier:@"LearningCenterVC"];
        [self.navigationController pushViewController:controller animated:YES];
    }
    else if(indexPath.row==12){
        
        UIViewController*controller=[self.storyboard instantiateViewControllerWithIdentifier:@"ManageTeamVC"];
        [self.navigationController pushViewController:controller animated:YES];
    }

}

- (IBAction)callAction:(UIButton *)sender
{
    NSString *phoneNumber = sender.titleLabel.text;
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",phoneNumber]]];
}

- (IBAction)mailAction:(id)sender
{
    // Email Subject
    NSString *emailTitle = @"Test Email";
    // Email Content
    NSString *messageBody = @"iOS programming is so fun!";
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:@"USA@e-zhire.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
}


- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)menuAction:(id)sender
{
   [self.menuContainerViewController toggleLeftSideMenuCompletion:^{}];
}
@end
