//
//  CategoryCell.m
//  e-zhire
//
//  Created by Developer on 5/29/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "CategoryCell.h"

@implementation CategoryCell

- (void) awakeFromNib
{
    [super awakeFromNib];
    [EZCommonMethod addShadowOnImage:self.imageView];
}
@end
