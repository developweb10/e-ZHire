//
//  EZServiceProviderVC.m
//  e-zhire
//
//  Created by Developer on 03/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZServiceProviderVC.h"
#import "EZServiceProviderCell.h"

@interface EZServiceProviderVC ()

@end

@implementation EZServiceProviderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.selectedIndex=-1;
    [self updateText];
    // Do any additional setup after loading the view.
    
    [self ipadFontsize];
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
    return 20;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    EZServiceProviderCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"EZServiceProviderCell" forIndexPath:indexPath];
    cell.contentView.layer.borderColor=(__bridge CGColorRef _Nullable)([UIColor grayColor]);
    cell.contentView.layer.borderWidth = 1.0f;
    cell.contentView.layer.borderColor = [UIColor colorWithRed:193/255.0 green:193/255.0 blue:193/255.0 alpha:1].CGColor;
    cell.contentView.layer.masksToBounds = YES;
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        [cell.descriptionLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:14.0f]];
        
    }else{
        
    }
    
    return cell;
}

-(void)updateText {

    // LINE SPACE
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:@"IF YOU HAVE THE SKILLS AND DESIRE TO MAKE MONEY AS AN INDEPENDENT SERVICE PROVIDER, BUT DON'T WANT TO WORRY ABOUT MARKETING, ADVERTISING,SCHEDULING,ACCOUNTIN,OFFICE STAFF OR GOVERNMENT REGULATIONS.......THEN E-ZHIRE IS FOR YOU."];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment                = NSTextAlignmentCenter;
    [style setLineSpacing:2];
    [mutableAttributedString addAttribute:NSParagraphStyleAttributeName
                                    value:style
                                    range:NSMakeRange(0, mutableAttributedString.length)];
    _upperLable.attributedText=mutableAttributedString;
    
    //  CHANGE LABLE COLOR
    self.clickLable.text=@"CLICK HERE TO LEARN MORE!";
    NSMutableAttributedString * stringAtr = [[NSMutableAttributedString alloc] initWithString:self.clickLable.text];
    [stringAtr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:173/255.f green:0/255.f blue:15/255.f alpha:1.0] range:NSMakeRange(0,10)];
    self.clickLable.attributedText = stringAtr;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.item==_selectedIndex) {
        return CGSizeMake([UIScreen mainScreen].bounds.size.width/2-15, 100);
    }
    return CGSizeMake([UIScreen mainScreen].bounds.size.width/2-15, 50);
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
@end
