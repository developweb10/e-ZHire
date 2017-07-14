//
//  EZWorkViewVC.h
//  e-zhire
//
//  Created by Developer on 28/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EZWorkViewVC : UIViewController
@property (strong, nonatomic) IBOutlet UIView *ratingView;
- (IBAction)reviewAssociateAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UILabel *clientInformationLbl;
@property (strong, nonatomic) IBOutlet UILabel *accountLabel;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *nameFont;
@property (strong, nonatomic) IBOutlet UILabel *accountEmailLabel;
@property (strong, nonatomic) IBOutlet UILabel *accEmailFont;
@property (strong, nonatomic) IBOutlet UILabel *phoneNoLabel;
@property (strong, nonatomic) IBOutlet UILabel *mobilePhoneFont;
@property (strong, nonatomic) IBOutlet UILabel *otherPhoneLabel;
@property (strong, nonatomic) IBOutlet UILabel *otherPhoneFont;
@property (weak, nonatomic) IBOutlet UILabel *otherinformationLbl;
@property (weak, nonatomic) IBOutlet UILabel *accountAddCity;
@property (strong, nonatomic) IBOutlet UILabel *accountAddLbl;
@property (strong, nonatomic) IBOutlet UILabel *addStreet1;
@property (strong, nonatomic) IBOutlet UILabel *seriveAddCity;
@property (weak, nonatomic) IBOutlet UILabel *seriveAddName;
@property (weak, nonatomic) IBOutlet UILabel *associateInformationLbl;
@property (strong, nonatomic) IBOutlet UILabel *serviceAddLbl;
@property (strong, nonatomic) IBOutlet UILabel *workOrderIdLabel;
@property (strong, nonatomic) IBOutlet UILabel *workOrderfont;
@property (strong, nonatomic) IBOutlet UILabel *orderDateLabel;
@property (strong, nonatomic) IBOutlet UILabel *serviceTypeLabel;
@property (strong, nonatomic) IBOutlet UILabel *serviceTypeFont;
@property (strong, nonatomic) IBOutlet UILabel *orderSubmittedFont;
@property (strong, nonatomic) IBOutlet UILabel *clientDiscriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *teamInformationFont;
@property (strong, nonatomic) IBOutlet UIImageView *clientPfofileImg;
@property (strong, nonatomic) IBOutlet UILabel *teamLabel;
@property (strong, nonatomic) IBOutlet UILabel *teamFont;
@property (strong, nonatomic) IBOutlet UILabel *teamNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *teamNameFont;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceFont;
@property (strong, nonatomic) IBOutlet UILabel *teamLeaderLabel;
@property (strong, nonatomic) IBOutlet UILabel *teamEmailLabel;
@property (strong, nonatomic) IBOutlet UILabel *emailTextFont;
@property (strong, nonatomic) IBOutlet UILabel *teamLeaderTextFont;
@property (strong, nonatomic) IBOutlet UILabel *cellPhoneLabel;
@property (strong, nonatomic) IBOutlet UILabel *cellPhoneTextFont;
@property (strong, nonatomic) IBOutlet UIButton *reviewAssociateBtn;
@property (strong, nonatomic) IBOutlet UIButton *acceptedAction;
@property (strong, nonatomic) IBOutlet UIButton *cancelBtn;
- (IBAction)acceptAction:(id)sender;
- (IBAction)cancelACtion:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *clientJobTextFont;
@property (strong, nonatomic) IBOutlet UILabel *clientstartTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *estimateHourLabel;
@property (strong, nonatomic) IBOutlet UILabel *startTimeTextFont;
@property (strong, nonatomic) IBOutlet UILabel *estimateHourFont;
@property (strong, nonatomic) IBOutlet UITextView *discriptionTextView;
- (IBAction)sendAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *sendBtn;
@property (strong, nonatomic) IBOutlet UILabel *clientDateLabel;
@property (strong, nonatomic) IBOutlet UILabel *accountTextFont;
@property (weak, nonatomic) IBOutlet UILabel *recuringSeriveDateLbl;
@property(nonatomic,strong)NSString*work_ordeId;
@end
