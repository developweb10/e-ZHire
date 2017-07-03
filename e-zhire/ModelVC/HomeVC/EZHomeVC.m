//
//  EZHomeVC.m
//  e-zhire
//
//  Created by Developer on 6/1/17.
//  Copyright © 2017 Inext. All rights reserved.
//


@interface HomeCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *categoryName;

@end

@implementation HomeCell

@end

#import "EZHomeVC.h"
#import "imageAnimationCell.h"

@interface EZHomeVC ()

@end

@implementation EZHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    homeMenuArray = [NSArray arrayWithObjects:@"HOW IT WORKS",@"WHAT WE DO",@"AVAILABLE SERVICES",@"LOGIN", nil];
    imgArray=[NSArray arrayWithObjects:@"banner1",@"banner2",@"banner3",@"banner4",@"banner5",@"banner6", nil];
    [self.imageCollectionView reloadData];
    count=0;
    [NSTimer scheduledTimerWithTimeInterval:1.5
                                     target:self
                                   selector:@selector(targetMethod:)
                                   userInfo:nil
                                    repeats:YES];
    [self ipadFontSize];
}

-(void)ipadFontSize{
    
   if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        [self.hireAffordableLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:22.0f]];
        [self.placeOrderLabel setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:20.0f]];
        [self.chooseServiceProviderLabel setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:20.0f]];
        [self.self.selectserviceLabel setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:20.0f]];
       
    }else{
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)targetMethod:(NSTimer*)timer {
    ++count;
    [self.imageCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:count inSection:0]
                                     atScrollPosition:UICollectionViewScrollPositionRight animated:YES];
    if (count==5) {
        count=0;
  }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return homeMenuArray.count;    //count number of row from counting array hear cataGorry is An Array
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"HomeCell";
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        [cell.categoryName setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:22.0f]];
    }else{
  
    }
    cell.categoryName.text = [homeMenuArray objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
      if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
          return self.homeTable.bounds.size.height/4.0;
      }else{
          return self.homeTable.bounds.size.height/4.0;
      }
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //[self performSegueWithIdentifier:@"loginSegue" sender:self];
    if (indexPath.row==0) {
    UIViewController *contorller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZVideoPlayVC"];
    [self.navigationController pushViewController:contorller animated:YES];
    }else if (indexPath.row==1){
    EZVideoPlayVC *contorller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZVideoPlayVC"];
    contorller.classType = @"WHAT WE DO";
    [self.navigationController pushViewController:contorller animated:YES];
    }
    else if (indexPath.row==2){
        UIViewController *contorller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZServiceVC"];
        [self.navigationController pushViewController:contorller animated:YES];
    }
    else if (indexPath.row==3){
        UIViewController *contorller=[self.storyboard instantiateViewControllerWithIdentifier:@"LoginVC"];
        [self.navigationController pushViewController:contorller animated:YES];
    }
}

#pragma mark- Colellection View DataSource and Delegate

-(NSInteger)numberOFSectionsInCollectionView:(UICollectionView*)collectionView{
    
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return imgArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    imageAnimationCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
     cell.imageView.image=[UIImage imageNamed:[imgArray objectAtIndex:indexPath.item]];
   
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
      if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
            self.topViewHeightConstraint.constant=400;
           return CGSizeMake([UIScreen mainScreen].bounds.size.width,200);
      }else{
          
           return CGSizeMake([UIScreen mainScreen].bounds.size.width, 90);
      }
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (IBAction)slideMenuBtnAction:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:^{}];

}
@end
