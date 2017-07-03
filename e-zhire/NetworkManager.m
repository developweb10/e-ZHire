//
//  NetworkManager.m
//  e-zhire
//
//  Created by Developer on 12/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import "NetworkManager.h"
#import "Reachability.h"
#import "AppDelegate.h"

@implementation NetworkManager

static NetworkManager *SharedMyObejct = nil;

+(NetworkManager*)Instance
{
    //static SharedObject* singleton = nil;
    //    if (singleton == nil)
    //        singleton = [[SharedObject alloc] init];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SharedMyObejct = [[self alloc]init];
    });return SharedMyObejct;
}

-(id)init {
    if (SharedMyObejct) {
        self=SharedMyObejct;
    } else if (self=[super init]) {
        SharedMyObejct=self;
        self.manager=[AFHTTPSessionManager manager];
    }
    return  self;
}

-(void)getRequestWithUrl:(NSString*)url parameter:(id)parameter onCompletion:(JSonRepresentation)completion onError:(errorBlock)Error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
    
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    if (networkStatus == NotReachable) {
        NSLog(@"There IS NO internet connection");
        [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
    } else {    
        NSLog(@"There IS internet connection");
    }
    //  AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [_manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    // [_manager.requestSerializer setTimeoutInterval:900];
    //   manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    //  manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [[NSUserDefaults standardUserDefaults]valueForKey:@""];
    
    //[manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [_manager GET:url parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if(responseObject) {
            [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
            
            completion(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        
        Error(error);
    }];
}
-(void)postRequestWithUrl:(NSString*)url parameter:(id)parameter onCompletion:(JSonRepresentation)completion onError:(errorBlock)Error
{
    // AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    // manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //   manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
    
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    if (networkStatus == NotReachable) {
        NSLog(@"There IS NO internet connection");
        [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
        
        
    } else {
        NSLog(@"There IS internet connection");
    }
    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [_manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    _manager.requestSerializer.timeoutInterval=60;
    
    // [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [_manager POST:url parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         if(responseObject)
         {
             completion(responseObject);
             [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
             
         }
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         Error(error);
         NSLog(@"error: %@", error);
         [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
         
     }];
}


@end
