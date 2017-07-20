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
    NSInteger currentImage;
    NSMutableArray*serviceArr;
    NSMutableArray*ImageArr;
    NSMutableArray*reviewRatingArr;
    NSMutableArray*priceBox;
 
}
@end

@implementation EZReviewVC

- (void)viewDidLoad {
    [super viewDidLoad];
   // Do any additional setup after loading the view.
    serviceArr=[[NSMutableArray alloc]init];
    ImageArr=[[NSMutableArray alloc]init];
    reviewRatingArr=[[NSMutableArray alloc]init];
    priceBox=[[NSMutableArray alloc]init];
    self.previousIndex=-2;
    self.webView.delegate=self;
 //imageArr=[NSArray arrayWithObjects:@"clean",@"banner1",@"banner2",@"banner3",@"banner4",@"banner5",@"banner6", nil];
    [self ipadFontSize];
    NSLog(@"%@",_searchId);
    NSLog(@"%@",_dateId);
    [self reviewPostApi];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.menuContainerViewController setPanMode:MFSideMenuPanModeNone];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark- Post Api implement

-(void)reviewPostApi{
    bool checkNet=[EZCommonMethod checkInternetConnection];
    if(!checkNet){
        [EZCommonMethod showAlert:nil message:@"Please check your internet connection"];
        return;
    }
    NSString*urlStr=[NSString stringWithFormat:@"%@%@",BaseUrl,reviewmyProfile_Api];
    NSDictionary*parameter=@{@"dataid":_dateId,@"data_id":_searchId};
   // {"dataid":"2105","data_id":"reqassoc-GAA000410"}
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[NetworkManager Instance]postRequestWithUrl:urlStr parameter:parameter onCompletion:^(id dict) {
        NSLog(@"%@",dict);
        NSError* error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:dict
                                                             options:kNilOptions
                                                               error:&error];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        if([json valueForKey:@"aboutme"]){
            self.aboutTextLabel.text=[json valueForKey:@"aboutme"];
            serviceArr=[json valueForKey:@"services"];
            NSString*videoUrl=[json valueForKey:@"video"];
//          [self.webView loadRequest:[NSURLRequest requestWithURL:videoUrl]];
            NSString*thumbnailImage=[json valueForKey:@"thumbnail"];
            ImageArr=[json valueForKey:@"image"];
            NSString *getImagePath = [ImageArr objectAtIndex:0];
            [self.photoImgage sd_setImageWithURL:[NSURL URLWithString:getImagePath] placeholderImage:[UIImage imageNamed:@"serivePlaceHolder"]];
            
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[json valueForKey:@"video"]]]];

            reviewRatingArr=[json valueForKey:@"Review_rating"];
            priceBox=[json valueForKey:@"price-box"];
            [self.tableView reloadData];
            [self.serviceTableView reloadData];
            [self.firstCollectionView reloadData];
            [self.secondCollectionView reloadData];
        }
        else{
            [EZCommonMethod showAlert:nil message:@"There is some problem to proceed"];
        }
        
    } onError:^(NSError *Error) {
        NSLog(@"%@:",Error);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
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
     if (collectionView==self.firstCollectionView) {
      return serviceArr.count;
         
     }else{
         
       return ImageArr.count;
     }
}
// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView==self.firstCollectionView) {
        EZAboutDetailCellVC *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"EZAboutDetailCellVC" forIndexPath:indexPath];
        cell.nameTrandLabel.text=[serviceArr objectAtIndex:indexPath.row ];
        if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
            [cell.nameTrandLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:16.0f]];
            
        }else{
        }
        return cell;
        
    }else{
        EZPhotoCellVC *secCell=[collectionView dequeueReusableCellWithReuseIdentifier:@"EZPhotoCellVC" forIndexPath:indexPath];
        NSString*ImgStr=[ImageArr objectAtIndex:indexPath.row];
        [secCell.clientProfileImage sd_setImageWithURL:[NSURL URLWithString:ImgStr] placeholderImage:[UIImage imageNamed:@"serivePlaceHolder"]];
        
    
//        secCell.clientProfileImage.image=[UIImage imageNamed:[ImageArr objectAtIndex:indexPath.row]];
        
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
        NSString *getImagePath = [ImageArr objectAtIndex:indexPath.row];
        [self.photoImgage sd_setImageWithURL:[NSURL URLWithString:getImagePath] placeholderImage:[UIImage imageNamed:@"serivePlaceHolder"]];
//       [self.photoImgage setImage:[UIImage imageNamed:getImagePath]];
        [self.secondCollectionView reloadData];
  }
}

