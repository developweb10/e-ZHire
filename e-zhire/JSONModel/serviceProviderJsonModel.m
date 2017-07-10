//
//  serviceProviderJsonModel.m
//  e-zhire
//
//  Created by Developer on 06/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "serviceProviderJsonModel.h"

@implementation serviceProviderJsonModel
+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:@{
                                                                 @"catName": @"catName",
                                                                 @"catDescription":@"catDescription",
        
                                                   } ];
}
@end
