//
//  EZHomeVC.h
//  e-zhire
//
//  Created by Developer on 6/1/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EZVideoPlayVC.h"

@interface EZHomeVC : UIViewController
{
    NSArray *homeMenuArray,*imgArray;
    NSInteger count;
    
}
@property (weak,nonatomic) IBOutlet UITableView *homeTable;
@property (weak, nonatomic) IBOutlet UICollectionView *imageCollectionView;
@property (weak, nonatomic) IBOutlet UILabel *hireAffordableLabel;
@property (weak, nonatomic) IBOutlet UILabel *selectserviceLabel;
@property (weak, nonatomic) IBOutlet UILabel *chooseServiceProviderLabel;
@property (weak, nonatomic) IBOutlet UILabel *placeOrderLabel;
- (IBAction)slideMenuBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewHeightConstraint;
@end
