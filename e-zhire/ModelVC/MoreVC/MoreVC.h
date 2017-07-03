//
//  MoreVC.h
//  e-zhire
//
//  Created by Developer on 5/31/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoreVC : UIViewController
{
    NSArray *menuArray,*menuImgArray;
}
@property (strong, nonatomic) IBOutlet UITableView *menuTable;
@end
