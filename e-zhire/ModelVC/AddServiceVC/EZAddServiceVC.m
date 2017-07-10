//
//  EZAddServiceVC.m
//  e-zhire
//
//  Created by Developer on 30/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZAddServiceVC.h"
#import "EZAddServiceCell.h"
#import "SelectSeriveCell.h"
#import "AvailableServiceJsonModel.h"
@interface EZAddServiceVC ()
{
    __weak  NSMutableArray *SubCateGoryArray;
}
@property (nonatomic) NSInteger totalCell;
@property(nonatomic,strong)NSMutableArray*categoryArr;
@property(nonatomic,strong)NSMutableArray*seletedIndexArray;

@end

@implementation EZAddServiceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.clictToaddserviceBn.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.clictToaddserviceBn.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.totalCell=2;
    self.selectServiceView.hidden=YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark- Button Action

- (IBAction)clickToAddServiceAction:(id)sender {
    self.totalCell+=1;
    [_addServiceTableView reloadData];
}



- (IBAction)helpAction:(id)sender {
    
}

- (IBAction)createServiceAction:(id)sender {
    
}

- (IBAction)saveChangesAction:(id)sender {
    
    for (int i=0; i < _totalCell; i++){
        EZAddServiceCell *theCell = (id)[self.addServiceTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
          UITextField*text=[theCell zipeCodeTextFiled2];
        NSLog(@"%ld",(long)text.tag);
        
        UITextField*text1=[theCell zipeCodeTextField];
        NSLog(@"%ld",(long)text1.tag);
    }
}


- (IBAction)teamAction:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Indivisual" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {

        self.selectTeamlabel.text=@"Indivisual";
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Team" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
       
        self.selectTeamlabel.text=@"Team";
    [self dismissViewControllerAnimated:YES completion:nil];
        
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }]];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (IBAction)selectSelectserviceAction:(UIButton*)sender {
    [self.view addSubview:self.selectServiceView];
    CGRect size=self.selectServiceView.bounds;
    size.origin.y=50;
    size.origin.x=37.5;
    self.selectServiceView.frame=size;
    self.selectServiceView.hidden=NO;
     [self getAllCategory];

    self.scrollView.userInteractionEnabled=NO;
}

- (IBAction)zipCodeLoctionActon:(id)sender {
}

- (IBAction)closepopupAction:(id)sender {
    self.selectServiceView.hidden=YES;
    self.scrollView.userInteractionEnabled=YES;
}
#pragma mark- TableView DataSource and Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.addServiceTableView==tableView) {
        
        return 2;
    }else{
        
       return self.categoryArr.count;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     if (self.addServiceTableView==tableView) {
         
         return _totalCell;
     }else{
         
         AvailableServiceJsonModel *obj=[self.categoryArr objectAtIndex:section];
        //__weak  NSMutableArray *SubCateGoryArray;
         SubCateGoryArray=obj.subCategoriesArray;
         return  SubCateGoryArray.count;
     }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
     if (self.serviceTableView==tableView)
     {
         return 30;
     }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (tableView==_serviceTableView) {
        UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, _addServiceTableView.bounds.size.width, 30)];
        view.backgroundColor=[UIColor grayColor];
        UILabel *label=[[UILabel alloc]initWithFrame:view.bounds];
        [label setFont:[UIFont fontWithName:@"Oswald-Regular" size:14.0f]];
        AvailableServiceJsonModel *obj=[self.categoryArr objectAtIndex:section];
        NSLog(@"%@",obj.catName);
        label.text=obj.catName;
        [view addSubview:label];
        label.textColor=[UIColor redColor];
        return view;
    }
    return nil;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.addServiceTableView==tableView) {
         static NSString *MyIdentifier = @"cell";
        EZAddServiceCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        cell.zipeCodeTextField.tag=indexPath.row+1000;
        cell.zipeCodeTextFiled2.tag=indexPath.row+100;
        cell.zipeCodeTextField.delegate=self;
        cell.zipeCodeTextFiled2.delegate=self;
        
     return cell;
        
    }else{
        
        static NSString *MyIdentifier = @"SelectSeriveCell";
        SelectSeriveCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        AvailableServiceJsonModel *obj=[self.categoryArr objectAtIndex:indexPath.section];
        SubCateGoryArray=obj.subCategoriesArray;
        subCategoriesJsonModel *subCatObj=[SubCateGoryArray objectAtIndex:indexPath.row];
        cell.catTextLabel.text=subCatObj.subcatName;

        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.serviceTableView==tableView) {
        AvailableServiceJsonModel *obj=[self.categoryArr objectAtIndex:indexPath.section];
        SubCateGoryArray=obj.subCategoriesArray;
        subCategoriesJsonModel *subCatObj=[SubCateGoryArray objectAtIndex:indexPath.row];
        _selectServiceLabel.text=subCatObj.subcatName;
        
      self.selectServiceView.hidden=YES;
      self.scrollView.userInteractionEnabled=YES;
    }else{
         
     }
}

#pragma mark- select service Api

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
            self.categoryArr=[AvailableServiceJsonModel arrayOfModelsFromDictionaries:[json valueForKey:@"value"] error:&errorJson];
            NSLog(@"%@",self.categoryArr);
            [self.serviceTableView reloadData];
        }
        
    } onError:^(NSError *Error) {
        NSLog(@"%@",Error);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        //[EZCommonMethod showAlert:nil message:@"Please try again"];
        
    }];
}

//- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
//{
//    switch (textField.tag)
//    {
//        case 0:
//          //  userName = textField.text;
//            break;
//            
//        case 1:
//            //passWord = textField.text;
//            break;
//    }
//    return YES;
//}
@end
