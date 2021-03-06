//
//  D3ArtisansStatsVC.h
//  D3-api-ios
//
//  Created by Maxim Mikheev on 01.03.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface D3ArtisansStatsVC : UIViewController

/// Custom init method
- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
             artisans:(NSDictionary *)normalArtisansVal
     hardcoreArtisans:(NSDictionary *)hardcoreArtisansVal;

@end
