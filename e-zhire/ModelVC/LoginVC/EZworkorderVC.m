//
//  EZworkorderVC.m
//  e-zhire
//
//  Created by Developer on 27/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZworkorderVC.h"
#import "EZOrderCell.h"
@interface EZworkorderVC ()

@end

@implementation EZworkorderVC

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
    
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"EZOrderCell";
    EZOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    cell.viewOrderBtn.tag=indexPath.row;
    [cell.viewOrderBtn addTarget:self action:@selector(viewOrderClicked:) forControlEvents:UIControlEventTouchUpInside];

    return cell;
}
-(IBAction)viewOrderClicked:(id)sender{
    
    UIViewController*controller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZWorkViewVC"];
    [self.navigationController pushViewController:controller animated:YES];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
 }

@end
