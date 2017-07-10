//
//  EZServiceProviderVC.m
//  e-zhire
//
//  Created by Developer on 03/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZServiceProviderVC.h"
#import "EZServiceProviderCell.h"
#import "serviceProviderJsonModel.h"

@interface EZServiceProviderVC ()
{
    NSDictionary* json;
}
@end

@implementation EZServiceProviderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.selectedIndex=-1;
   // [self updateText];
    // Do any additional setup after loading the view.
    [self ipadFontsize];
    [self getServiceProvide];
}
-(void)ipadFontsize{
if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
    [self.upperLable setFont:[UIFont fontWithName:@"Oswald-Regular" size:12.0f]];
    [self.clickLable setFont:[UIFont fontWithName:@"Oswald-Regular" size:12.0f]];
   
}else{
    
}
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated {
   self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.row == [collectionView numberOfItemsInSection:indexPath.section] - 1) {
       //     [self reloadDataFromNetwork];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.serviceProviderArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    EZServiceProviderCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"EZServiceProviderCell" forIndexPath:indexPath];
    cell.contentView.layer.borderColor=(__bridge CGColorRef _Nullable)([UIColor grayColor]);
    cell.contentView.layer.borderWidth = 1.0f;
    cell.contentView.layer.borderColor = [UIColor colorWithRed:193/255.0 green:193/255.0 blue:193/255.0 alpha:1].CGColor;
    serviceProviderJsonModel*obj=[self.serviceProviderArr objectAtIndex:indexPath.row];
     cell.headerLable.text=obj.catName;
     cell.descriptionLabel.text=obj.catDescription;
    cell.contentView.layer.masksToBounds = YES;
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        [cell.descriptionLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:14.0f]];
        
    }else{
        
    }
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.item==_selectedIndex) {
        return CGSizeMake([UIScreen mainScreen].bounds.size.width/2-15, 100);
    }
    return CGSizeMake([UIScreen mainScreen].bounds.size.width/2-15, 55);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.item==_selectedIndex) {
         _selectedIndex=-1;
          [collectionView setCollectionViewLayout:[[UICollectionViewFlowLayout alloc] init] animated:YES];
      }
      else{
          self.selectedIndex=indexPath.item;
          [collectionView setCollectionViewLayout:[[UICollectionViewFlowLayout alloc] init] animated:YES];
      }
  }

- (IBAction)slideMenuAction:(id)sender {
   [self.menuContainerViewController toggleLeftSideMenuCompletion:^{}];

}
#pragma mark-API
-(void)getServiceProvide{
    bool check=[EZCommonMethod checkInternetConnection];
    if(!check){
        [EZCommonMethod showAlert:nil message:@"Please check your internet connection"];
        return;
    }
    NSString *urlString=[NSString stringWithFormat:@"%@%@",BaseUrl,serviceProvider];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[NetworkManager Instance] getRequestWithUrl:urlString parameter:nil onCompletion:^(id dict) {
        NSError* errorJson=nil;
         json = [NSJSONSerialization JSONObjectWithData:dict
                                                             options:kNilOptions
                                                               error:&errorJson];
        
        NSLog(@"%@",json);
        if ([[json valueForKey:@"success"] boolValue]==1) {
            self.upperLable.text=[json valueForKey:@"description"];
        self.serviceProviderTitileLabel.text=[json valueForKey:@"title"];
        self.serviceProviderArr=[serviceProviderJsonModel arrayOfModelsFromDictionaries:[json valueForKey:@"value"] error:&errorJson];
            NSLog(@"%@",self.serviceProviderArr);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
           [self.serviceCollectionView reloadData];
        }
        
    } onError:^(NSError *Error) {
        NSLog(@"%@",Error);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        //[EZCommonMethod showAlert:nil message:@"Please try again"];
        
    }];
}

@end
