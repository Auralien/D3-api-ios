//
//  D3ViewController.m
//  D3-api-ios
//
//  Created by Maxim Mikheev on 12.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3ViewController.h"
#import "D3DataManager.h"

@interface D3ViewController ()

@property (nonatomic, strong) NSDictionary *dict1;

@end

@implementation D3ViewController

@synthesize dict1;

//+ (NSDictionary *)returnJSONDict

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dict1 = [NSDictionary dictionary];
    //__block NSDictionary *dictionary = nil;
    
    
    //void (^successBlock)(NSDictionary *) = ^(NSDictionary *json) {
    D3ObjectDictionaryForURLResultingBlock successBlock = ^(NSDictionary *json){
        //dictionary = json;
        self.dict1 = json;
        //NSLog(@"dictionary: %@", self.dict1);
        //[[NSNotificationCenter defaultCenter] postNotificationName:@"test" object:nil userInfo:@{@"json" : json}];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [[NSNotificationCenter defaultCenter] postNotificationName:@"test" object:nil userInfo:[NSDictionary dictionaryWithObject:json forKey:@"json"]];
        });
    };
    
    //dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        D3DataManager *manager = [[D3DataManager alloc] init];
        [manager fetchDataWithURL:@"http://eu.battle.net/api/d3/profile/Auralien-2166/"
                     successBlock:successBlock
                       errorBlock:NULL];
        /*dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"dictionary: %@", self.dict1);
        });*/
    //});
    
    //if (dictionary)
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(success) name:@"test" object:nil];
}

- (void)success:(NSNotification *)notification {
    NSDictionary *dict = [[notification userInfo] objectForKey:@"json"];
    NSLog(@"successful notification!");
}

@end
