//
//  subCategoriesJsonModel.h
//  e-zhire
//
//  Created by Developer on 13/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <JSONModel/JSONModel.h>
@protocol subCategoriesJsonModel
@end
@interface subCategoriesJsonModel : JSONModel
@property (nonatomic) NSString<Optional> *subcatId;
@property (nonatomic) NSString<Optional> *subcatName;
@end
