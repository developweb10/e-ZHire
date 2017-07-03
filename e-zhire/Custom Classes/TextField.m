//
//  TextField.m
//  Givel
//
//  Created by Inextsol on 16/08/16.
//  Copyright © 2016 inext. All rights reserved.
//

#import "TextField.h"

@implementation TextField


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 0.0)];
    self.leftView = paddingView;
    self.leftViewMode = UITextFieldViewModeAlways;
    // Drawing code
}

@end
