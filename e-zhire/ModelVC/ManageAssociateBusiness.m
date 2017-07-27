//
//  ManageAssociateBusiness.m
//  e-zhire
//
//  Created by Developer on 13/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "ManageAssociateBusiness.h"
#import "AssociateCell.h"

@interface ManageAssociateBusiness ()

@end

@implementation ManageAssociateBusiness

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.menuContainerViewController setPanMode:MFSideMenuPanModeNone];
}
#pragma mark- TableView DataSource and Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

   return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
  return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"AssociateCell";
    AssociateCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    return cell;
 }
- (IBAction)helpAction:(id)sender {
    
}
- (IBAction)phoneAction:(UIButton*)sender {
    NSString *phoneNumber = sender.titleLabel.text;
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",phoneNumber]]];
}
- (IBAction)emailAction:(id)sender {
    if ([MFMailComposeViewController canSendMail]){
        MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];
        mail.mailComposeDelegate = self;
        [mail setSubject:@"Sample Subject"];
        [mail setMessageBody:@"Here is some main text in the email!" isHTML:NO];
        [mail setToRecipients:@[@"USA@e-zhire.com"]];
        [self presentViewController:mail animated:YES completion:NULL];
    }
    else{
       [EZCommonMethod showAlert:nil message:@"This device cannot send email"];
    }
}
- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    switch (result){
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
- (IBAction)addTeamMemberAction:(id)sender {
    
}
@end
