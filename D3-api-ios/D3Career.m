//
//  D3Career.m
//  D3-api-ios
//
//  Created by Maxim Mikheev on 12.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3Career.h"
#import "D3DataManager.h"

@interface D3Career ()

/// Method returns career object parsed from JSON
+ (D3Career *)getCareerFromJSON:(NSDictionary *)json;

@end

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

#pragma mark - Fetch And Parse Methods

/// Method fetches career data from Diablo 3 API
+ (void)fetchCareerForBattleTag:(NSString *)battleTag
                        success:(void (^)(D3Career *career))success
                        failure:(void (^)(NSError *error))failure {
    D3DataManager *manager = [[D3DataManager alloc] init];
    [manager fetchDataWithURL:@"http://eu.battle.net/api/d3/profile/Auralien-2166/"
                 successBlock:^(NSDictionary *json){
                     
                     D3Career *career = [D3Career getCareerFromJSON:json];
                     if (success)
                         success(career);
    }
                 failureBlock:failure];
}

/// Method returns career object parsed from JSON
+ (D3Career *)getCareerFromJSON:(NSDictionary *)json {
    NSDate *lastUpdated = [NSDate dateWithTimeIntervalSince1970:0.0];
    NSString *lastUpdatedString = json[@"lastUpdated"];
    if (lastUpdatedString) {
        NSTimeInterval interval = [lastUpdatedString doubleValue];
        lastUpdated = [NSDate dateWithTimeIntervalSince1970:interval];
    }
    
    NSDictionary *timePlayed = json[@"timePlayed"];
    NSDictionary *kills = json[@"kills"];
    D3Career *career = [[D3Career alloc] initWithBattleTag:json[@"battleTag"]
                                            lastHeroPlayed:[json[@"lastHeroPlayed"] integerValue]
                                               lastUpdated:lastUpdated
                                       timePlayedBarbarian:[NSNumber numberWithDouble:[timePlayed[@"barbarian"] doubleValue]]
                                     timePlayedDemonHunter:[NSNumber numberWithDouble:[timePlayed[@"demon-hunter"] doubleValue]]
                                            timePlayedMonk:[NSNumber numberWithDouble:[timePlayed[@"monk"] doubleValue]]
                                     timePlayedWitchDoctor:[NSNumber numberWithDouble:[timePlayed[@"witch-doctor"] doubleValue]]
                                          timePlayedWizard:[NSNumber numberWithDouble:[timePlayed[@"wizard"] doubleValue]]
                                             killsMonsters:[kills[@"monsters"] integerValue]
                                               killsElites:[kills[@"elites"] integerValue]
                                     killsHardcoreMonsters:[kills[@"hardcoreMonsters"] integerValue]];
    return career;
}

@end
