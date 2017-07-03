//
//  EZTodoListVC.m
//  e-zhire
//
//  Created by Developer on 03/07/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZTodoListVC.h"
#import "TodoListCell.h"

@interface EZTodoListVC ()

@property(nonatomic)NSInteger totalCell;
@property(nonatomic)NSInteger selectIndex;
@property(nonatomic,strong)NSMutableArray*AddListArr;
@property(nonatomic,strong)NSMutableArray*checkArray;
@end

@implementation EZTodoListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.AddListArr=[NSMutableArray new];
     self.checkArray=[NSMutableArray new];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addListAction:(id)sender {
    [ self.AddListArr addObject: self.addListTextFiled.text];
    [self.checkArray addObject:@"0"];
    
    NSLog(@"%@",self.checkArray);
    
    [_addListTableView reloadData];
}
#pragma mark- TableView DataSource and Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return  self.AddListArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *MyIdentifier = @"TodoListCell";
    TodoListCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    cell.addTextLabel.text= [self.AddListArr objectAtIndex:indexPath.row];
    cell.deleteBtn.tag=indexPath.row;
    [cell.deleteBtn addTarget:self action:@selector(deleteClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    NSInteger chek=[[self.checkArray objectAtIndex:indexPath.row] integerValue];
    if (chek==0) {
        cell.checkimg.image=[UIImage imageNamed:@""];
        cell.actionItemMarkLabel.text=@"-Action Item marked as uncomplete.";
        cell.actionItemMarkLabel.textColor=[UIColor redColor];
        cell.checkimg.backgroundColor=[UIColor whiteColor];


    }else{
        
        cell.actionItemMarkLabel.text=@"-Action Item marked as complete.";
        cell.actionItemMarkLabel.textColor=[UIColor greenColor];
        cell.checkimg.image=[UIImage imageNamed:@"Check"];
        cell.checkimg.backgroundColor=[UIColor blueColor];
        
    }

    return cell;
}
-(IBAction)deleteClicked:(UIButton*)sender{
    [self.AddListArr removeObjectAtIndex:sender.tag];
    [self.checkArray removeObjectAtIndex:sender.tag];
    [self.addListTableView reloadData];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger check=[[self.checkArray objectAtIndex:indexPath.row] integerValue];
    NSLog(@"Before Edit:--- %@",self.checkArray);
    
    if (check==0) {
        [self.checkArray removeObjectAtIndex:indexPath.row];
        [self.checkArray insertObject:@"1" atIndex:indexPath.row];
    }
    else{
        [self.checkArray removeObjectAtIndex:indexPath.row];
        [self.checkArray insertObject:@"0" atIndex:indexPath.row];
    }
    NSLog(@"After Edit:--- %@",self.checkArray);
    [_addListTableView reloadData];
    
 }

@end
