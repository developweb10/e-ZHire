//
//  EditpaymentJsonModel.m
//  e-zhire
//
//  Created by Developer on 18/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EditpaymentJsonModel.h"

@implementation EditpaymentJsonModel
+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:@{
                                                                 @"account": @"account",
                                                                 @"expiry":@"expiry",
                                                                 @"id":@"id",
                                                                 @"name":@"name",
                                                                 @"is_default":@"is_default",
                                                                 } ];
}

@end
