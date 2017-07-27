//
//  View.m
//  e-zhire
//
//  Created by Developer on 26/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "View.h"

@implementation View

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)initWithFrame:(CGRect)frame{
self=[super initWithFrame:frame];
if (self) {
    self=[[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]objectAtIndex:0];
}
return  self;
}
@end
