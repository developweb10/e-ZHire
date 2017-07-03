//
//  AssociateManagementVC.m
//  e-zhire
//
//  Created by Developer on 30/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "AssociateManagementVC.h"

@interface AssociateManagementVC ()

@end

@implementation AssociateManagementVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectCheckMark:(UIButton *)sender
{
    if (check == YES) {
        check = NO;
        [sender setImage:[UIImage imageNamed:@"uncheck"] forState:UIControlStateNormal];
    }else
    {
        check = YES;
        [sender setImage:[UIImage imageNamed:@"checkbox"] forState:UIControlStateNormal];
    }
}
- (IBAction)yesNoAction:(UIButton *)sender
{
    if (sender.tag == 101 || sender.tag == 102) {
        if (sender.tag == 101) {
            [sender setImage:[UIImage imageNamed:@"circleSelected"] forState:UIControlStateNormal];
            UIButton *buttonWithTag = (UIButton *)[self.view viewWithTag:102];
            [buttonWithTag setImage:[UIImage imageNamed:@"circle"] forState:UIControlStateNormal];
        }else
        {
            [sender setImage:[UIImage imageNamed:@"circleSelected"] forState:UIControlStateNormal];
            UIButton *buttonWithTag = (UIButton *)[self.view viewWithTag:101];
            [buttonWithTag setImage:[UIImage imageNamed:@"circle"] forState:UIControlStateNormal];
        }
    }else if (sender.tag == 103 || sender.tag == 104) {
        if (sender.tag == 103) {
            [sender setImage:[UIImage imageNamed:@"circleSelected"] forState:UIControlStateNormal];
            UIButton *buttonWithTag = (UIButton *)[self.view viewWithTag:104];
            [buttonWithTag setImage:[UIImage imageNamed:@"circle"] forState:UIControlStateNormal];
        }else
        {
            [sender setImage:[UIImage imageNamed:@"circleSelected"] forState:UIControlStateNormal];
            UIButton *buttonWithTag = (UIButton *)[self.view viewWithTag:103];
            [buttonWithTag setImage:[UIImage imageNamed:@"circle"] forState:UIControlStateNormal];
        }
    }else if (sender.tag == 105 || sender.tag == 106) {
        if (sender.tag == 105) {
            [sender setImage:[UIImage imageNamed:@"circleSelected"] forState:UIControlStateNormal];
            UIButton *buttonWithTag = (UIButton *)[self.view viewWithTag:106];
            [buttonWithTag setImage:[UIImage imageNamed:@"circle"] forState:UIControlStateNormal];
        }else
        {
            [sender setImage:[UIImage imageNamed:@"circleSelected"] forState:UIControlStateNormal];
            UIButton *buttonWithTag = (UIButton *)[self.view viewWithTag:105];
            [buttonWithTag setImage:[UIImage imageNamed:@"circle"] forState:UIControlStateNormal];
        }
    }
}
- (IBAction)profileHelpAction:(UIButton *)sender
{
    if(sender.selected == NO)
    {
        self.profileHelpLbl.text = @"Check to be certain that all information is correct. �Complete filling out all required fields. �You may return to this page any time to modify your account information. This is the page where you may change your account password as well. Be sure to 'Save Changes' after making any modifications. All of your work order notifications will be sent to�your listed email address. �Also a text will be sent to your listed Cell Phone when you receive a work order.";
        sender.selected = YES;
    }else
    {
        sender.selected = NO;
        self.profileHelpLbl.text = @"";
    self.profileHelpConstant.constant = 2.0;
    }
    [self.view layoutIfNeeded];
}
@end
