//
//  D3DataManager.m
//  D3-api-ios
//
//  Created by Maxim Mikheev on 17.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3DataManager.h"

@interface D3DataManager ()

@property (nonatomic, strong) NSMutableData *rawJSONData;
@property (nonatomic, copy) D3DataManagerFetchURLSuccessBlock resultBlock;
@property (nonatomic, copy) D3DataManagerFetchURLFailureBlock failureBlock;

@end

@implementation D3DataManager

/// Methods starts request to server
- (void)fetchDataWithURL:(NSString *)url
            successBlock:(D3DataManagerFetchURLSuccessBlock)successBlock
            failureBlock:(D3DataManagerFetchURLFailureBlock)failureBlock {
    self.resultBlock = successBlock;
    self.failureBlock = failureBlock;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]
                                             cachePolicy:NSURLRequestUseProtocolCachePolicy
                                         timeoutInterval:5.0];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if (connection) {
        self.rawJSONData = [NSMutableData data];
    } else {
        NSLog(@"Connection failed!");
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [self.rawJSONData setLength:0];
    NSLog(@"connection:didReceiveResponse:");
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.rawJSONData appendData:data];
    NSLog(@"connection:didReceiveData:");
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Connection failed! Error - %@ %@", [error localizedDescription], [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
    self.failureBlock(error);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"Succeeded! Recieved %d bytes of data", [self.rawJSONData length]);
    
    //NSString *jsonString = [[NSString alloc] initWithData:self.rawJSONData encoding:NSUTF8StringEncoding];
    //NSLog(@"JSON string: '%@'", jsonString);
    
    NSError *error = nil;
    NSDictionary *object = [NSJSONSerialization JSONObjectWithData:self.rawJSONData options:0 error:&error];
    if (object) {
        self.resultBlock(object);
    } else {
        self.failureBlock(error);
    }
}

@end
