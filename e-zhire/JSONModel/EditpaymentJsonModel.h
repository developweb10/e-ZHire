//
//  EditpaymentJsonModel.h
//  e-zhire
//
//  Created by Developer on 18/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface EditpaymentJsonModel : JSONModel
@property (nonatomic) NSString<Optional> *account;
@property (nonatomic) NSString<Optional> *expiry;
@property (nonatomic) NSString<Optional> *id;
@property (nonatomic) NSString<Optional> *name;
@property (nonatomic) BOOL is_default;

@end
