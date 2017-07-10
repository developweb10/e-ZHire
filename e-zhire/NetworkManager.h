//
//  NetworkManager.h
//  e-zhire
//
//  Created by Developer on 12/06/17.
//  Copyright © 2017 Inext. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void(^JSonRepresentation)(id dict);
typedef void(^errorBlock)(NSError *Error);

@interface NetworkManager : NSObject<NSURLSessionDelegate>

+(NetworkManager*)Instance;

-(void)getRequestWithUrl:(NSString*)url parameter:(id)parameter onCompletion:(JSonRepresentation)completion onError:(errorBlock)Error;

-(void)postRequestWithUrl:(NSString*)url parameter:(id)parameter onCompletion: (JSonRepresentation)completion onError:(errorBlock)Error;

-(void)putRequestWithUrl:(NSString*)url parameter:(id)parameter onCompletion:(JSonRepresentation)completion onError:(errorBlock)Error;

-(void)postImageWithurl:(NSString*)url image:(UIImage*)image filename:(NSString*)filename parameter:(NSDictionary*)parameter fileurl:(NSURL*)fileurl onCompletion:(JSonRepresentation)completion onError:(errorBlock)Error;

-(void)putImageWithurl:(NSString*)url image:(UIImage*)image filename:(NSString*)filename parameter:(NSDictionary*)parameter fileurl:(NSURL*)fileurl onCompletion:(JSonRepresentation)completion onError:(errorBlock)Error;

-(void)deleteRequestWithUrl:(NSString*)url parameter:(id)parameter onCompletion:(JSonRepresentation)completion onError:(errorBlock)Error;

-(void)postFileRequest:(NSString*)url image:(UIImage*)image filename:(NSString*)filename parameter:(NSDictionary*)parameter fileurl:(NSURL*)fileurl onCompletion:(JSonRepresentation)completion onError:(errorBlock)Error;

@property (nonatomic,retain) AFHTTPSessionManager *manager;

@end
