//
//  EZEditPaymentInformationVc.m
//  e-zhire
//
//  Created by Developer on 29/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZEditPaymentInformationVc.h"

@interface EZEditPaymentInformationVc ()

@end

@implementation EZEditPaymentInformationVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- TableView DataSource and Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        static NSString *MyIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
//    cell.viewDetailAction.tag=indexPath.row;
//    cell.disputBtn.tag=indexPath.row;
//    [cell.viewDetailAction addTarget:self action:@selector(yourButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
//    
//    [cell.disputBtn addTarget:self action:@selector(disputBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    return cell;
}


@end
