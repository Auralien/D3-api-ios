//
//  D3DataManager.m
//  D3-api-ios
//
//  Created by Maxim Mikheev on 17.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3DataManager.h"

@interface D3DataManager ()

/// Raw data with server response
@property (nonatomic, strong) NSMutableData *rawData;
/// Success block
@property (nonatomic, copy) D3DataManagerFetchURLSuccessBlock successBlock;
/// Failure block
@property (nonatomic, copy) D3DataManagerFetchURLFailureBlock failureBlock;

@end

@implementation D3DataManager

/// Method returns region code for url
+ (NSString *)getRegion:(D3APIRegion)apiRegion {
    NSString *region = nil;
    switch (apiRegion) {
        case kD3APIRegionAmericas:   region = kD3CareerRegionAmericasPath;      break;
        case kD3APIRegionEurope:     region = kD3CareerRegionEuropePath;        break;
        case kD3APIRegionKorea:      region = kD3CareerRegionKoreaPath;         break;
        case kD3APIRegionTaiwan:     region = kD3CareerRegionTaiwanPath;        break;
        default:                                                                break;
    }
    return region;
}

#pragma mark - NSURLConnectionDataDelegate Methods

/// Methods starts request for JSON fetching to server
- (void)fetchDataWithURL:(NSString *)url
            successBlock:(D3DataManagerFetchURLSuccessBlock)successBlock
            failureBlock:(D3DataManagerFetchURLFailureBlock)failureBlock {
    self.successBlock = successBlock;
    self.failureBlock = failureBlock;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]
                                             cachePolicy:NSURLRequestUseProtocolCachePolicy
                                         timeoutInterval:5.0];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if (connection) {
        self.rawData = [NSMutableData data];
    } else {
#ifdef DEBUG
        NSLog(@"Connection failed!");
#endif
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [self.rawData setLength:0];
#ifdef DEBUG
    NSLog(@"connection:didReceiveResponse:");
#endif
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.rawData appendData:data];
#ifdef DEBUG
    NSLog(@"connection:didReceiveData:");
#endif
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
#ifdef DEBUG
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
#endif
    self.failureBlock(error);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
#ifdef DEBUG
    NSLog(@"Succeeded! Recieved %d bytes of data", [self.rawData length]);
#endif
    
    if ([self.rawData length] > 0) {
        self.successBlock(self.rawData);
    }
}

@end
