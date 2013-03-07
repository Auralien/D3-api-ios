//
//  D3ArtisansStatsVC.m
//  D3-api-ios
//
//  Created by Maxim Mikheev on 01.03.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3ArtisansStatsVC.h"
#import "D3API.h"

@interface D3ArtisansStatsVC ()

@property (nonatomic, strong) NSDictionary *normalArtisans;
@property (nonatomic, strong) NSDictionary *hardcoreArtisans;
@property (nonatomic, weak) IBOutlet UILabel *blacksmithNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *blacksmithNormalLevelLabel;
@property (nonatomic, weak) IBOutlet UILabel *blacksmithHardcoreLevelLabel;
@property (nonatomic, weak) IBOutlet UILabel *jewelerNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *jewelerNormalLevelLabel;
@property (nonatomic, weak) IBOutlet UILabel *jewelerHardcoreLevelLabel;

@end

@implementation D3ArtisansStatsVC

@synthesize normalArtisans, hardcoreArtisans, blacksmithNameLabel, blacksmithNormalLevelLabel, blacksmithHardcoreLevelLabel, jewelerNameLabel, jewelerNormalLevelLabel, jewelerHardcoreLevelLabel;

/// Custom init method
- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
             artisans:(NSDictionary *)normalArtisansVal
     hardcoreArtisans:(NSDictionary *)hardcoreArtisansVal {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setNormalArtisans:normalArtisansVal];
        [self setHardcoreArtisans:hardcoreArtisansVal];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.blacksmithNameLabel.text = NSLocalizedString(@"Blacksmith", @"Blacksmith");
    
    NSString *blacksmithNormalLevelString = ([[self.normalArtisans objectForKey:@"blacksmith"] artisanLevel] > 0) ?
    [NSString stringWithFormat:@"%@ %d %@",
     NSLocalizedString(@"Level", @"Level"),
     [[self.normalArtisans objectForKey:@"blacksmith"] artisanLevel],
     NSLocalizedString(@"(Normal)", @"(Normal)")] :
    [NSString stringWithFormat:@"%@ - %@",
     NSLocalizedString(@"Level", @"Level"),
     NSLocalizedString(@"(Normal)", @"(Normal)")];
    self.blacksmithNormalLevelLabel.text = blacksmithNormalLevelString;
    
    NSString *blacksmithHardcoreLevelString = ([[self.hardcoreArtisans objectForKey:@"blacksmith"] artisanLevel] > 0) ?
    [NSString stringWithFormat:@"%@ %d %@",
     NSLocalizedString(@"Level", @"Level"),
     [[self.hardcoreArtisans objectForKey:@"blacksmith"] artisanLevel],
     NSLocalizedString(@"(Normal)", @"(Normal)")] :
    [NSString stringWithFormat:@"%@ - %@",
     NSLocalizedString(@"Level", @"Level"),
     NSLocalizedString(@"(Normal)", @"(Normal)")];
    self.blacksmithHardcoreLevelLabel.text = blacksmithHardcoreLevelString;
    
    self.jewelerNameLabel.text = NSLocalizedString(@"Jeweler", @"Jeweler");
    
    NSString *jewelerNormalLevelString = ([[self.normalArtisans objectForKey:@"jeweler"] artisanLevel] > 0) ?
    [NSString stringWithFormat:@"%@ %d %@",
     NSLocalizedString(@"Level", @"Level"),
     [[self.normalArtisans objectForKey:@"jeweler"] artisanLevel],
     NSLocalizedString(@"(Normal)", @"(Normal)")] :
    [NSString stringWithFormat:@"%@ - %@",
     NSLocalizedString(@"Level", @"Level"),
     NSLocalizedString(@"(Normal)", @"(Normal)")];
    self.jewelerNormalLevelLabel.text = jewelerNormalLevelString;
    
    NSString *jewelerHardcoreLevelString = ([[self.hardcoreArtisans objectForKey:@"jeweler"] artisanLevel] > 0) ?
    [NSString stringWithFormat:@"%@ %d %@",
     NSLocalizedString(@"Level", @"Level"),
     [[self.hardcoreArtisans objectForKey:@"jeweler"] artisanLevel],
     NSLocalizedString(@"(Normal)", @"(Normal)")] :
    [NSString stringWithFormat:@"%@ - %@",
     NSLocalizedString(@"Level", @"Level"),
     NSLocalizedString(@"(Normal)", @"(Normal)")];
    self.jewelerHardcoreLevelLabel.text = jewelerHardcoreLevelString;
}

@end
