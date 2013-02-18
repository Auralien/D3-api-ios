//
//  D3DataManager.h
//  D3-api-ios
//
//  Created by Maxim Mikheev on 17.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3Object.h"

#define kD3DataManagerCareerPath              @"http://%@.battle.net/api/d3/profile/"

typedef void (^D3DataManagerFetchURLSuccessBlock)(NSDictionary *json);
typedef void (^D3DataManagerFetchURLFailureBlock)(NSError *error);

@interface D3DataManager : D3Object <NSURLConnectionDataDelegate>

/// Methods starts request to server
- (void)fetchDataWithURL:(NSString *)url
            successBlock:(D3DataManagerFetchURLSuccessBlock)successBlock
            failureBlock:(D3DataManagerFetchURLFailureBlock)failureBlock;

@end
