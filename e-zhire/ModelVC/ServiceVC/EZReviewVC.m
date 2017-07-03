//
//  EZReviewVC.m
//  e-zhire
//
//  Created by Developer on 23/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZReviewVC.h"
#import "EZPhotoCellVC.h"
#import "EZAboutDetailCellVC.h"
#import "EZReviewCellVC.h"
#import "EZClientPriceCell.h"

@interface EZReviewVC ()
{
    NSArray*imageArr;
    NSInteger currentImage;
}
@end

@implementation EZReviewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 imageArr=[NSArray arrayWithObjects:@"clean",@"banner1",@"banner2",@"banner3",@"banner4",@"banner5",@"banner6", nil];
    
    self.photoImgage.image=[UIImage imageNamed:[imageArr objectAtIndex:currentImage]];
    NSString *textStr = @"Professional Summary:\nExperienced Child Care Provider, mother and teacher who loves children and has an excellent rapport with them.Able to communicate even difficult issues to parents when it is in the best interest of the child.\n\nExperience:\n*Monitored behavior of children to ensure their safety.\n*Kept records of children's behavior and progress and provided updates to parents.one\n*Notified parents of any potential behavioral problems.\n*Organized schedules, developed routines and taught good hygiene habits.\nOctober 2004 to January 2009 Mary Popovich Home Child Care – New Parkland, CA Home Child Care Provid\n*Conducted home child care for six children during the day.\n*Complied with all state regulations for safety, passed home inspection and criminal background check.\n*Reviewed check list with parents regarding allergies, food preferences and other issues specific to their children.\n*Provided healthy meals and snacks, play time and educational games.\nJune 2001 to September 2004 New Parkland, CA and surrounding area Freelance Child Care Provider\n*Before parents left for the evening, ensured all emergency contact numbers and procedures were provided.\n*Provided babysitting services for family and friends, primarily in the evenings.\n*Prepared meals,\n supervised bath time and ensured children got to bed on time.\n*Supervised play time and ensured toys were put away before bedtime.\n*Client list grew to the level that no new clients could be accepted.\nEducation:\n2009 New Parkland Community College, New Parkland, CA Associate Degree in Early Childhood Education.hshfjhdhfh";
    
    self.aboutTextLabel.text=textStr;
    [self ipadFontSize];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)ipadFontSize{
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        [self.videoPhotoLabel setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:22.0f]];
        [self.reviewLabel setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:22.0f]];
        [self.commentLabel setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:20.0f]];
        [self.ratingLabel setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:20.0f]];
         [self.aboutTextLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:18.0f]];
    }else{
        
  }
}
#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == [collectionView numberOfItemsInSection:indexPath.section] - 1) {
        //     [self reloadDataFromNetwork];
    }
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 4;
}
// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView==self.firstCollectionView) {
        EZAboutDetailCellVC *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"EZAboutDetailCellVC" forIndexPath:indexPath];
        if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
            [cell.nameTrandLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:16.0f]];
        }else{
        }
        return cell;
        
    }else{
        EZPhotoCellVC *secCell=[collectionView dequeueReusableCellWithReuseIdentifier:@"EZPhotoCellVC" forIndexPath:indexPath];
        secCell.clientProfileImage.image=[UIImage imageNamed:[imageArr objectAtIndex:indexPath.row]];
        
        return secCell;
    }
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath  {
    
  if (collectionView ==self.firstCollectionView){
        
  }
  else{
        currentImage=indexPath.item;
        self.leftArrowBtn.enabled = YES;
        self.rightArrowBtn.enabled = YES;
        NSString *getImagePath = [imageArr objectAtIndex:indexPath.row];
        [self.photoImgage setImage:[UIImage imageNamed:getImagePath]];
        [self.secondCollectionView reloadData];
  }
}

#pragma mark- TableView DataSource and Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (tableView==self.tableView) {
        static NSString *MyIdentifier = @"EZReviewCellVC";
        EZReviewCellVC *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
            [cell.nameLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:16.0f]];
            [cell.detailTextLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:16.0f]];

    }else{
            
     }
       return cell;
        
    }else{
        static NSString *cellId = @"EZClientPriceCell";
        EZClientPriceCell *cellService = [tableView dequeueReusableCellWithIdentifier:cellId];
        if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
            [cellService.serviceNameLabel setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:20.0f]];
            [cellService.servicePriceLabel setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:20.0f]];
            
        }else{
            
        }
        return cellService;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if (tableView==self.tableView) {
        if (self.seletedIndex==indexPath.row) {
            if (self.previousIndex==self.seletedIndex) {
                self.previousIndex=-1;
                return 70;
            }
            self.previousIndex=self.seletedIndex;
            NSString *textString;
            //textString = [[clientArray objectAtIndex:indexPath.row]valueForKey:@"content"];
            CGSize labelSize=CGSizeMake([UIScreen mainScreen].bounds.size.width-70,0.0);
            CGRect labelRect = [textString boundingRectWithSize:labelSize
                                                        options:NSStringDrawingUsesLineFragmentOrigin
                                                     attributes:@{
                                                                  NSFontAttributeName : [UIFont systemFontOfSize:13.0]
                                                                  }
            context:nil];
            return labelRect.size.height+70+10;
        }
        else{
            return  70;
        }
    }else{
        return  50;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.seletedIndex=indexPath.row;
    if (tableView==self.tableView) {
    for (EZReviewCellVC *cell in tableView.visibleCells) {
        if ([cell isKindOfClass:[UITableViewCell class]]) {
            if (_previousIndex==_seletedIndex) {
                cell.arrow_iconImg.image=[UIImage imageNamed:@"downArrow"];
            }
            else {
                if (cell.arrow_iconImg.tag == self.seletedIndex) {
                   cell.arrow_iconImg.image=[UIImage imageNamed:@"upperArrow"];
                
                }else{
                 cell.arrow_iconImg.image=[UIImage imageNamed:@"downArrow"];
            }
        }
    }
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
}
    }else{
          
}
}
#pragma mark- Button Arrow Action
- (IBAction)rightActionArrow:(UIButton*)sender {
    if(currentImage < imageArr.count-1) {
        currentImage = currentImage+1;
        sender.enabled = currentImage == imageArr.count-1?NO:YES;
        self.leftArrowBtn.enabled = YES;
        NSString *getImagePath = [imageArr objectAtIndex:currentImage];
        [self.photoImgage setImage:[UIImage imageNamed:getImagePath]];
        [self.secondCollectionView reloadData];
    }
}
- (IBAction)leftActionArrow:(UIButton*)sender {
    
    if (currentImage > 0) {
        currentImage = currentImage-1;
       sender.enabled = currentImage == 0?NO:YES;
       self.rightArrowBtn.enabled = YES;
        NSString *getImagePath = [imageArr objectAtIndex:currentImage];
        [self.photoImgage setImage:[UIImage imageNamed:getImagePath]];
        [self.secondCollectionView reloadData];
    }

}
@end
