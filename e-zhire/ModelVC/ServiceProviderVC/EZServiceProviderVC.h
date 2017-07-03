//
//  EZServiceProviderVC.h
//  e-zhire
//
//  Created by Developer on 03/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EZServiceProviderVC : UIViewController
@property (weak, nonatomic) IBOutlet UICollectionView *serviceCollectionView;
@property (weak, nonatomic) IBOutlet UILabel *upperLable;
@property (weak, nonatomic) IBOutlet UILabel *clickLable;
@property (nonatomic) NSInteger selectedIndex;
- (IBAction)slideMenuAction:(id)sender;

@end
