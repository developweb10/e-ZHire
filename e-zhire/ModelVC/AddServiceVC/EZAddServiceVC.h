//
//  EZAddServiceVC.h
//  e-zhire
//
//  Created by Developer on 30/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EZAddServiceVC : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *clictToaddserviceBn;
- (IBAction)clickToAddServiceAction:(id)sender;
- (IBAction)helpAction:(id)sender;
- (IBAction)createServiceAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *addServiceTableView;
- (IBAction)saveChangesAction:(id)sender;
- (IBAction)teamAction:(id)sender;
- (IBAction)selectSelectserviceAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *selectTeamlabel;
@property (weak, nonatomic) IBOutlet UILabel *selectServiceLabel;
@property (strong, nonatomic) IBOutlet UIView *selectServiceView;
@property (weak, nonatomic) IBOutlet UITableView *serviceTableView;
- (IBAction)zipCodeLoctionActon:(id)sender;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
- (IBAction)closepopupAction:(id)sender;

@end
