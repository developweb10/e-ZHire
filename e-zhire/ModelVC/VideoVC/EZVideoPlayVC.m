//
//  EZVideoPlayVC.m
//  e-zhire
//
//  Created by Developer on 05/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "EZVideoPlayVC.h"

@interface EZVideoPlayVC ()

@end

@implementation EZVideoPlayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([self.classType isEqualToString:@"WHAT WE DO"]) {
        self.typeLbl.text = self.classType;
      //  [self.webVideo loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://player.vimeo.com/video/151801075"]]];
    }
    else
    {
  //  [self.webVideo loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://player.vimeo.com/video/167352978"]]];
    }
     [self getDataFromServer];
    [self ipadFontSize];
}
-(void)ipadFontSize{
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        [self.typeLbl setFont:[UIFont fontWithName:@"OSWALD-BOLD" size:18.0f]];
    }else{
        
    }
}
#pragma mark- API Method

- (void) getDataFromServer{
    NSString*videUrl;
    bool check=[EZCommonMethod checkInternetConnection];
    if(!check){
        [EZCommonMethod showAlert:nil message:@"Please check your internet connection"];
        return;
    }
    if ([self.classType isEqualToString:@"WHAT WE DO"]) {
        videUrl=[NSString stringWithFormat:@"%@%@",BaseUrl,whatwedo_Api];
     } else{
        videUrl=[NSString stringWithFormat:@"%@%@",BaseUrl,howitWork_Api];
    }
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[NetworkManager Instance]getRequestWithUrl:videUrl parameter:nil onCompletion:^(id dict) {
        NSError* error;
        dataDict = [NSJSONSerialization JSONObjectWithData:dict
                                                             options:kNilOptions
                                                               error:&error];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        if ([[dataDict valueForKey:@"success"] boolValue]==1){
        if ([self.classType isEqualToString:@"WHAT WE DO"]) {
        [self.webVideo loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[[dataDict valueForKey:@"value"] valueForKey:@"video_url"]]]];
            self.typeLbl.text = [[dataDict valueForKey:@"value"]valueForKey:@"title"];
        }
        else{
        [self.webVideo loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[[dataDict valueForKey:@"value"] valueForKey:@"video"]]]];
            self.typeLbl.text = [[dataDict valueForKey:@"value"]valueForKey:@"title"];
        }
        }
    } onError:^(NSError *Error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
//        [EZCommonMethod showAlert:nil message:@"Please try again"];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)slideMenuAction:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:^{}];

}
@end
