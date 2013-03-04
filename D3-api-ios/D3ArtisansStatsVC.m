//
//  D3ArtisansStatsVC.m
//  D3-api-ios
//
//  Created by Maxim Mikheev on 01.03.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3ArtisansStatsVC.h"

@interface D3ArtisansStatsVC ()

@end

@implementation D3ArtisansStatsVC

@synthesize normalArtisans, hardcoreArtisans;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil artisans:(NSDictionary *)normalArtisansVal hardcoreArtisans:(NSDictionary *)hardcoreArtisansVal {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setNormalArtisans:normalArtisansVal];
        [self setHardcoreArtisans:hardcoreArtisansVal];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

@end
