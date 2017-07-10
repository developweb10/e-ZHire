//
//  EZServiceVC.m
//  e-zhire
//
//  Created by Developer on 5/29/17.
//  Copyright © 2017 Inext. All rights reserved.
//
//@interface DetailCell : UITableViewCell
//
//@end
//
//@implementation DetailCell
//
//@end

#import "EZServiceVC.h"
#import "DetailCell.h"
#import "AvailableServiceJsonModel.h"
#import "subCategoriesJsonModel.h"
#import "UIImageView+WebCache.h"
#import "MBProgressHUD.h"
#import "EZServiceDetailVC.h"
#import "headerCell.h"


@interface EZServiceVC ()
@end

@implementation EZServiceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.categoryCollection registerNib:[UINib nibWithNibName:@"EZLoadingCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"brandsLoadingFooterViewReuseIdentifier"];
    self.selectedIndex=-1;
     _categoryArray=[NSMutableArray new];
    self.seletedIndexArray=[NSMutableArray new];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"serviceLogo3x"]];
    [self getAllCategory];
    
  }
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    [super viewWillAppear:YES];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:177/255.0f green:30/255.0f blue:6/255.0f alpha:1.0f];
    self.navigationController.navigationBar.translucent = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Button Action
- (IBAction)displayCategoryAction:(UIButton *)sender {
    
}
#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.row == [collectionView numberOfItemsInSection:indexPath.section] - 1) {
        //     [self reloadDataFromNetwork];
    }
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _categoryArray.count+1;
}
// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.item == 0) {
        headerCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"headerCell" forIndexPath:indexPath];
        if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        cell.bannerConstantHeight.constant=200;
        cell.searchBtnHeight.constant=60;
        [cell.searchForBtn.titleLabel setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:20]];
            
        }else{
            
        }
        return cell;
    }
    CategoryCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"CategoryCell" forIndexPath:indexPath];
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        // iPad
        if (_selectedIndex==indexPath.row) {
            cell.labelViewheight.constant=cell.frame.size.height-20;
            
            [cell.arrowBtn setImage:[UIImage imageNamed:@"servicedownArrow" ] forState:UIControlStateNormal];
        }
        else{
            cell.labelViewheight.constant=50;
            [cell.arrowBtn setImage:[UIImage imageNamed:@"serviceUpArrow"] forState:UIControlStateNormal];
        }
        // placeHolder
        cell.nameLbl.font=[UIFont fontWithName:@"Oswald" size:22];
        
      }else {
        // iPhone
        if (_selectedIndex==indexPath.row) {
            cell.labelViewheight.constant=cell.frame.size.height-10;
            [cell.arrowBtn setImage:[UIImage imageNamed:@"servicedownArrow" ] forState:UIControlStateNormal];
        }
        else{
            cell.labelViewheight.constant=40;
            [cell.arrowBtn setImage:[UIImage imageNamed:@"serviceUpArrow"] forState:UIControlStateNormal];
        }
        cell.nameLbl.font=[UIFont fontWithName:@"Oswald" size:15];
    }
    cell.tag=indexPath.row;
    AvailableServiceJsonModel *obj=[self.categoryArray objectAtIndex:indexPath.item-1];
    NSLog(@"%@",obj.catName);
    cell.nameLbl.text = obj.catName;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:obj.catImage] placeholderImage:[UIImage imageNamed:@"serivePlaceHolder"]];
    // placeHolder
    
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *) indexPath {
    
       if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
           if (indexPath.item == 0) {
               return CGSizeMake(([UIScreen mainScreen].bounds.size.width-20), 300.0);
           }
       }else{
           if (indexPath.item == 0) {
               return CGSizeMake(([UIScreen mainScreen].bounds.size.width-20), 143.0);
           }
       }
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        
    return CGSizeMake([UIScreen mainScreen].bounds.size.width/2-12, [UIScreen mainScreen].bounds.size.width/3.0);

    }else{
        return CGSizeMake(([UIScreen mainScreen].bounds.size.width-20), [UIScreen mainScreen].bounds.size.width/1.5);
    }
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    for (CategoryCell *cell in collectionView.visibleCells) {
        if ([cell isKindOfClass:[CategoryCell class]]) {
            if (cell.tag==indexPath.item) {
                if (cell.tag==self.selectedIndex) {
                    cell.labelViewheight.constant=40;
                [cell.arrowBtn setImage:[UIImage imageNamed:@"serviceUpArrow"] forState:UIControlStateNormal];
                    self.selectedIndex=-1;
                    [self updateLayout];
                    [self reloadTableWithIndex:cell];
                    
                    return;
                }else{
                    [self reloadTableWithIndex:cell];
                    cell.labelViewheight.constant=cell.frame.size.height-10;
                    [cell.arrowBtn setImage:[UIImage imageNamed:@"servicedownArrow" ] forState:UIControlStateNormal];
                }
            }else{
                [cell.arrowBtn setImage:[UIImage imageNamed:@"serviceUpArrow"] forState:UIControlStateNormal];
                cell.labelViewheight.constant=40;
            }
        }
    }
    self.selectedIndex=indexPath.item;
    [self updateLayout];
    
}
-(void)updateLayout{
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
}

