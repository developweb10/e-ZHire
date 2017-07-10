//
//  serviceProviderJsonModel.h
//  e-zhire
//
//  Created by Developer on 06/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface serviceProviderJsonModel : JSONModel
@property (nonatomic) NSString<Optional> *catName;
@property (nonatomic) NSString<Optional> *catDescription;

@end
