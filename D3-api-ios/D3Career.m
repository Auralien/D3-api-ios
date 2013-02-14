//
//  D3Career.m
//  D3-api-ios
//
//  Created by Maxim Mikheev on 12.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3Career.h"

@implementation D3Career

@synthesize battleTag, lastHeroPlayed, lastUpdated, timePlayedBarbarian, timePlayedDemonHunter, timePlayedMonk, timePlayedWitchDoctor, timePlayedWizard, killsMonsters, killsElites, killsHardcoreMonsters;

#pragma mark - Init Methods

/// Initialize career object with zero values
- (id)init {
    return [self initWithBattleTag:@""
                    lastHeroPlayed:0
                       lastUpdated:[NSDate dateWithTimeIntervalSince1970:0]
               timePlayedBarbarian:[NSNumber numberWithDouble:0.0]
             timePlayedDemonHunter:[NSNumber numberWithDouble:0.0]
                    timePlayedMonk:[NSNumber numberWithDouble:0.0]
             timePlayedWitchDoctor:[NSNumber numberWithDouble:0.0]
                  timePlayedWizard:[NSNumber numberWithDouble:0.0]
                     killsMonsters:0
                       killsElites:0
             killsHardcoreMonsters:0];
}

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
  killsHardcoreMonsters:(NSInteger)killsHardcoreMonstersVal {
    if (self = [super init]) {
        [self setBattleTag:battleTagVal];
        [self setLastHeroPlayed:lastHeroPlayedVal];
        [self setLastUpdated:lastUpdatedVal];
        [self setTimePlayedBarbarian:timePlayedBarbarianVal];
        [self setTimePlayedDemonHunter:timePlayedDemonHunterVal];
        [self setTimePlayedMonk:timePlayedMonkVal];
        [self setTimePlayedWitchDoctor:timePlayedWitchDoctorVal];
        [self setTimePlayedWizard:timePlayedWizardVal];
        [self setKillsMonsters:killsMonstersVal];
        [self setKillsElites:killsElitesVal];
        [self setKillsHardcoreMonsters:killsHardcoreMonstersVal];
    }
    return self;
}

@end
