//
//  LearningCenterVC.m
//  e-zhire
//
//  Created by Developer on 12/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "LearningCenterVC.h"
#import "LearningCell.h"

@interface LearningCenterVC ()
{
    NSArray*imageArr;
    NSInteger currentImage;
      NSArray*serviceArr;
}
@end

@implementation LearningCenterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
imageArr=[NSArray arrayWithObjects:@"clean",@"banner1",@"banner2",@"banner3",@"banner4",@"banner5",@"banner6", nil];
    
    serviceArr=[NSArray arrayWithObjects:@"ACCOUNT SET-UP",@"GENERAL",@"CLEANING",@"EDUCATIONAL  TUTORING",@"ENTERTAINMENT/PERFORMERS",@"EVENTS",@"FAMILY CARE",@"HOUSEHOLD REPAIRS",@"LABOR/GENERAL,MOVERS,RETAIL",@"LANDSCAPE",@"MUSICAL INSTRUCTION",@"PET CARE",@"PROFESSIONAL SERVICES",@"SPORTS TRAINING/FITNESS/MASSAGE",  nil];
     self.thumnilImg.image=[UIImage imageNamed:[imageArr objectAtIndex:currentImage]];
     self.chooseServiceView.hidden=YES;
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.menuContainerViewController setPanMode:MFSideMenuPanModeNone];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UICollectionView Datasource and Delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return imageArr.count;
}
// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LearningCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"LearningCell" forIndexPath:indexPath];
    cell.serviceImg.image=[UIImage imageNamed:[imageArr objectAtIndex:indexPath.row]];
      cell.serviceName.text=@"Custom";
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    currentImage=indexPath.item;
    NSString *getImagePath = [imageArr objectAtIndex:indexPath.row];
    [self.thumnilImg setImage:[UIImage imageNamed:getImagePath]];
    [self.videoCollectionView reloadData];
}
- (IBAction)selectServiceAction:(id)sender {
    self.chooseServiceView.hidden=NO;
    self.detailView.userInteractionEnabled=NO;
    [self.seriveTableView reloadData];
}
#pragma mark- TableView DataSource and Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return serviceArr.count;
  }

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
    {
        static NSString *simpleTableIdentifier = @"cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        }
        cell.textLabel.text = [serviceArr objectAtIndex:indexPath.row];
        cell.backgroundColor=[UIColor clearColor];
        [cell.textLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:14.0f]];
        
        return cell;
    }

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    self.chooseserviceLbl.text=[serviceArr objectAtIndex:indexPath.row];
    self.chooseServiceView.hidden=YES;
    self.detailView.userInteractionEnabled=YES;
}

- (IBAction)closePopupAction:(id)sender {
    self.chooseServiceView.hidden=YES;
     self.detailView.userInteractionEnabled=YES;
}
@end
