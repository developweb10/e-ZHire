//
//  AvailableServiceJsonModel.h
//  e-zhire
//
//  Created by Developer on 13/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "subCategoriesJsonModel.h"

@interface AvailableServiceJsonModel : JSONModel
@property (nonatomic) NSString<Optional> *catId;
@property (nonatomic) NSString<Optional> *catName;
@property (nonatomic) NSString<Optional> *catImage;
@property(nonatomic)  NSMutableArray<subCategoriesJsonModel,Optional> *subCategoriesArray;

@end
