//
//  EZClientAccountVC.h
//  e-zhire
//
//  Created by Developer on 27/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EZClientAccountVC : UIViewController
- (IBAction)workorderAction:(id)sender;
- (IBAction)saveChangesAction:(id)sender;
- (IBAction)suggestnewPaswordAction:(id)sender;
- (IBAction)editClinetInfoACtion:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *editInfoView;
- (IBAction)closePopupAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)invoiceAction:(id)sender;
@end
