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
/// Image success block
@property (nonatomic, copy) D3DataManagerFetchDataURLSuccessBlock dataSuccessBlock;
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
        NSLog(@"Connection failed!");
    }
}

/// Methods starts request for image fetching to server
- (void)fetchImageDataWithURL:(NSString *)url
                 successBlock:(D3DataManagerFetchDataURLSuccessBlock)successBlock
                 failureBlock:(D3DataManagerFetchURLFailureBlock)failureBlock {
    self.dataSuccessBlock = successBlock;
    self.failureBlock = failureBlock;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]
                                             cachePolicy:NSURLRequestUseProtocolCachePolicy
                                         timeoutInterval:5.0];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if (connection) {
        self.rawData = [NSMutableData data];
    } else {
        NSLog(@"Connection failed!");
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [self.rawData setLength:0];
    NSLog(@"connection:didReceiveResponse:");
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.rawData appendData:data];
    NSLog(@"connection:didReceiveData:");
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Connection failed! Error - %@ %@", [error localizedDescription], [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
    self.failureBlock(error);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"Succeeded! Recieved %d bytes of data", [self.rawData length]);
    
    NSString *urlString = [[[connection currentRequest] URL] absoluteString];
    NSLog(@"current url = %@", urlString);
    /// Check for image url
    NSRange range = [urlString rangeOfString:@"media.blizzard.com"];
    
    if (range.location == NSNotFound) {
        /// Not an image - JSON
        NSLog(@"Not found");
        NSError *error = nil;
        //NSString *jsonString = [[NSString alloc] initWithData:self.rawData encoding:NSUTF8StringEncoding];
        //NSLog(@"JSON string: '%@'", jsonString);
        NSDictionary *object = [NSJSONSerialization JSONObjectWithData:self.rawData options:0 error:&error];
        if (object) {
            self.successBlock(object);
        } else {
            self.failureBlock(error);
        }
    } else {
        /// Image
        NSLog(@"Found");
        UIImage *image = [[UIImage alloc] initWithData:self.rawData];
        NSLog(@"image %@", image);
        if (self.rawData) {
            self.dataSuccessBlock(self.rawData);
        } else {
            
        }
    }
    
}

@end
