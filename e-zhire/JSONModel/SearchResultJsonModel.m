//
//  SearchResultJsonModel.m
//  e-zhire
//
//  Created by Developer on 05/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "SearchResultJsonModel.h"

@implementation SearchResultJsonModel
+(JSONKeyMapper *)keyMapper
{
   
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:@{
                                                                 @"Recurring Service": @"Recurring Service",
                                                                 @"age":@"age",
                                                                 @"associate_for":@"associate_for",
                                                                 @"availability":@"availability",
                                                                 @"date":@"date",
                                                            @"establish_compilation_time":@"establish_compilation_time",
                                                                 @"search_Id":@"id",
                                                                  @"rating":@"rating",
                                                                 @"name":@"name",
                                                                 @"profile_pic":@"profile_pic",
                                                                 @"rate_per_hours":@"rate_per_hours",
                                                                 @"service":@"service",
                                                                 @"startTime":@"startTime",

                                                                 } ];
}
@end
