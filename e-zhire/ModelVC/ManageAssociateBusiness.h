//
//  ManageAssociateBusiness.h
//  e-zhire
//
//  Created by Developer on 13/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ManageAssociateBusiness : UIViewController<MFMailComposeViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *associateTableView;
- (IBAction)helpAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *associateLeaderLbl;
@property (weak, nonatomic) IBOutlet UIImageView *teamLeadImg;
- (IBAction)phoneAction:(id)sender;
- (IBAction)emailAction:(id)sender;
- (IBAction)addTeamMemberAction:(id)sender;

@end
