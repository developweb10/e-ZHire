//
//  EZCommonMethod.m
//  e-zhire
//
//  Created by Developer on 5/29/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZCommonMethod.h"
#define userEmail @"userEmail"
#define userName  @"username"
static NSString*const EZUseremail=@"userEmail";
static NSString*const EZUserID=@"userId";
static NSString*const EZUsername=@"username";
static NSString*const EZniceName=@"niceName";


@implementation EZCommonMethod



+ (void) addShadowOnImage:(UIImageView *)imageView
{
    imageView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    imageView.layer.shadowOffset = CGSizeMake(0, 1);
    imageView.layer.shadowOpacity = 1;
    imageView.layer.shadowRadius = 1.0;
    imageView.clipsToBounds = NO;
}

+(void)saveUserEmail:(NSString *)UserEmail{
    [[NSUserDefaults standardUserDefaults] setValue:UserEmail forKey:EZUseremail];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(void)savePassword:(NSString *)passWord{
    [[NSUserDefaults standardUserDefaults] setValue:passWord forKey:@""];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(void)saveUserName:(NSString *)UserName{
    [[NSUserDefaults standardUserDefaults] setValue:UserName forKey:EZUsername];
    [[NSUserDefaults standardUserDefaults] synchronize];

}
+(void)saveUserId:(NSString *)UserId{
    [[NSUserDefaults standardUserDefaults] setValue:UserId forKey:EZUserID];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}
+(void)saveUserNiceName:(NSString *)UserNicename{
    [[NSUserDefaults standardUserDefaults] setValue:UserNicename forKey:EZniceName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(NSString*)getUserId { 
    NSString*str=[[NSUserDefaults standardUserDefaults] valueForKey:EZUserID];
     return str;
}

+ (BOOL)validateEmailWithString:(NSString*)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
+(void)showAlert:(NSString*)title message:(NSString*)message{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

+(bool)checkInternetConnection{

    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    if (networkStatus == NotReachable) {
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
        return FALSE;
        
    } else {
        NSLog(@"There IS internet connection");
        return true;

    }
}
+ (BOOL)validateZip:(NSString *)candidate {
    NSString *pinRegex = @"^[0-9]{5}(-[0-9]{4})?$";
    NSPredicate *pinTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pinRegex];
    return [pinTest evaluateWithObject:candidate];
}


+ (NSString *) checkNullString:(NSString *)string{
    if (string == nil || string == (id)[NSNull null])
        string = @"";
    return string;
}

+(UIFont*)getRegularFont:(CGFloat)fontSize {
    return [UIFont fontWithName:@"Oswald-Regular" size:fontSize];
}

+(UIFont*)getBoldFont:(CGFloat)fontSize {
    return [UIFont fontWithName:@"OSWALD-BOLD" size:fontSize];
}

@end
