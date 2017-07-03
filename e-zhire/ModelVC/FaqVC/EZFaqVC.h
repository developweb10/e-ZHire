//
//  EZFaqVC.h
//  e-zhire
//
//  Created by Developer on 31/05/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EZFaqVC : UIViewController
{
    NSArray *clientArray,*clientAnsArray;
    NSArray *associateArray,*associateAnsArray;
    BOOL checkAssociate;
    NSMutableArray*faqArr;
}
@property(nonatomic)NSInteger seletedIndex;
@property(nonatomic)NSInteger previousIndex;

- (IBAction)slideMenuAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *faqTableView;
@property (weak, nonatomic) IBOutlet UIButton *clientFaqBtn;
@property (strong, nonatomic) NSString *classType;
@end
