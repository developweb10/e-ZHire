//
//  EZTodoListVC.h
//  e-zhire
//
//  Created by Developer on 03/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EZTodoListVC : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *addListTextFiled;
- (IBAction)addListAction:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *addListTableView;
@end
