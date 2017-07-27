//
//  viewDetailModel.h
//  e-zhire
//
//  Created by Developer on 26/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface viewDetailModel : JSONModel

@property (nonatomic) NSString<Optional> *logid;
@property (nonatomic) NSString<Optional> *workOrder;
@property (nonatomic) NSString<Optional> *associate;
@property (nonatomic) NSString<Optional> *start;
@property (nonatomic) NSString<Optional> *end;
@property (nonatomic) NSString<Optional> *timeDiff;
@property (nonatomic) NSNumber <Optional>*Dispute_hours_button;

@property (nonatomic) NSString<Optional> *event;
@property (nonatomic) NSString<Optional> *date;
@property (nonatomic) NSString<Optional> *service;
@property (nonatomic) NSString<Optional> *associateInvoice;
@property (nonatomic) NSString<Optional> *price_per_hour;
@property (nonatomic) NSString<Optional> *hour_worked;
@property (nonatomic) NSString<Optional> *total_cost;






@end
