//
//  AssociateInfoJsonModel.h
//  e-zhire
//
//  Created by Developer on 27/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface AssociateInfoJsonModel : JSONModel

@property (nonatomic) NSString<Optional> *agree_flag;
@property (nonatomic) NSString<Optional> *crime;
@property (nonatomic) NSString<Optional> *offender;
@property (nonatomic) NSString<Optional> *reside_in_us;
@property (nonatomic) NSString<Optional> *sign_by_name;
@property (nonatomic) NSString <Optional>*firstName;
@property (nonatomic) NSString<Optional> *lastName;
@property (nonatomic) NSString<Optional> *middleName;
@property (nonatomic) NSString<Optional> *street_address1;
@property (nonatomic) NSString<Optional> *street_address2;
@property (nonatomic) NSString<Optional> *city;
@property (nonatomic) NSString<Optional> *state;
@property (nonatomic) NSString<Optional> *zip;
@property (nonatomic) NSString<Optional> *home_phone;
@property (nonatomic) NSString<Optional> *cell_phone;
@property (nonatomic) NSString<Optional> *carrier_name;
@property (nonatomic) NSString<Optional> *carrier_value;
@property (nonatomic) NSString<Optional> *emailid;
@property (nonatomic) NSString<Optional> *age;
@property (nonatomic) NSString<Optional> *day;
@property (nonatomic) NSString<Optional> *month;
@property (nonatomic) NSString<Optional> *year;
@property (nonatomic) NSString<Optional> *AssociateID;
@property (nonatomic) NSString<Optional> *Login_User_Name;
@property (nonatomic) NSString<Optional> *AssociateSince;
@property (nonatomic) NSString<Optional> *Login_pw;


@end
