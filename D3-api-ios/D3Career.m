//
//  D3Career.m
//  D3-api-ios
//
//  Created by Maxim Mikheev on 12.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3Career.h"
#import "D3DataManager.h"
#import "D3Hero.h"
#import "D3Artisan.h"
#import "D3CareerProgression.h"

@interface D3Career ()

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

#pragma mark - Fetch And Parse Methods

/// Method checks battle tag for "#" in it
+ (BOOL)battleTagIsValid:(NSString *)battleTag;

/// Method returns url for getting career from API
+ (NSString *)createCareerURLForBattleTag:(NSString *)battleTag forRegion:(D3APIRegion)region;

/// Method returns career object parsed from JSON
+ (D3Career *)parseCareerFromJSON:(NSDictionary *)json;

@end

@implementation D3Career

@synthesize battleTag, lastHeroPlayed, lastUpdated, timePlayedBarbarian, timePlayedDemonHunter, timePlayedMonk, timePlayedWitchDoctor, timePlayedWizard, killsMonsters, killsElites, killsHardcoreMonsters, heroes, artisans, fallenHeroes, hardcoreArtisans, progression, hardcoreProgression;

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
                         region:(D3APIRegion)region
                        success:(void (^)(D3Career *career))success
                        failure:(void (^)(NSError *error))failure {
    /// TODO: think about return value for invalid battleTag
    if ([D3Career battleTagIsValid:battleTag]) {
        D3DataManager *manager = [[D3DataManager alloc] init];
        NSString *careerURL = [D3Career createCareerURLForBattleTag:battleTag forRegion:region];
        [manager fetchDataWithURL:careerURL
                     successBlock:^(NSDictionary *json){
                         D3Career *career = [D3Career parseCareerFromJSON:json];
                         [career setCareerRegion:region];
                         if (success)
                             success(career);
                     }
                     failureBlock:failure];
    }
}

/// Method checks battle tag for "#" in it
+ (BOOL)battleTagIsValid:(NSString *)battleTag {
    if ([battleTag length] < 3)
        return NO;
    
    NSRange separatorRange = [battleTag rangeOfString:kD3CareerBattleTagSeparator];
    return separatorRange.location != NSNotFound;
}

/// Method returns url for getting career from API
+ (NSString *)createCareerURLForBattleTag:(NSString *)battleTag forRegion:(D3APIRegion)region {
    NSString *careerPath = nil;
    
    if (region != kD3APIRegionUndefined) {
        NSArray *battleTagComponents = [battleTag componentsSeparatedByString:kD3CareerBattleTagSeparator];
        careerPath = [NSString stringWithFormat:kD3DataManagerAPIPath, [D3DataManager getRegion:region]];
        careerPath = [careerPath stringByAppendingFormat:@"%@/%@-%@/", kD3DataManagerProfilePartOfPath, battleTagComponents[0], battleTagComponents[1]];
    }
    
    NSLog(@"career path = %@", careerPath);
    return careerPath;
}

/// Method returns career object parsed from JSON
+ (D3Career *)parseCareerFromJSON:(NSDictionary *)json {
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
    
    /// Parsing heroes information and putting it into career.heroes array
    NSArray *heroes = json[@"heroes"];
    if (heroes) {
        NSMutableArray *mutableHeroes = [NSMutableArray array];
        for (NSInteger i = 0; i < [heroes count]; i++) {
            NSDictionary *rawHero = heroes[i];
            D3Hero *hero = [D3Hero parseHeroFromCareerJSON:rawHero withBattleTag:career.battleTag];
            [hero setCareer:career];
            [mutableHeroes addObject:hero];
        }
        career.heroes = mutableHeroes;
    }
    
    /// Parsing fallen heroes information and putting it into career.fallenHeroes array
    NSArray *fallenHeroes = json[@"fallenHeroes"];
    if (fallenHeroes) {
        NSMutableArray *mutableFallenHeroes = [NSMutableArray array];
        for (NSInteger i = 0; i < [fallenHeroes count]; i++) {
            NSDictionary *rawFallenHero = fallenHeroes[i];
            D3Hero *fallenHero = [D3Hero parseFallenHeroFromCareerJSON:rawFallenHero withBattleTag:career.battleTag];
            if (fallenHero) {
                [fallenHero setCareer:career];
                [mutableFallenHeroes addObject:fallenHero];
            }
        }
        career.fallenHeroes = mutableFallenHeroes;
    }
    
    /// Parsing artisans information and putting it into career.artisans array
    NSArray *artisans = json[@"artisans"];
    if (artisans) {
        NSMutableArray *mutableArtisans = [NSMutableArray array];
        for (NSInteger i = 0; i < [artisans count]; i++) {
            NSDictionary *rawArtisan = artisans[i];
            D3Artisan *artisan = [D3Artisan parseArtisanFromCareerJSON:rawArtisan
                                                         withBattleTag:career.battleTag
                                                       andHardcoreFlag:NO];
            [mutableArtisans addObject:artisan];
        }
        career.artisans = mutableArtisans;
    }
    
    /// Parsing hardcore artisans information and putting it into career.hardcoreArtisans array
    NSArray *hardcoreArtisans = json[@"hardcoreArtisans"];
    if (hardcoreArtisans) {
        NSMutableArray *mutableHardcoreArtisans = [NSMutableArray array];
        for (NSInteger i = 0; i < [hardcoreArtisans count]; i++) {
            NSDictionary *rawHardcoreArtisan = hardcoreArtisans[i];
            D3Artisan *hardcoreArtisan = [D3Artisan parseArtisanFromCareerJSON:rawHardcoreArtisan
                                                                 withBattleTag:career.battleTag
                                                               andHardcoreFlag:YES];
            [mutableHardcoreArtisans addObject:hardcoreArtisan];
        }
        career.hardcoreArtisans = mutableHardcoreArtisans;
    }
    
    /// Parsing progression information and putting it into career.progression array
    NSDictionary *progressionElements = json[@"progression"];
    if (progressionElements) {
        career.progression = [D3CareerProgression parseCareerProgressionFromJSON:progressionElements
                                                                   withBattleTag:career.battleTag
                                                                 andHardcoreFlag:NO];
    }
    
    /// Parsing hardcore progression information and putting it into career.hardcoreProgression array
    NSDictionary *hardcoreProgressionElements = json[@"hardcoreProgression"];
    if (hardcoreProgressionElements) {
        career.hardcoreProgression = [D3CareerProgression parseCareerProgressionFromJSON:hardcoreProgressionElements
                                                                           withBattleTag:career.battleTag
                                                                         andHardcoreFlag:YES];
    }
    
    return career;
}

@end
