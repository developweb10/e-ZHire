//
//  ManageTeamVC.h
//  e-zhire
//
//  Created by Developer on 12/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManageTeamVC : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
- (IBAction)createNewTeam:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *teamListLbl;
@property (weak, nonatomic) IBOutlet UIButton *createNewBtn;
@property (weak, nonatomic) IBOutlet UITableView *manageTableView;
@property (strong, nonatomic) IBOutlet UIView *createTeamView;
@property (weak, nonatomic) IBOutlet UITextField *teamNameTextField;
@property (weak, nonatomic) IBOutlet UITableView *cretaeTeamTableView;
@property (weak, nonatomic) IBOutlet UIButton *addSeriveBtn;

- (IBAction)helpAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *uploadProfilePicFont;
- (IBAction)chooseProfilePicAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *fileNameLbl;
- (IBAction)serviceTypeAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *serviceTypeLbl;
- (IBAction)createAction:(id)sender;
- (IBAction)closeViewAction:(id)sender;

@end
