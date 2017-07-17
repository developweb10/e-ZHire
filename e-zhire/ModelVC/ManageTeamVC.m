//
//  ManageTeamVC.m
//  e-zhire
//
//  Created by Developer on 12/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "ManageTeamVC.h"
#import "ManageServiceCell.h"
#import "CreateTeamCell.h"
#import "AvailableServiceJsonModel.h"
@interface ManageTeamVC ()
{
    __weak  NSMutableArray *SubCateGoryArray;
}
@property(nonatomic,strong)NSMutableArray*categoryArr;
@property(nonatomic,strong)NSMutableArray*seletedIndexArray;
@end

@implementation ManageTeamVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.cretaeTeamTableView.hidden=YES;
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.menuContainerViewController setPanMode:MFSideMenuPanModeNone];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark- TableView DataSource and Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    if (self.manageTableView==tableView) {
        
        return 1;
    }else{
        
        return self.categoryArr.count;
    }

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (self.manageTableView==tableView) {
        
        return 2;
    }else{
        
        AvailableServiceJsonModel *obj=[self.categoryArr objectAtIndex:section];
        //__weak  NSMutableArray *SubCateGoryArray;
        SubCateGoryArray=obj.subCategoriesArray;
        return  SubCateGoryArray.count;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (self.cretaeTeamTableView==tableView)
    {
        return 30;
    }
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (tableView==_cretaeTeamTableView) {
        UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, _manageTableView.bounds.size.width, 30)];
        view.backgroundColor=[UIColor grayColor];
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(15, 0, _manageTableView.bounds.size.width, 25)];
        //  UILabel *label=[[UILabel alloc]initWithFrame:view.bounds];
        label.textColor=[UIColor lightGrayColor];
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

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (self.manageTableView==tableView) {
        static NSString *MyIdentifier = @"ManageServiceCell";
        ManageServiceCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];

        return cell;
        
    }else{
        
        static NSString *MyIdentifier = @"CreateTeamCell";
        CreateTeamCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        AvailableServiceJsonModel *obj=[self.categoryArr objectAtIndex:indexPath.section];
        SubCateGoryArray=obj.subCategoriesArray;
        subCategoriesJsonModel *subCatObj=[SubCateGoryArray objectAtIndex:indexPath.row];
        cell.serviceNameLbl.text=subCatObj.subcatName;
        
        return cell;
    }
 }
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.cretaeTeamTableView==tableView) {
        AvailableServiceJsonModel *obj=[self.categoryArr objectAtIndex:indexPath.section];
        SubCateGoryArray=obj.subCategoriesArray;
        subCategoriesJsonModel *subCatObj=[SubCateGoryArray objectAtIndex:indexPath.row];
        _serviceTypeLbl.text=subCatObj.subcatName;
        self.cretaeTeamTableView.hidden=YES;
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
            [self.cretaeTeamTableView reloadData];
        }
        
    } onError:^(NSError *Error) {
        NSLog(@"%@",Error);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
    }];
}

- (IBAction)createNewTeam:(id)sender {
    CGRect size=self.createTeamView.bounds;
    size.origin.x=70;
    size.origin.y=50;
    self.createTeamView.frame=size;
    self.createTeamView.hidden=NO;
    [self.view addSubview:self.createTeamView];
    self.cretaeTeamTableView.hidden=YES;
    self.manageTableView.userInteractionEnabled=NO;
    
}
- (IBAction)helpAction:(id)sender {
}
- (IBAction)chooseProfilePicAction:(id)sender {
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"" message:@"Change Profile image" preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *choosePhoto=[UIAlertAction actionWithTitle:@"Select From Photos" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *pickerView = [[UIImagePickerController alloc] init];
        pickerView.allowsEditing = YES;
        pickerView.delegate = self;
        [self presentViewController:pickerView animated:YES completion:NULL];
        [alertController dismissViewControllerAnimated:YES completion:nil];
        
    }];
    [alertController addAction:choosePhoto];
    UIAlertAction *actionCancel=[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    [alertController addAction:actionCancel];
    [self presentViewController:alertController animated:YES completion:nil];
}
 - (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    [picker dismissViewControllerAnimated:YES completion:NULL];
 }
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}
- (IBAction)serviceTypeAction:(id)sender {
    self.cretaeTeamTableView.hidden=NO;
    [self getAllCategory];
}
- (IBAction)createAction:(id)sender {
    
}
- (IBAction)closeViewAction:(id)sender {
    if (self.addSeriveBtn.selected==NO) {
        self.addSeriveBtn.selected=YES;
        self.createTeamView.hidden=NO;
        self.cretaeTeamTableView.hidden=YES;
      }
    else{
        self.addSeriveBtn.selected=NO;
        self.createTeamView.hidden=YES;
        self.cretaeTeamTableView.hidden=NO;
        self.manageTableView.userInteractionEnabled=YES;
    }

}
@end
