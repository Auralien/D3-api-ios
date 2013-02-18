//
//  D3DataManager.m
//  D3-api-ios
//
//  Created by Maxim Mikheev on 17.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3DataManager.h"

@interface D3DataManager ()

@property (nonatomic, strong) NSMutableData *requestData;

@property (nonatomic, copy) D3ObjectDictionaryForURLResultingBlock resultBlock;
@property (nonatomic, copy) D3ObjectForAccessFailureBlock failureBlock;

@end

@implementation D3DataManager

/// Methods starts request to server
- (void)fetchDataWithURL:(NSString *)urlVal
            successBlock:(D3ObjectDictionaryForURLResultingBlock)resultingBlockVal
              errorBlock:(D3ObjectForAccessFailureBlock)failureBlockVal {
    self.resultBlock = resultingBlockVal;
    self.failureBlock = failureBlockVal;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlVal]
                                             cachePolicy:NSURLRequestUseProtocolCachePolicy
                                         timeoutInterval:5.0];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if (connection) {
        self.requestData = [NSMutableData data];
    } else {
        NSLog(@"Connection failed");
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [self.requestData setLength:0];
    NSLog(@"connection:didReceiveResponse:");
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.requestData appendData:data];
    NSLog(@"connection:didReceiveData:");
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Connection failed! Error - %@ %@", [error localizedDescription], [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
    self.failureBlock(error);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"Succeeded! Recieved %d bytes of data", [self.requestData length]);
    
    //NSString *jsonString = [[NSString alloc] initWithData:self.requestData encoding:NSUTF8StringEncoding];
    //NSLog(@"JSON: %@", jsonString);
    
    NSError *error = nil;
    NSDictionary *object = [NSJSONSerialization JSONObjectWithData:self.requestData options:0 error:&error];
    //dispatch_async(dispatch_get_main_queue(), ^{
        self.resultBlock(object);
    //});
    //NSLog(@"object = %@", object);
    if (!object) {
        NSLog(@"Error parsing JSON! %@", [error localizedDescription]);
    }
}

@end
