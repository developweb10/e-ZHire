//
//  EZTermVC.h
//  e-zhire
//
//  Created by Developer on 06/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EZTermVC : UIViewController
{
    NSDictionary*termDict;
}
@property (weak, nonatomic) IBOutlet UITextView *termTxtView;
- (IBAction)slideMenuAction:(id)sender;

@end
