//
//  D3Hero.m
//  D3-api-ios
//
//  Created by Maxim Mikheev on 12.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3Hero.h"

@implementation D3Hero

@synthesize heroID, battleTag, heroName, heroClass, heroGender, heroLevel, heroParagonLevel, isHardcoreHero, heroLastUpdated, killsElites, isDead, life, damage, attackSpeed, armor, strength, dexterity, vitality, intelligence, resistPhysical, resistFire, resistCold, resistLightning, resistPoison, resistArcane, critDamage, blockChance, blockAmountMin, blockAmountMax, damageIncrease, critChance, damageReduction, thorns, lifeSteal, lifePerKill, goldFind, magicFind, lifeOnHit, primaryResource, secondaryResource;

#pragma mark - Init Methods

/// Update hero object with hero's stats
- (void)updateHeroWithLife:(NSInteger)lifeVal
                    damage:(NSNumber *)damageVal
               attackSpeed:(NSNumber *)attackSpeedVal
                     armor:(NSInteger)armorVal
                  strength:(NSInteger)strengthVal
                 dexterity:(NSInteger)dexterityVal
                  vitality:(NSInteger)vitalityVal
              intelligence:(NSInteger)intelligenceVal
            resistPhysical:(NSInteger)resistPhysicalVal
                resistFire:(NSInteger)resistFireVal
                resistCold:(NSInteger)resistColdVal
           resistLightning:(NSInteger)resistLightningVal
              resistPoison:(NSInteger)resistPoisonVal
              resistArcane:(NSInteger)resistArcaneVal
                critDamage:(NSNumber *)critDamageVal
               blockChance:(NSNumber *)blockChanceVal
            blockAmountMin:(NSInteger)blockAmountMinVal
            blockAmountMax:(NSInteger)blockAmountMaxVal
            damageIncrease:(NSNumber *)damageIncreaseVal
                critChance:(NSNumber *)critChanceVal
           damageReduction:(NSNumber *)damageReductionVal
                    thorns:(NSNumber *)thornsVal
                 lifeSteal:(NSNumber *)lifeStealVal
               lifePerKill:(NSNumber *)lifePerKillVal
                  goldFind:(NSNumber *)goldFindVal
                 magicFind:(NSNumber *)magicFindVal
                 lifeOnHit:(NSNumber *)lifeOnHitVal
           primaryResource:(NSInteger)primaryResourceVal
         secondaryResource:(NSInteger)secondaryResourceVal {
    [self setLife:lifeVal];
    [self setDamage:damageVal];
    [self setAttackSpeed:attackSpeedVal];
    [self setArmor:armorVal];
    [self setStrength:strengthVal];
    [self setDexterity:dexterityVal];
    [self setVitality:vitalityVal];
    [self setIntelligence:intelligenceVal];
    [self setResistPhysical:resistPhysicalVal];
    [self setResistFire:resistFireVal];
    [self setResistCold:resistColdVal];
    [self setResistLightning:resistLightningVal];
    [self setResistPoison:resistPoisonVal];
    [self setResistArcane:resistArcaneVal];
    [self setCritDamage:critDamageVal];
    [self setBlockChance:blockChanceVal];
    [self setBlockAmountMin:blockAmountMinVal];
    [self setBlockAmountMax:blockAmountMaxVal];
    [self setDamageIncrease:damageIncreaseVal];
    [self setCritChance:critChanceVal];
    [self setDamageReduction:damageReductionVal];
    [self setThorns:thornsVal];
    [self setLifeSteal:lifeStealVal];
    [self setLifePerKill:lifePerKillVal];
    [self setGoldFind:goldFindVal];
    [self setMagicFind:magicFindVal];
    [self setLifeOnHit:lifeOnHitVal];
    [self setPrimaryResource:primaryResourceVal];
    [self setSecondaryResource:secondaryResourceVal];
}

/// Initialize hero object with zero values
- (id)init {
    return [self initWithHeroID:0
                      battleTag:@""
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
           battleTag:(NSString *)battleTagVal
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
        [self setBattleTag:battleTagVal];
        [self setHeroName:heroNameVal];
        [self setHeroClass:heroClassVal];
        [self setHeroGender:heroGenderVal];
        [self setHeroLevel:heroLevelVal];
        [self setHeroParagonLevel:heroParagonLevelVal];
        [self setIsHardcoreHero:isHardcoreHeroVal];
        [self setHeroLastUpdated:heroLastUpdatedVal];
        [self setKillsElites:killsElitesVal];
        [self setIsDead:isDeadVal];
        // Hero's stats
        [self setLife:0];
        [self setDamage:[NSNumber numberWithDouble:0.0]];
        [self setAttackSpeed:[NSNumber numberWithDouble:0.0]];
        [self setArmor:0];
        [self setStrength:0];
        [self setDexterity:0];
        [self setVitality:0];
        [self setIntelligence:0];
        [self setResistPhysical:0];
        [self setResistFire:0];
        [self setResistCold:0];
        [self setResistLightning:0];
        [self setResistPoison:0];
        [self setResistArcane:0];
        [self setCritDamage:[NSNumber numberWithDouble:0.0]];
        [self setBlockChance:[NSNumber numberWithDouble:0.0]];
        [self setBlockAmountMin:0];
        [self setBlockAmountMax:0];
        [self setDamageIncrease:[NSNumber numberWithDouble:0.0]];
        [self setCritChance:[NSNumber numberWithDouble:0.0]];
        [self setDamageReduction:[NSNumber numberWithDouble:0.0]];
        [self setThorns:[NSNumber numberWithDouble:0.0]];
        [self setLifeSteal:[NSNumber numberWithDouble:0.0]];
        [self setLifePerKill:[NSNumber numberWithDouble:0.0]];
        [self setGoldFind:[NSNumber numberWithDouble:0.0]];
        [self setMagicFind:[NSNumber numberWithDouble:0.0]];
        [self setLifeOnHit:[NSNumber numberWithDouble:0.0]];
        [self setPrimaryResource:0];
        [self setSecondaryResource:0];
    }
    return self;
}

@end
