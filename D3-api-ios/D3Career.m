//
//  D3Career.m
//  D3-api-ios
//
//  Created by Maxim Mikheev on 12.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3Career.h"
#import "D3DataManager.h"

#define kD3CareerBattleTagSeparator         @"#"
#define kD3CareerRegionAmericasPath         @"us"
#define kD3CareerRegionEuropePath           @"eu"
#define kD3CareerRegionKoreaPath            @"kr"
#define kD3CareerRegionTaiwanPath           @"tw"

@interface D3Career ()

/// Method returns career object parsed from JSON
+ (D3Career *)getCareerFromJSON:(NSDictionary *)json;

/// Method checks battle tag for "#" in it
+ (BOOL)battleTagIsValid:(NSString *)battleTag;

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
    D3CareerRegion region = kD3CareerRegionEurope;
    NSString *careerUrl = [D3Career careerPathForRegion:region battleTag:battleTag];
    [manager fetchDataWithURL:careerUrl/*@"http://eu.battle.net/api/d3/profile/Auralien-2166/"*/
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

+ (NSString *)careerPathForRegion:(D3CareerRegion)region battleTag:(NSString *)battleTag {
    NSString *careerPath = nil;
    
    if (region != kD3CareerRegionUndefined) {
        NSArray *battleTagComponents = [battleTag componentsSeparatedByString:kD3CareerBattleTagSeparator];
        careerPath = [NSString stringWithFormat:kD3DataManagerCareerPath, [D3Career getRegion:region]];
        careerPath = [careerPath stringByAppendingFormat:@"%@-%@/", battleTagComponents[0], battleTagComponents[1]];
    }
    
    NSLog(@"career path = %@", careerPath);
    
    return careerPath;
}

/// Method returns region code for career url
+ (NSString *)getRegion:(D3CareerRegion)careerRegion {
    NSString *region = nil;
    switch (careerRegion) {
        case kD3CareerRegionAmericas:   region = kD3CareerRegionAmericasPath;   break;
        case kD3CareerRegionEurope:     region = kD3CareerRegionEuropePath;     break;
        case kD3CareerRegionKorea:      region = kD3CareerRegionKoreaPath;      break;
        case kD3CareerRegionTaiwan:     region = kD3CareerRegionTaiwanPath;     break;
        default:                                                                break;
    }
    return region;
}

/// Method checks battle tag for "#" in it
+ (BOOL)battleTagIsValid:(NSString *)battleTag {
    if ([battleTag length] < 3)
        return NO;
    
    NSRange separatorRange = [battleTag rangeOfString:kD3CareerBattleTagSeparator];
    return separatorRange.location != NSNotFound;
}

@end
