//
//  EZFaqVC.m
//  e-zhire
//
//  Created by Developer on 31/05/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZFaqVC.h"
#import "EZFaqCell.h"
#import "MBProgressHUD.h"

@interface EZFaqVC ()


@end

@implementation EZFaqVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.seletedIndex=-1;
    self.previousIndex=-2;
    [self postClientMethod];
}
-(void)ipadFontSize{
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        [self.clientFaqBtn.titleLabel setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:20]];
    }else{
        
    }
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    if ([self.classType isEqualToString:@"ASSOCIATEFAQ'S"]) {
        [self.clientFaqBtn setTitle:self.classType forState:UIControlStateNormal];
          checkAssociate = YES;
        if (associateArray.count<=0) {
            [self postClientMethod];
        }
        //[self.faqTableView reloadData];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)slideMenuAction:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:^{}];
    
}
#pragma mark- Tableview dalegate and datasource--

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (checkAssociate == YES) {
        return associateArray.count;
    }
    return clientArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"EZFaqCell";
    
    EZFaqCell *cell = (EZFaqCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier forIndexPath:indexPath];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.arrowImgView.tag=indexPath.row;
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        [cell.labelQuestion setFont:[UIFont fontWithName:@"Oswald-Regular" size:18.0f]];
        [cell.labelAns setFont:[UIFont fontWithName:@"Oswald-Regular" size:15.0f]];

    }else{
        
    }
    if (checkAssociate == YES) {
        cell.labelQuestion.text = [[associateArray objectAtIndex:indexPath.row]valueForKey:@"title"];
        cell.labelAns.text = [[associateArray objectAtIndex:indexPath.row]valueForKey:@"content"];
    }else {
        cell.labelQuestion.text = [[clientArray objectAtIndex:indexPath.row] valueForKey:@"title"];
        cell.labelAns.text = [[clientArray objectAtIndex:indexPath.row]valueForKey:@"content"];
    }
    if(self.seletedIndex==indexPath.row)
        cell.arrowImgView.image=[UIImage imageNamed:@"upperArrow"];
    else
        cell.arrowImgView.image=[UIImage imageNamed:@"downArrow"];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if (self.seletedIndex==indexPath.row) {
        if (self.previousIndex==self.seletedIndex) {
            self.previousIndex=-1;
            return 70;
        }
        self.previousIndex=self.seletedIndex;
        NSString *textString;
        if (checkAssociate == YES) {
            textString = [[associateArray objectAtIndex:indexPath.row]valueForKey:@"content"];
        }else
        {
        textString = [[clientArray objectAtIndex:indexPath.row]valueForKey:@"content"];
        }
        CGSize labelSize=CGSizeMake([UIScreen mainScreen].bounds.size.width-70,0.0);
        CGRect labelRect = [textString boundingRectWithSize:labelSize
                                                    options:NSStringDrawingUsesLineFragmentOrigin
                                                 attributes:@{
                                                              NSFontAttributeName : [UIFont systemFontOfSize:13.0]
                                                              }
                                                    context:nil];
        return labelRect.size.height+70+10;
    }
    else
        return  70;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.seletedIndex=indexPath.row;
    for (EZFaqCell *cell in tableView.visibleCells) {
        if ([cell isKindOfClass:[EZFaqCell class]]) {
            if (_previousIndex==_seletedIndex) {
                cell.arrowImgView.image=[UIImage imageNamed:@"downArrow"];
            }
            else {
                if (cell.arrowImgView.tag == self.seletedIndex) {
                    cell.arrowImgView.image=[UIImage imageNamed:@"upperArrow"];
                }else
                    cell.arrowImgView.image=[UIImage imageNamed:@"downArrow"];
            }
        }
    }
    [self.faqTableView beginUpdates];
    [self.faqTableView endUpdates];
}
#pragma mark-API
-(void)postClientMethod{
    bool check=[EZCommonMethod checkInternetConnection];
    if(!check){
        [EZCommonMethod showAlert:nil message:@"Please check your internet connection"];
        
        return;
    }
    NSString*strUrl=[NSString stringWithFormat:@"%@%@",BaseUrl,faq_Api];
    NSDictionary*parameter;
    if(checkAssociate){
      parameter=@{@"faq_page":@"associate" };

    }
    else{
       parameter =@{@"faq_page":@"client" };

  }
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[NetworkManager Instance]postRequestWithUrl:strUrl parameter:parameter onCompletion:^(id dict) {
        NSLog(@"%@",dict);
        NSError* error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:dict
                                                             options:kNilOptions
                                                               error:&error];
        
        NSLog(@"%@",json);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        if ([[json valueForKey:@"success"] boolValue]==1) {
            if(checkAssociate){
               associateArray =[json objectForKey:@"value"];
               [self.faqTableView reloadData];
            }else{
                clientArray=[json objectForKey:@"value"];
                [self.faqTableView reloadData];
            }
        }
        
    } onError:^(NSError *Error) {
         NSLog(@"%@",Error);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
       // [EZCommonMethod showAlert:nil message:@"Please try again"];
    }];
}


@end
