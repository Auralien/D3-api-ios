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

@class D3Career;

@interface D3Hero : D3Object

/// Career reference
@property (nonatomic, weak) D3Career *career;

/// Hero's unique ID
@property (nonatomic) NSInteger heroID;
/// Career battle tag for Hero
@property (nonatomic, copy) NSString *battleTag;
/// Hero's name
@property (nonatomic, copy) NSString *heroName;
/// Hero's class from enumeration @a D3HeroClass
@property (nonatomic) D3HeroClass heroClass;
/// Hero's gender from enumeration @a D3HeroGender
@property (nonatomic) D3HeroGender heroGender;
/// Hero's level
@property (nonatomic) NSInteger heroLevel;
/// Hero's paragon level
@property (nonatomic) NSInteger heroParagonLevel;
/// Hero's hardcore flag, YES for hardcore
@property (nonatomic) BOOL isHardcoreHero;
/// Date and time for hero's information last update
@property (nonatomic, strong) NSDate *heroLastUpdated;
/// Elite mobs killed number
@property (nonatomic) NSInteger killsElites;
/// Hero's dead flag, YES for death
@property (nonatomic) BOOL isDead;

#pragma mark - Hero's Stats

/// Hero's life amount
@property (nonatomic) NSInteger life;
/// Hero's damage
@property (nonatomic, strong) NSNumber *damage;
/// Hero's attack speed
@property (nonatomic, strong) NSNumber *attackSpeed;
/// Hero's armor value
@property (nonatomic) NSInteger armor;
/// Hero's Strength
@property (nonatomic) NSInteger strength;
/// Hero's Dexterity
@property (nonatomic) NSInteger dexterity;
/// Hero's Vitality
@property (nonatomic) NSInteger vitality;
/// Hero's Intelligence
@property (nonatomic) NSInteger intelligence;
/// Hero's physical resistance
@property (nonatomic) NSInteger resistPhysical;
/// Hero's fire resistance
@property (nonatomic) NSInteger resistFire;
/// Hero's cold resistance
@property (nonatomic) NSInteger resistCold;
/// Hero's lightning resistance
@property (nonatomic) NSInteger resistLightning;
/// Hero's poison resistance
@property (nonatomic) NSInteger resistPoison;
/// Hero's arcane resistance
@property (nonatomic) NSInteger resistArcane;
/// Hero's critical damage
@property (nonatomic, strong) NSNumber *critDamage;
/// Hero's block chance
@property (nonatomic, strong) NSNumber *blockChance;
/// Hero's minimun block amount
@property (nonatomic) NSInteger blockAmountMin;
/// Hero's maximum block amount
@property (nonatomic) NSInteger blockAmountMax;
/// Hero's damage increase
@property (nonatomic, strong) NSNumber *damageIncrease;
/// Hero's critical chance
@property (nonatomic, strong) NSNumber *critChance;
/// Hero's damage reduction
@property (nonatomic, strong) NSNumber *damageReduction;
/// Hero's thorns
@property (nonatomic, strong) NSNumber *thorns;
/// Hero's life steal
@property (nonatomic, strong) NSNumber *lifeSteal;
/// Hero's life per kill
@property (nonatomic, strong) NSNumber *lifePerKill;
/// Hero's gold find
@property (nonatomic, strong) NSNumber *goldFind;
/// Hero's magic find
@property (nonatomic, strong) NSNumber *magicFind;
/// Hero's life on hit
@property (nonatomic, strong) NSNumber *lifeOnHit;
/// Hero's primary resource amount
@property (nonatomic) NSInteger primaryResource;
/// Hero's secondary resource amount
@property (nonatomic) NSInteger secondaryResource;

#pragma mark - Hero's collection objects

/// Hero's active skills list
@property (nonatomic, strong) NSArray *activeSkills;
/// Hero's passive skills list
@property (nonatomic, strong) NSArray *passiveSkills;
/// Hero's followers list
@property (nonatomic, strong) NSDictionary *followers;
/// Hero's items list
@property (nonatomic, strong) NSDictionary *items;

#pragma mark - Fetch and Parse Methods

/// Method parse Hero object from NSDictionary
+ (D3Hero *)parseHeroFromCareerJSON:(NSDictionary *)json withBattleTag:(NSString *)battleTag;

/// Method parse Hero object from NSDictionary
+ (D3Hero *)parseFallenHeroFromCareerJSON:(NSDictionary *)json withBattleTag:(NSString *)battleTag;

/// Method fetches hero data from Diablo 3 API
- (void)completeHeroProfileWithSuccess:(void (^)(D3Hero *hero))success
                               failure:(void (^)(NSError *error))failure;

/// Methods updates hero's data from JSON
- (void)parseHeroFromJSON:(NSDictionary *)json;

@end
