//
//  AssociateInfoJsonModel.m
//  e-zhire
//
//  Created by Developer on 27/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "AssociateInfoJsonModel.h"

@implementation AssociateInfoJsonModel
+(JSONKeyMapper*)keyMapper{
    
    
    
    return  [[JSONKeyMapper alloc]initWithModelToJSONDictionary:@{
                                                                  ///SecurityBackground///
                                                                  @"agree_flag": @"SecurityBackground.agree_flag",
                                                                  @"crime":@"SecurityBackground.crime",
                                                                  @"offender":@"SecurityBackground.offender",
                                                                @"reside_in_us":@"SecurityBackground.reside_in_us",
                                                                @"sign_by_name":@"SecurityBackground.sign_by_name",
                                                                    ///Information///
                                                                  @"firstName":@"information.firstName",
                                                                  @"lastName":@"information.lastName",
                                                                  @"middleName":@"information.middleName",
                                                                 @"street_address1":@"information.street_address1",
                                                                @"street_address2":@"information.street_address2",
                                                                  @"city":@"information.city",
                                                                  @"state":@"information.state",
                                                                  @"zip":@"information.zip",
                                                                     @"home_phone":@"information.home_phone",
                                                                  
                                                                   @"cell_phone":@"information.cell_phone",
                                                                  @"carrier_name":@"information.carrier_name",
                                                                   @"carrier_value":@"information.carrier_value",
                                                                   @"emailid":@"information.emailid",
                                                                   @"age":@"information.age",
                                                                  @"day":@"information.birhDate.day",
                                                                  @"month":@"information.birhDate.month",
                                                                  @"year":@"information.birhDate.year",
                                                                  ///Profile///
                                                                  @"AssociateID":@"profile.AssociateID",
                                                                   @"Login_User_Name":@"profile.Login_User_Name",
                                                                   @"AssociateSince":@"profile.AssociateSince",
                                                                   @"Login_pw":@"profile.Login_pw",
                                                                  } ];
    
    
    

}
@end
