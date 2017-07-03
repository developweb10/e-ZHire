//
//  EZBottomTabVC.m
//  e-zhire
//
//  Created by Developer on 5/29/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZBottomTabVC.h"

@interface EZBottomTabVC ()

@end

@implementation EZBottomTabVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
    
    if ([[UITabBar appearance] respondsToSelector:@selector(setUnselectedItemTintColor:)]) {
        [[UITabBar appearance] setUnselectedItemTintColor:[UIColor whiteColor]];
    }
    // Do any additional setup after loading the view.
    _categoryArray = [NSMutableArray arrayWithObjects:@"", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
