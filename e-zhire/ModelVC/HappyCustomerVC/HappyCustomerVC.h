//
//  HappyCustomerVC.h
//  e-zhire
//
//  Created by Developer on 05/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HappyCustomerVC : UIViewController
{
    NSMutableArray*happyArr;
}
@property (weak, nonatomic) IBOutlet UITableView *reviewTableView;
- (IBAction)slideMenu:(id)sender;

@end
