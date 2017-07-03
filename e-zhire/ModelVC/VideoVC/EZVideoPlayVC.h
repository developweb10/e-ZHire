//
//  EZVideoPlayVC.h
//  e-zhire
//
//  Created by Developer on 05/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EZVideoPlayVC : UIViewController
{
    NSDictionary *dataDict;
}
@property (weak, nonatomic) IBOutlet UILabel *typeLbl;
@property (weak, nonatomic) IBOutlet UIWebView *webVideo;
- (IBAction)slideMenuAction:(id)sender;
@property (strong, nonatomic) NSString *classType;
@end
