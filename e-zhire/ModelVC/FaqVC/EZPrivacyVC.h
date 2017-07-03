//
//  EZPrivacyVC.h
//  e-zhire
//
//  Created by Developer on 06/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EZPrivacyVC : UIViewController
{
    NSDictionary*privacyDict;
}
@property (weak, nonatomic) IBOutlet UITextView *privacyTextView;
- (IBAction)slideMenuAction:(id)sender;

@end
