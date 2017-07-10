//
//  EZInvoicesDetail.m
//  e-zhire
//
//  Created by Developer on 27/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZInvoicesDetail.h"
#import "InvoiceDetailCell.h"

@interface EZInvoicesDetail ()

@end

@implementation EZInvoicesDetail
@synthesize seletedIndex;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//     [self.tableView addSubview:self.adddresView];
//
    seletedIndex = -1;

    self.tableView.tableHeaderView=self.adddresView;
  self.disputView.hidden=YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- TableView DataSource and Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 2;
}
-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *) cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.row == [tableView numberOfRowsInSection:indexPath.section] - 1) {
        
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.item == 0) {
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"headerCell"];
        return cell;
    }
    static NSString *MyIdentifier = @"cell";
    InvoiceDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    cell.viewDetailAction.tag=indexPath.row;
    cell.disputBtn.tag=indexPath.row;
    [cell.viewDetailAction addTarget:self action:@selector(yourButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.disputBtn addTarget:self action:@selector(disputBtnClicked:) forControlEvents:UIControlEventTouchUpInside];


    return cell;
}
- (IBAction)disputBtnClicked:(UIButton*)sender {
    //[self.view addSubview:self.disputView];
    
    
    UIAlertView *testAlert = [[UIAlertView alloc] initWithTitle:@"Please Describe why you are Disputing this Event:"
                                                        message:@""
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"Done", nil];
    UITextView *textView = [UITextView new];
    [testAlert setValue: textView forKey:@"accessoryView"];
    [testAlert show];
    
}
- (IBAction)yourButtonClicked:(UIButton*)sender {
    if (sender.tag==seletedIndex) {
        seletedIndex=-1;
    }else{
        self.seletedIndex=sender.tag;
    }
//  self.seletedIndex=sender.tag;
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.item == 0) {
    return  303.0;
    }
    if (indexPath.row==seletedIndex) {
        
        return 250;
    }else{
       return 170;
    }
    return 170;
}


@end
