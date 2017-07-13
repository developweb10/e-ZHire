//
//  LearningCenterVC.h
//  e-zhire
//
//  Created by Developer on 12/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LearningCenterVC : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *chooseserviceLbl;
- (IBAction)selectServiceAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *detailView;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UICollectionView *videoCollectionView;

@property (weak, nonatomic) IBOutlet UILabel *learningCenterFontLbl;
@property (weak, nonatomic) IBOutlet UILabel *serviecTypeFontLbl;
@property (weak, nonatomic) IBOutlet UIImageView *thumnilImg;

@end
