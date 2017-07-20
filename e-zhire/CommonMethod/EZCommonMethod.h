//
//  EZCommonMethod.h
//  e-zhire
//
//  Created by Developer on 5/29/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"
#import "MBProgressHUD.h"
#import "UIImageView+WebCache.h"
#import "MFSideMenu.h"

#define associateUserEmail @"associateUserEmail"
#define associateUserName  @"associateUsername"
#define associateUserId @"associateUserId"
#define associateNiceName  @"associateNiceName"

@interface EZCommonMethod : NSObject

+ (void) addShadowOnImage:(UIImageView *)imageView;
+(void)saveUserEmail:(NSString *)UserEmail;
+(void)saveUserName:(NSString *)UserName;
+(void)saveUserId:(NSString *)UserId;
+(void)saveUserNiceName:(NSString *)UserNicename;
+(void)savePassword:(NSString *)passWord;
+ (BOOL)validateEmailWithString:(NSString*)email;
+(void)showAlert:(NSString*)title message:(NSString*)message;
+(bool)checkInternetConnection;
+ (BOOL)validateZip:(NSString *)candidate;
+ (NSString *) checkNullString:(NSString *)string;
+(UIFont*)getBoldFont:(CGFloat)fontSize;
+(UIFont*)getRegularFont:(CGFloat)fontSize;
+(NSString*)getUserId;
+(NSString*)getUserName;
+(NSString*)getUserNiceName;
+(NSString*)getUserEmail;

@end
