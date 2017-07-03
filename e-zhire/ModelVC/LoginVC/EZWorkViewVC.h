//
//  EZWorkViewVC.h
//  e-zhire
//
//  Created by Developer on 28/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EZWorkViewVC : UIViewController
@property (strong, nonatomic) IBOutlet UIView *ratingView;
- (IBAction)reviewAssociateAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