#pragma mark- TableView DataSource and Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     if (tableView==self.tableView) {
          return reviewRatingArr.count;
         
     }else{
        return priceBox.count;
     }
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView==self.tableView) {
        static NSString *MyIdentifier = @"EZReviewCellVC";
        EZReviewCellVC *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        cell.nameLabel.text=[[reviewRatingArr objectAtIndex:indexPath.row]valueForKey:@"comment"];
        cell.dateLbl.text=[[reviewRatingArr objectAtIndex:indexPath.row]valueForKey:@"dateTime"];
        cell.commentDetailLabel.text=[[reviewRatingArr objectAtIndex:indexPath.row]valueForKey:@"rating-view"];
        NSString*ratValue = [NSString stringWithFormat:@"%@",[[reviewRatingArr objectAtIndex:indexPath.row]valueForKey:@"rating"]];
        cell.starView.allowsHalfStars=YES;
        cell.starView.minimumValue=0.0;
        cell.starView.maximumValue=5.0;
        cell.starView.emptyStarImage=[UIImage imageNamed:@"star-fill"];
        cell.starView.filledStarImage=[UIImage imageNamed:@"star-Full"];
        cell.starView.halfStarImage=[UIImage imageNamed:@"star-half"];
        CGFloat floatvalue=ratValue.floatValue;
        cell.starView.userInteractionEnabled=NO;
        cell.starView.value=floatvalue;
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
            [cell.nameLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:16.0f]];
            [cell.detailTextLabel setFont:[UIFont fontWithName:@"Oswald-Regular" size:16.0f]];
            
    }else{
            
     }
       return cell;
        
    }else{
        static NSString *cellId = @"EZClientPriceCell";
        EZClientPriceCell *cellService = [tableView dequeueReusableCellWithIdentifier:cellId];
        cellService.serviceNameLabel.text=[[priceBox objectAtIndex:indexPath.row]valueForKey:@"name"];
        cellService.servicePriceLabel.text=[@"$"stringByAppendingString:[[priceBox objectAtIndex:indexPath.row]valueForKey:@"price"]];
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
            NSString *textString = [[reviewRatingArr objectAtIndex:indexPath.row]valueForKey:@"rating-view"];
            CGSize labelSize=CGSizeMake([UIScreen mainScreen].bounds.size.width-70,0.0);
            CGRect labelRect = [textString boundingRectWithSize:labelSize
                                                        options:NSStringDrawingUsesLineFragmentOrigin
                                                     attributes:@{
                                                                  NSFontAttributeName : [UIFont systemFontOfSize:13.0]
                                                                  }
                                                        context:nil];
            return labelRect.size.height+70+20;
        }
        else
            return  70;
    }else{
        return  50;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.seletedIndex=indexPath.row;
    if (tableView==self.tableView) {
        [self.tableView beginUpdates];
        [self.tableView endUpdates];
    }
    else{
    }
}
#pragma mark- Button Arrow Action
- (IBAction)rightActionArrow:(UIButton*)sender {
    if(currentImage < ImageArr.count-1) {
        currentImage = currentImage+1;
        sender.enabled = currentImage == ImageArr.count-1?NO:YES;
        self.leftArrowBtn.enabled = YES;
        NSString *getImagePath = [ImageArr objectAtIndex:currentImage];
//        [self.photoImgage setImage:[UIImage imageNamed:getImagePath]];
          [self.photoImgage sd_setImageWithURL:[NSURL URLWithString:getImagePath] placeholderImage:[UIImage imageNamed:@"serivePlaceHolder"]];
        [self.secondCollectionView reloadData];
    }
}
- (IBAction)leftActionArrow:(UIButton*)sender {
    
    if (currentImage > 0) {
        currentImage = currentImage-1;
       sender.enabled = currentImage == 0?NO:YES;
       self.rightArrowBtn.enabled = YES;
        NSString *getImagePath = [ImageArr objectAtIndex:currentImage];
        
        [self.photoImgage sd_setImageWithURL:[NSURL URLWithString:getImagePath] placeholderImage:[UIImage imageNamed:@"serivePlaceHolder"]];

//        [self.photoImgage setImage:[UIImage imageNamed:getImagePath]];
        [self.secondCollectionView reloadData];
    }

}
- (IBAction)howReviewAction:(id)sender {
}

@end
