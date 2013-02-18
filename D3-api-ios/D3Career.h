//
//  D3Career.h
//  D3-api-ios
//
//  Created by Maxim Mikheev on 12.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3Object.h"

@interface D3Career : D3Object

/// Player's battle tag
@property (nonatomic, copy) NSString *battleTag;
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

#pragma mark - Init Methods

/// Initialize career object with zero values
- (id)init;

/// Initialize career object with defined values
- (id)initWithBattleTag:(NSString *)battleTagVal
         lastHeroPlayed:(NSInteger)lastHeroPlayedVal
            lastUpdated:(NSDate *)lastUpdatedVal
    timePlayedBarbarian:(NSNumber *)timePlayedBarbarianVal
  timePlayedDemonHunter:(NSNumber *)timePlayedDemonHunterVal
         timePlayedMonk:(NSNumber *)timePlayedMonkVal
  timePlayedWitchDoctor:(NSNumber *)timePlayedWitchDoctorVal
       timePlayedWizard:(NSNumber *)timePlayedWizardVal
          killsMonsters:(NSInteger)killsMonstersVal
            killsElites:(NSInteger)killsElitesVal
  killsHardcoreMonsters:(NSInteger)killsHardcoreMonstersVal;

#pragma mark - Fetch Career Methods

/// Method fetches career data from Diablo 3 API
+ (void)fetchCareerForBattleTag:(NSString *)battleTag
                        success:(void (^)(D3Career *career))success
                        failure:(void (^)(NSError *error))failure;

@end