//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//    if (kind == UICollectionElementKindSectionFooter) {
//        UICollectionReusableView *footerView = [self.categoryCollection dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"brandsLoadingFooterViewReuseIdentifier" forIndexPath:indexPath];
//        return footerView;
//    }
//    return nil;
//}
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
//{
//    return self.didLoadAllProducts ? CGSizeZero : CGSizeMake(self.categoryCollection.frame.size.width, 50.0);
//}


#pragma mark- TableView DataSource and Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.seletedIndexArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"DetailCell";
    DetailCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    subCategoriesJsonModel *subCatObj=[self.seletedIndexArray objectAtIndex:indexPath.row];
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        cell.detailLabel.text=subCatObj.subcatName;
       [cell.detailLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:12.0f]];
    }else{
        cell.detailLabel.text=subCatObj.subcatName;

    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
     if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
         
         return 25;

     }else{
         return 20;
     }
  }
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    subCategoriesJsonModel *subCatObj=[self.seletedIndexArray objectAtIndex:indexPath.row];
    EZServiceDetailVC *contorller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZServiceDetailVC"];
    contorller.sub_id=subCatObj.subcatId;
    [self.navigationController pushViewController:contorller animated:YES];
}

-(void)reloadTableWithIndex:(CategoryCell*)cell {
    
    AvailableServiceJsonModel *obj=[_categoryArray objectAtIndex:cell.tag-1];
    self.seletedIndexArray=obj.subCategoriesArray;
    [cell.detailTableView reloadData];
}

#pragma mark- Api Method

-(void)getAllCategory{
    
    bool check=[EZCommonMethod checkInternetConnection];
    if(!check){
        [EZCommonMethod showAlert:nil message:@"Please check your internet connection"];
        return;
    }
    NSString *urlString=[NSString stringWithFormat:@"%@%@",BaseUrl,availableServices];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[NetworkManager Instance] getRequestWithUrl:urlString parameter:nil onCompletion:^(id dict) {

        NSError* errorJson=nil;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:dict
                                                             options:kNilOptions
                                                               error:&errorJson];
        NSLog(@"%@",json);
        
        if ([[json valueForKey:@"success"] boolValue]==1) {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            self.categoryArray=[AvailableServiceJsonModel arrayOfModelsFromDictionaries:[json valueForKey:@"value"] error:&errorJson];
            NSLog(@"%@",self.categoryArray);
            [_categoryCollection reloadData];
        }
        
    } onError:^(NSError *Error) {
        NSLog(@"%@",Error);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        //[EZCommonMethod showAlert:nil message:@"Please try again"];
        
    }];
}
- (IBAction)slideMenuAction:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:^{}];
}

@end
