//
//  EZworkorderVC.h
//  e-zhire
//
//  Created by Developer on 27/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EZworkorderVC : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *workOrderNoTextFiled;
@property (strong, nonatomic) IBOutlet UIButton *searchBtn;
- (IBAction)searchAction:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *workOrderTableView;
@property(strong,nonatomic)NSMutableArray*orderDetailArr;
@end
