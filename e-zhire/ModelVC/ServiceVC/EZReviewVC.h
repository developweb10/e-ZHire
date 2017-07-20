//
//  EZReviewVC.h
//  e-zhire
//
//  Created by Developer on 23/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EZReviewVC : UIViewController

@property (weak, nonatomic) IBOutlet UICollectionView *firstCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *secondCollectionView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic)NSInteger seletedIndex;
@property(nonatomic)NSInteger previousIndex;
@property (weak, nonatomic) IBOutlet UILabel *aboutTextLabel;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIImageView *photoImgage;
- (IBAction)rightActionArrow:(id)sender;
- (IBAction)leftActionArrow:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *serviceTableView;
@property (weak, nonatomic) IBOutlet UILabel *videoPhotoLabel;
@property (weak, nonatomic) IBOutlet UILabel *reviewLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UIButton *rightArrowBtn;
@property (weak, nonatomic) IBOutlet UIButton *leftArrowBtn;
- (IBAction)howReviewAction:(id)sender;

@property(strong)NSString*dateId;
@property(strong)NSString*searchId;

@end
