//
//  EZSearchServiceVC.m
//  e-zhire
//
//  Created by Developer on 22/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZSearchServiceVC.h"
#import "SearchServiceCell.h"

@interface EZSearchServiceVC ()

@end

@implementation EZSearchServiceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark- TableView DataSource and Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"cell";
    SearchServiceCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    cell.rateLabel.text =@"";
    cell.nameLabel.text =@"Daniela";
    cell.associateForLabel.text =@"13 month";
    cell.ageLabel.text = @"25";
    cell.idLabel.text =@"GAA000410";
    cell.ratePerHourLabel.text =@"$15.00";
    cell.serviceLabel.text =@"CHILD CARE";
    cell.availabilityLabel.text =@"Exact Match";
    cell.dateLabel.text =@"06-22-2017";
    cell.startTimeLabel.text =@"01:30 PM";
    cell.estTimeLabel.text =@"02:30 PM";
    cell.recuringServiceLabel.text =@"1days of 1";
    cell.hireMeBtn.tag = indexPath.row;
    [cell.hireMeBtn addTarget:self action:@selector(hireMeClicked:) forControlEvents:UIControlEventTouchUpInside];
    cell.reviewProfileBtn.tag = indexPath.row;
    [cell.reviewProfileBtn addTarget:self action:@selector(reviewProfileClicked:) forControlEvents:UIControlEventTouchUpInside];
    cell.reviewDetailLabel.text=@"Professional Summary:Experienced Child Care Provider";

    return cell;
}
-(void)hireMeClicked:(UIButton*)sender {
    
    UIViewController *contorller=[self.storyboard instantiateViewControllerWithIdentifier:@"LoginVC"];
    [self.navigationController pushViewController:contorller animated:YES];
}
-(void)reviewProfileClicked:(UIButton*)sender{
    UIViewController *contorller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZReviewVC"];
    [self.navigationController pushViewController:contorller animated:YES];
  
}

@end
