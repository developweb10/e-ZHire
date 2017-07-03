//
//  EZInvoicesDetail.h
//  e-zhire
//
//  Created by Developer on 27/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EZInvoicesDetail : UIViewController
@property (weak, nonatomic) IBOutlet UIView *adddresView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic) NSInteger seletedIndex;
@property (strong, nonatomic) IBOutlet UIView *disputView;

@end
