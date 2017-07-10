//
//  EZSearchServiceVC.m
//  e-zhire
//
//  Created by Developer on 22/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZSearchServiceVC.h"
#import "SearchServiceCell.h"
#import "SearchResultJsonModel.h"

@interface EZSearchServiceVC ()

@end

@implementation EZSearchServiceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",_passingArray);
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
    return self.passingArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *MyIdentifier = @"cell";
    SearchResultJsonModel *obj=[self.passingArray objectAtIndex:indexPath.row];
    SearchServiceCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    cell.rateLabel.text = obj.rate_per_hours;
    cell.nameLabel.text =obj.name;
    cell.associateForLabel.text = obj.associate_for;
    cell.ageLabel.text = obj.age;
    cell.idLabel.text = obj.search_Id;
    NSString*ratValue = [NSString stringWithFormat:@"%@", obj.rating];
    cell.ratingView.allowsHalfStars=YES;
    cell.ratingView.minimumValue=0.0;
    cell.ratingView.maximumValue=5.0;
    cell.ratingView.emptyStarImage=[UIImage imageNamed:@"star-fill"];
    cell.ratingView.filledStarImage=[UIImage imageNamed:@"star-Full"];
    cell.ratingView.halfStarImage=[UIImage imageNamed:@"star-half"];
    CGFloat floatvalue=ratValue.floatValue;
    cell.ratingView.userInteractionEnabled=NO;
    cell.ratingView.value=floatvalue;

    cell.ratePerHourLabel.text = [@"$" stringByAppendingString:obj.rate_per_hours];
    cell.serviceLabel.text =obj.service;
    cell.availabilityLabel.text = obj.availability;
    cell.dateLabel.text = obj.date;
    cell.startTimeLabel.text =obj.startTime;
    cell.estTimeLabel.text =obj.establish_compilation_time;
    
    if (obj.recurring_Service==nil) {
          cell.recuringServiceLabel.text=@"0days of";
    }else{
        cell.recuringServiceLabel.text=obj.recurring_Service;
    }
    cell.hireMeBtn.tag = indexPath.row;
    [cell.hireMeBtn addTarget:self action:@selector(hireMeClicked:) forControlEvents:UIControlEventTouchUpInside];
    cell.reviewProfileBtn.tag = indexPath.row;
    [cell.reviewProfileBtn addTarget:self action:@selector(reviewProfileClicked:) forControlEvents:UIControlEventTouchUpInside];
    cell.reviewDetailLabel.text=@"Professional Summary:Experienced Child Care Provider";
    NSString *string64 =obj.profile_pic;
    NSData *data = [[NSData alloc] initWithBase64EncodedString:string64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    UIImage *captcha_image = [[UIImage alloc] initWithData:data];
    cell.profileImage.image=captcha_image;
    
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
