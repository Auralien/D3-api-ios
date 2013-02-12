//
//  D3Hero.h
//  D3-api-ios
//
//  Created by Maxim Mikheev on 12.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3Object.h"

typedef enum {
    kD3HeroGenderUndefined,
    kD3HeroGenderMale,
    kD3HeroGenderFemale
} D3HeroGender;

typedef enum {
    kD3HeroClassUndefined,
    kD3HeroClassBarbarian,
    kD3HeroClassWitchDoctor,
    kD3HeroClassWizard,
    kD3HeroClassMonk,
    kD3HeroClassDemonHunter
} D3HeroClass;

@interface D3Hero : D3Object

/// Hero unique ID
@property (nonatomic) NSInteger heroID;
/// Hero name
@property (nonatomic, copy) NSString *heroName;
/// Hero class from enumeration @a D3HeroClass
@property (nonatomic) D3HeroClass heroClass;
/// Hero gender from enumeration @a D3HeroGender
@property (nonatomic) D3HeroGender heroGender;
/// Hero level
@property (nonatomic) NSInteger heroLevel;
/// Hero hardcore flag, YES for hardcore
@property (nonatomic) BOOL isHardcoreHero;
/// Date and time for hero's information last update
@property (nonatomic, strong) NSDate *heroLastUpdated;
/// Elite mobs killed number
@property (nonatomic) NSInteger elitesKilled;

#pragma mark - Init Methods

/// Initialize hero object with zero values
- (id)init;

/// Initialize hero object with defined values
- (id)initWithHeroID:(NSInteger)heroIDVal
            heroName:(NSString *)heroNameVal
           heroClass:(D3HeroClass)heroClassVal
          heroGender:(D3HeroGender)heroGenderVal
           heroLevel:(NSInteger)heroLevelVal
        hardcoreFlag:(BOOL)isHardcoreHeroVal
     heroLastUpdated:(NSDate *)heroLastUpdatedVal
        elitesKilled:(NSInteger)elitesKilledVal;

@end
