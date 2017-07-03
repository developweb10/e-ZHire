//
//  AppDelegate.m
//  e-zhire
//
//  Created by Developer on 5/29/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "AppDelegate.h"
#import "MFSideMenu.h"
#import "EZBottomTabVC.h"
#import "MoreVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

+(AppDelegate *)appDelegate
{
    return (AppDelegate*)[UIApplication sharedApplication].delegate;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self.window makeKeyAndVisible];
   // [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    // is IOS 7 and later
    //[[UINavigationBar appearance] setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
    UIStoryboard *storBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    EZBottomTabVC *viewController=[storBoard instantiateViewControllerWithIdentifier:@"EZBottomTabVC"];
     // [navigation setViewControllers:@[viewController]];
     MoreVC *sideMenu=[storBoard instantiateViewControllerWithIdentifier:@"MoreVC"];
     MFSideMenuContainerViewController *container = [MFSideMenuContainerViewController
                  containerWithCenterViewController:viewController
                  leftMenuViewController:sideMenu
                  rightMenuViewController:nil];
    [self.window setRootViewController:container];
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
    // then if StateSelected should be different, you should add this code
    [UITabBar appearance].selectionIndicatorImage = [UIImage imageNamed:@"tabSelect"];

    return YES;
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
