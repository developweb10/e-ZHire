//
//  AvailableServiceJsonModel.m
//  e-zhire
//
//  Created by Developer on 13/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "AvailableServiceJsonModel.h"

@implementation AvailableServiceJsonModel
+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:@{
                                                                 @"catId": @"catId",
                                                                 @"catName":@"catName",
                                                                 @"catImage":@"catImage",
                                                                 @"subCategoriesArray":@"subcategories"
                                                                 } ];
}


@end
