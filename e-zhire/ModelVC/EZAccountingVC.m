//
//  EZAccountingVC.m
//  e-zhire
//
//  Created by Developer on 03/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZAccountingVC.h"
#import "EZAccountingCell.h"
#import "HistoryCell.h"

@interface EZAccountingVC (){
    NSArray*accountingArr;
     NSArray*categoryArray;
    NSInteger selectIndex;
}
@end

@implementation EZAccountingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    accountingArr  =[NSArray arrayWithObjects:@"CURRENT PAY HISTORY",@"REVIEW & APPROVE EVENTS",@"EVENTS BEING PROCESSED",@"PAID EVENTS", nil];
       selectIndex=-1;

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
    return accountingArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *MyIdentifier = @"EZAccountingCell";
    EZAccountingCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (indexPath.row==0 && selectIndex==0) {
        cell.dateConstraintHeight.constant=20;
    }else{
        cell.dateConstraintHeight.constant=0;
    }
    cell.datelabel.tag=indexPath.row;
    cell.nameLabel.text=[accountingArr objectAtIndex:indexPath.row];
    cell.datelabel.text=@"01/01/2017 through 07/03/2017";
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==selectIndex) {
        for(EZAccountingCell *cell in tableView.visibleCells)
            {
         if ([cell isKindOfClass:[EZAccountingCell class]]) {
             
             if(cell.datelabel.tag==0 && selectIndex==0){
                 cell.dateConstraintHeight.constant=0;
             }
        }
    }
        selectIndex=-1;
    }else{
        
        for(EZAccountingCell *cell in tableView.visibleCells)
        {
        if ([cell isKindOfClass:[EZAccountingCell class]]) {
            
            selectIndex=indexPath.row;
            if(cell.datelabel.tag==0 && selectIndex==0){
                cell.dateConstraintHeight.constant=20;
            }
            else{
                cell.dateConstraintHeight.constant=0;
            }
       }
    }
    }
    [tableView beginUpdates];
    [tableView endUpdates];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (selectIndex==indexPath.row) {
        
      return 200;
    }else{
      return 50;
   }
}
#pragma mark - UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return accountingArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    HistoryCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"HistoryCell" forIndexPath:indexPath];
    cell.eventNameLabel.text=[accountingArr objectAtIndex:indexPath.row];
    cell.pricelabel.text=[accountingArr objectAtIndex:indexPath.row];
    
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *) indexPath {
    
    return CGSizeMake(([UIScreen mainScreen].bounds.size.width/3), 100);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
