//
//  D3Hero.m
//  D3-api-ios
//
//  Created by Maxim Mikheev on 12.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3Hero.h"

@implementation D3Hero

@synthesize heroID, heroName, heroClass, heroGender, heroLevel, heroParagonLevel, isHardcoreHero, heroLastUpdated, killsElites, isDead;

#pragma mark - Init Methods

/// Initialize hero object with zero values
- (id)init {
    return [self initWithHeroID:0
                       heroName:@""
                      heroClass:kD3HeroClassUndefined
                     heroGender:kD3HeroGenderUndefined
                      heroLevel:0
               heroParagonLevel:0
             heroIsHardcoreFlag:NO
                heroLastUpdated:[NSDate dateWithTimeIntervalSince1970:0]
                    killsElites:0
                 heroIsDeadFlag:NO];
}

/// Initialize hero object with defined values
- (id)initWithHeroID:(NSInteger)heroIDVal
            heroName:(NSString *)heroNameVal
           heroClass:(D3HeroClass)heroClassVal
          heroGender:(D3HeroGender)heroGenderVal
           heroLevel:(NSInteger)heroLevelVal
    heroParagonLevel:(NSInteger)heroParagonLevelVal
  heroIsHardcoreFlag:(BOOL)isHardcoreHeroVal
     heroLastUpdated:(NSDate *)heroLastUpdatedVal
         killsElites:(NSInteger)killsElitesVal
      heroIsDeadFlag:(BOOL)isDeadVal {
    if (self = [super init]) {
        [self setHeroID:heroIDVal];
        [self setHeroName:heroNameVal];
        [self setHeroClass:heroClassVal];
        [self setHeroGender:heroGenderVal];
        [self setHeroLevel:heroLevelVal];
        [self setHeroParagonLevel:heroParagonLevelVal];
        [self setIsHardcoreHero:isHardcoreHeroVal];
        [self setHeroLastUpdated:heroLastUpdatedVal];
        [self setKillsElites:killsElitesVal];
        [self setIsDead:isDeadVal];
    }
    return self;
}

@end
