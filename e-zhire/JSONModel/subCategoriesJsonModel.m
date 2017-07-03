//
//  subCategoriesJsonModel.m
//  e-zhire
//
//  Created by Developer on 13/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "subCategoriesJsonModel.h"

@implementation subCategoriesJsonModel
+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:@{
                                                                 @"subcatId": @"subcatId",
                                                                 @"subcatName":@"subcatName"                                                                 } ];
}
@end
