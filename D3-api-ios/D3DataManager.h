//
//  D3DataManager.h
//  D3-api-ios
//
//  Created by Maxim Mikheev on 17.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3Object.h"

typedef void (^D3ObjectDictionaryForURLResultingBlock)(NSDictionary *json);
typedef void (^D3ObjectForAccessFailureBlock)(NSError *error);

@interface D3DataManager : D3Object <NSURLConnectionDataDelegate>

/// Methods starts request to server
- (void)fetchDataWithURL:(NSString *)urlVal
            successBlock:(D3ObjectDictionaryForURLResultingBlock)resultingBlockVal
              errorBlock:(D3ObjectForAccessFailureBlock)failureBlockVal;

@end
