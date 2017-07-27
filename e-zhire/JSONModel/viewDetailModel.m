//
//  viewDetailModel.m
//  e-zhire
//
//  Created by Developer on 26/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "viewDetailModel.h"

@implementation viewDetailModel
+(JSONKeyMapper*)keyMapper{



    return  [[JSONKeyMapper alloc]initWithModelToJSONDictionary:@{
                                                                  @"logid": @"viewDetails.logid",
                                                                  @"workOrder":@"viewDetails.workOrder",
                                                                  @"associate":@"viewDetails.associate",
                                                                  @"start":@"viewDetails.start",
                                                                  @"end":@"viewDetails.end",
                                                                  @"timeDiff":@"viewDetails.timeDiff",
                                                            @"Dispute_hours_button":@"viewDetails.dispute_hours_button",
                                                                  
                                                                  @"event":@"event",
                                                                  @"date":@"date",
                                                                  @"service":@"service",
                                                                  @"associateInvoice":@"associate",
                                                                  @"price_per_hour":@"price_per_hour",
                                                                  @"hour_worked":@"hour_worked",
                                                                  @"total_cost":@"total_cost",
                                                                  
                                                                  
                                                                  } ];
    
    
    
}
@end
