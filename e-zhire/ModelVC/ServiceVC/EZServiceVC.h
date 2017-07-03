//
//  EZServiceVC.h
//  e-zhire
//
//  Created by Developer on 5/29/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryCell.h"

@interface EZServiceVC : UIViewController
{
     NSDictionary*catDetails;
}
/**
 * Flag indicating whether all products have been already fetched.
 */
@property (nonatomic, assign) BOOL didLoadAllProducts;
@property (weak, nonatomic) IBOutlet UICollectionView *categoryCollection;
@property (strong, nonatomic) NSMutableArray *categoryArray;
@property (strong, nonatomic) NSMutableArray *subCategoryArr;
@property (strong, nonatomic) NSMutableDictionary *detailsDictionary;
@property (strong, nonatomic) NSMutableArray *seletedIndexArray;

- (IBAction)slideMenuAction:(id)sender;

@property(nonatomic) NSInteger selectedIndex;

@end
