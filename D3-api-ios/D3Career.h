//
//  D3Career.h
//  D3-api-ios
//
//  Created by Maxim Mikheev on 12.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3Object.h"

@interface D3Career : D3Object

@property (nonatomic, copy) NSString *battleTag;
@property (nonatomic) NSInteger lastHeroPlayed;
@property (nonatomic, strong) NSDate *lastUpdated;
@property (nonatomic, strong) NSNumber *timePlayedBarbarian;
@property (nonatomic, strong) NSNumber *timePlayedDemonHunter;
@property (nonatomic, strong) NSNumber *timePlayedMonk;
@property (nonatomic, strong) NSNumber *timePlayedWitchDoctor;
@property (nonatomic, strong) NSNumber *timePlayedWizard;
@property (nonatomic) NSInteger killsMonsters;
@property (nonatomic) NSInteger killsElites;
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

@end
