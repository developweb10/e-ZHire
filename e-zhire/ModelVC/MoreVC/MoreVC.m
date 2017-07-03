//
//  MoreVC.m
//  e-zhire
//
//  Created by Developer on 5/31/17.
//  Copyright © 2017 Inext. All rights reserved.
//

@interface MoreCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *menuNameLbl;
@property (weak, nonatomic) IBOutlet UIImageView *menuImage;

@end

@implementation MoreCell

@end

#import "MoreVC.h"
#import "EZVideoPlayVC.h"
#import "HappyCustomerVC.h"
#import "EZFaqVC.h"
@interface MoreVC ()

@end

@implementation MoreVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    menuArray = [NSArray arrayWithObjects:@"HOW IT WORKS",@"WHAT WE DO",@"HAPPY CUSTOMERS",@"FAQ",@"CONTACT",@"TERMS OF USE",@"PRIVACY POLICY",@"LOGIN",@"SERVICE PROVIDER INFO",@"ASSOCIATE FAQ'S", nil];
    menuImgArray = [NSArray arrayWithObjects:@"one",@"two",@"three",@"four",@"five",@"six",@"seven",@"eight",@"six", @"six",nil];
    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return menuArray.count;    //count number of row from counting array hear cataGorry is An Array
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"MoreCell";
    MoreCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    cell.menuNameLbl.text = [menuArray objectAtIndex:indexPath.row];
    cell.menuImage.image = [UIImage imageNamed:[menuImgArray objectAtIndex:indexPath.row]];
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        [cell.menuNameLbl setFont:[UIFont fontWithName:@"Oswald-Regular" size:20.0f]];
    }else{
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row == 3) {
        cell.backgroundColor = [UIColor colorWithRed:177.0/255.0 green:30.0/255.0 blue:6.0/255.0 alpha:1.0];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITabBarController *tabBarController = self.menuContainerViewController.centerViewController;
    UINavigationController *nav=(UINavigationController*)tabBarController.selectedViewController;
    nav.navigationBar.hidden=NO;
    if (indexPath.row==0) {
        UIViewController *contorller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZVideoPlayVC"];
        NSMutableArray *array=[nav.viewControllers mutableCopy];
        contorller.hidesBottomBarWhenPushed=NO;
        [array addObject:contorller];
        [nav setViewControllers:array];
        [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
    }else
    if (indexPath.row==1) {
        EZVideoPlayVC *contorller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZVideoPlayVC"];
        contorller.classType = @"WHAT WE DO";
        NSMutableArray *array=[nav.viewControllers mutableCopy];
        contorller.hidesBottomBarWhenPushed=NO;
        [array addObject:contorller];
        [nav setViewControllers:array];
        [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
        
    }
    else if(indexPath.row==2) {
       UIViewController *contorller=[self.storyboard instantiateViewControllerWithIdentifier:@"HappyCustomerVC"];
        NSMutableArray *array=[nav.viewControllers mutableCopy];
        contorller.hidesBottomBarWhenPushed=NO;
        [array addObject:contorller];
        [nav setViewControllers:array];
        [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
        
    }
    else if(indexPath.row==3){
        EZFaqVC *contorller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZFaqVC"];
        NSMutableArray *array=[nav.viewControllers mutableCopy];
        contorller.hidesBottomBarWhenPushed=NO;
        [array addObject:contorller];
        [nav setViewControllers:array];
        [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];

    }
    else if(indexPath.row==5){
        UIViewController *contorller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZTermVC"];
        NSMutableArray *array=[nav.viewControllers mutableCopy];
        contorller.hidesBottomBarWhenPushed=NO;
        [array addObject:contorller];
        [nav setViewControllers:array];
        [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];

    }
    else if(indexPath.row==6){
    
        UIViewController *contorller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZPrivacyVC"];
        NSMutableArray *array=[nav.viewControllers mutableCopy];
        contorller.hidesBottomBarWhenPushed=NO;
        [array addObject:contorller];
        [nav setViewControllers:array];
        [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
        
    }
    else if(indexPath.row==7){
        
        UIViewController *contorller=[self.storyboard instantiateViewControllerWithIdentifier:@"LoginVC"];
        NSMutableArray *array=[nav.viewControllers mutableCopy];
        contorller.hidesBottomBarWhenPushed=NO;
        [array addObject:contorller];
        [nav setViewControllers:array];
        [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];

    }
    else if(indexPath.row==8){
 
        UIViewController *contorller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZServiceProviderVC"];
        NSMutableArray *array=[nav.viewControllers mutableCopy];
        contorller.hidesBottomBarWhenPushed=NO;
        [array addObject:contorller];
        [nav setViewControllers:array];
        [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];

    }
    else if(indexPath.row==9){
        EZFaqVC *contorller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZFaqVC"];
        contorller.classType = @"ASSOCIATEFAQ'S";
        NSMutableArray *array=[nav.viewControllers mutableCopy];
        contorller.hidesBottomBarWhenPushed=NO;
        [array addObject:contorller];
        [nav setViewControllers:array];
        [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
        
    }
    else{
        UIViewController *contorller=[self.storyboard instantiateViewControllerWithIdentifier:@"EZContactVC"];
        NSMutableArray *array=[nav.viewControllers mutableCopy];
        contorller.hidesBottomBarWhenPushed=NO;
        [array addObject:contorller];
        [nav setViewControllers:array];
        [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
 }
    
    
}

+(void)movewithStoryBourdID:(UINavigationController*)navigationcontroler Id:(NSString*)strID animation:(bool)yes{
    UIStoryboard *stroyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *ininavigation = [stroyboard instantiateViewControllerWithIdentifier:strID];
    [navigationcontroler pushViewController:ininavigation animated:yes];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
