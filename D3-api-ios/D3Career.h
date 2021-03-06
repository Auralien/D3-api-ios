//
//  D3Career.h
//  D3-api-ios
//
//  Created by Maxim Mikheev on 12.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3Object.h"
#import "D3DataManager.h"

@interface D3Career : D3Object

#pragma mark - General Account Information

/// Player's battle tag
@property (nonatomic, copy) NSString *battleTag;

@property (nonatomic) D3APIRegion careerRegion;
/// Player's last hero's played ID
@property (nonatomic) NSInteger lastHeroPlayed;
/// Player's last information update date and time
@property (nonatomic, strong) NSDate *lastUpdated;
/// Player's barbarian time
@property (nonatomic, strong) NSNumber *timePlayedBarbarian;
/// Player's demon hunter time
@property (nonatomic, strong) NSNumber *timePlayedDemonHunter;
/// Player's monk time
@property (nonatomic, strong) NSNumber *timePlayedMonk;
/// Player's witch doctor time
@property (nonatomic, strong) NSNumber *timePlayedWitchDoctor;
/// Player's wizard time
@property (nonatomic, strong) NSNumber *timePlayedWizard;
/// Player's mosters killed
@property (nonatomic) NSInteger killsMonsters;
/// Player's elite monsters killed
@property (nonatomic) NSInteger killsElites;
/// Player's hardcore monsters killed
@property (nonatomic) NSInteger killsHardcoreMonsters;

#pragma mark - Account Collections

/// Player's heroes list
@property (nonatomic, strong) NSArray *heroes;
/// Player's artisans list
@property (nonatomic, strong) NSDictionary *artisans;
/// Player's fallen heroes list
@property (nonatomic, strong) NSArray *fallenHeroes;
/// Player's hardcore artisans list
@property (nonatomic, strong) NSDictionary *hardcoreArtisans;
/// Player's progression acts list
@property (nonatomic, strong) NSArray *progression;
/// Player's hardcore progression acts list
@property (nonatomic, strong) NSArray *hardcoreProgression;

#pragma mark - Fetch And Parse Methods

/// Method fetches career data from Diablo 3 API
+ (void)fetchCareerForBattleTag:(NSString *)battleTag
                         region:(D3APIRegion)region
                        success:(void (^)(D3Career *career))success
                        failure:(void (^)(NSError *error))failure;

@end
