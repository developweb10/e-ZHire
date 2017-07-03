//
//  AssociateManagementVC.h
//  e-zhire
//
//  Created by Developer on 30/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AssociateManagementVC : UIViewController
{
    BOOL check;
}

@property (weak,nonatomic) IBOutlet NSLayoutConstraint *profileHelpConstant;
@property (weak, nonatomic) IBOutlet UILabel *profileHelpLbl;
@end
