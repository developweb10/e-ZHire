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
}
@end

@implementation LearningCenterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    imageArr=[NSArray arrayWithObjects:@"clean",@"banner1",@"banner2",@"banner3",@"banner4",@"banner5",@"banner6", nil];
    self.thumnilImg.image=[UIImage imageNamed:[imageArr objectAtIndex:currentImage]];
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
    
}

@end
