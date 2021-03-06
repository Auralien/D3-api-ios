//
//  D3Hero.m
//  D3-api-ios
//
//  Created by Maxim Mikheev on 12.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3Hero.h"
#import "D3Career.h"
#import "D3DataManager.h"
#import "D3Item.h"
#import "D3Skill.h"
#import "D3Rune.h"
#import "D3Follower.h"

@interface D3Hero ()

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
         secondaryResource:(NSInteger)secondaryResourceVal;

/// Initialize Hero object with zero values
- (id)init;

/// Initialize Hero object with defined values
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
      heroIsDeadFlag:(BOOL)isDeadVal;

@end

@implementation D3Hero

@synthesize heroID, battleTag, heroName, heroClass, heroGender, heroLevel, heroParagonLevel, isHardcoreHero, heroLastUpdated, killsElites, isDead, life, damage, attackSpeed, armor, strength, dexterity, vitality, intelligence, resistPhysical, resistFire, resistCold, resistLightning, resistPoison, resistArcane, critDamage, blockChance, blockAmountMin, blockAmountMax, damageIncrease, critChance, damageReduction, thorns, lifeSteal, lifePerKill, goldFind, magicFind, lifeOnHit, primaryResource, secondaryResource, activeSkills, passiveSkills, followers;

#pragma mark - Fetch and Parse Methods

/// Method parse Hero object from NSDictionary
+ (D3Hero *)parseHeroFromCareerJSON:(NSDictionary *)json withBattleTag:(NSString *)battleTag {
    D3Hero *hero = nil;
    
    if ([json isKindOfClass:[NSDictionary class]]) {
        D3HeroClass heroClass = kD3HeroClassUndefined;
        if (json[@"class"]) {
            if ([json[@"class"] isEqualToString:@"barbarian"]) {
                heroClass = kD3HeroClassBarbarian;
            } else if ([json[@"class"] isEqualToString:@"witch-doctor"]) {
                heroClass = kD3HeroClassWitchDoctor;
            } else if ([json[@"class"] isEqualToString:@"wizard"]) {
                heroClass = kD3HeroClassWizard;
            } else if ([json[@"class"] isEqualToString:@"monk"]) {
                heroClass = kD3HeroClassMonk;
            } else if ([json[@"class"] isEqualToString:@"demon-hunter"]) {
                heroClass = kD3HeroClassDemonHunter;
            }
        }
        
        D3HeroGender heroGender = kD3HeroGenderUndefined;
        if (json[@"gender"]) {
            heroGender = [json[@"gender"] isEqualToNumber:[NSNumber numberWithInt:0]] ? kD3HeroGenderMale : kD3HeroGenderFemale;
        }
        
        BOOL hardcoreHero = NO;
        if (json[@"hardcore"]) {
            hardcoreHero = [json[@"hardcore"] boolValue];
        }
        
        BOOL deadHero = NO;
        if (json[@"dead"]) {
            deadHero = [json[@"dead"] boolValue];
        }
        
        NSDate *lastUpdated = [NSDate dateWithTimeIntervalSince1970:0.0];
        if (json[@"last-updated"]) {
            NSTimeInterval seconds = [json[@"last-updated"] doubleValue];
            lastUpdated = [NSDate dateWithTimeIntervalSince1970:seconds];
        }
        
        hero = [[D3Hero alloc] initWithHeroID:[json[@"id"] integerValue]
                                    battleTag:battleTag
                                     heroName:json[@"name"]
                                    heroClass:heroClass
                                   heroGender:heroGender
                                    heroLevel:[json[@"level"] integerValue]
                             heroParagonLevel:[json[@"paragonLevel"] integerValue]
                           heroIsHardcoreFlag:hardcoreHero
                              heroLastUpdated:lastUpdated
                                  killsElites:0
                               heroIsDeadFlag:deadHero];
    }
    
    return hero;
}

/// Method parse Hero object from NSDictionary
+ (D3Hero *)parseFallenHeroFromCareerJSON:(NSDictionary *)json withBattleTag:(NSString *)battleTag {
    D3Hero *hero = nil;
    // TODO: Insert fallen hero parsing logic here
    return hero;
}

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

#pragma mark - Fetch And Parse Methods

/// Method fetches hero data from Diablo 3 API
- (void)completeHeroProfileWithSuccess:(void (^)(D3Hero *hero))success
                               failure:(void (^)(NSError *error))failure {
    
    D3DataManager *manager = [[D3DataManager alloc] init];
    NSString *heroURL = [self createHeroURLForHeroID:self.heroID forRegion:self.career.careerRegion];
    [manager fetchDataWithURL:heroURL
                 successBlock:^(NSData *data){
                     NSError *error = nil;
                     NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
                     [self parseHeroFromJSON:json];
                     if (success)
                         success(self);
                 }
                 failureBlock:failure];
}

/// Method returns url for getting hero from API
- (NSString *)createHeroURLForHeroID:(NSInteger)heroIDVal forRegion:(D3APIRegion)region {
    NSString *heroPath = nil;
    
    if (region != kD3APIRegionUndefined) {
        //<host> "/api/d3/profile/" <battletag-name> "-" <battletag-code> "/hero/" <hero-id>
        NSArray *battleTagComponents = [self.career.battleTag componentsSeparatedByString:kD3CareerBattleTagSeparator];
        heroPath = [NSString stringWithFormat:kD3DataManagerAPIPath, [D3DataManager getRegion:region]];
        heroPath = [heroPath stringByAppendingFormat:@"%@/%@-%@/%@/%d", kD3DataManagerProfilePartOfPath, battleTagComponents[0], battleTagComponents[1], kD3DataManagerHeroPartOfPath, self.heroID];
    }
    
    NSLog(@"hero path = %@", heroPath);
    return heroPath;
}

/// Methods updates hero's data from JSON
- (void)parseHeroFromJSON:(NSDictionary *)json {
    /// Parsing skills information
    if (json[@"skills"]) {
        NSDictionary *rawSkills = json[@"skills"];
        /// Parsing active skills
        if (rawSkills[@"active"]) {
            NSMutableArray *mutableActiveSkills = [NSMutableArray array];
            
            NSArray *rawActiveSkills = rawSkills[@"active"];
            for (NSDictionary *rawActiveSkill in rawActiveSkills) {
                if (rawActiveSkill[@"skill"]) {
                    D3Skill *skill = [[D3Skill alloc] initWithJSON:rawActiveSkill[@"skill"]
                                                  skillOwnerHeroID:self.heroID
                                                    skillOwnerType:kD3OwnerTypeHero
                                                         skillType:kD3SkillTypeActive];
                    
                    if (rawActiveSkill[@"rune"]) {
                        D3Rune *rune = [[D3Rune alloc] initWithJSON:rawActiveSkill[@"rune"]
                                                        ownerHeroID:self.heroID
                                                          ownerType:kD3OwnerTypeHero
                                                            skillID:skill.skillSlug];
                        
                        [skill setSkillRune:rune];
                    }
                    
                    [mutableActiveSkills addObject:skill];
                }
            }
            
            [self setActiveSkills:mutableActiveSkills];
        }
        
        /// Parsing passive skills
        if (rawSkills[@"passive"]) {
            NSMutableArray *mutablePassiveSkills = [NSMutableArray array];
            
            NSArray *rawPassiveSkills = rawSkills[@"passive"];
            for (NSDictionary *rawPassiveSkill in rawPassiveSkills) {
                if (rawPassiveSkill[@"skill"]) {
                    D3Skill *skill = [[D3Skill alloc] initWithJSON:rawPassiveSkill[@"skill"]
                                                  skillOwnerHeroID:self.heroID
                                                    skillOwnerType:kD3OwnerTypeHero
                                                         skillType:kD3SkillTypePassive];
                    [mutablePassiveSkills addObject:skill];
                }
            }
            
            [self setPassiveSkills:mutablePassiveSkills];
        }
    }
    
    /// Parsing items information
    if (json[@"items"]) {
        NSDictionary *rawItems = json[@"items"];
        NSMutableDictionary *mutableItems = [NSMutableDictionary dictionary];
        
        if (rawItems[@"head"]) {
            D3Item *item = [[D3Item alloc] initWithJSON:rawItems[@"head"]
                                        itemOwnerHeroID:[self heroID]
                                          itemOwnerType:kD3OwnerTypeHero
                                               itemSlot:kD3ItemSlotHead];
            [mutableItems setObject:item forKey:@"head"];
        }
        
        if (rawItems[@"torso"]) {
            D3Item *item = [[D3Item alloc] initWithJSON:rawItems[@"torso"]
                                        itemOwnerHeroID:[self heroID]
                                          itemOwnerType:kD3OwnerTypeHero
                                               itemSlot:kD3ItemSlotTorso];
            [mutableItems setObject:item forKey:@"torso"];
        }
        
        if (rawItems[@"feet"]) {
            D3Item *item = [[D3Item alloc] initWithJSON:rawItems[@"feet"]
                                        itemOwnerHeroID:[self heroID]
                                          itemOwnerType:kD3OwnerTypeHero
                                               itemSlot:kD3ItemSlotFeet];
            [mutableItems setObject:item forKey:@"feet"];
        }
        
        if (rawItems[@"hands"]) {
            D3Item *item = [[D3Item alloc] initWithJSON:rawItems[@"hands"]
                                        itemOwnerHeroID:[self heroID]
                                          itemOwnerType:kD3OwnerTypeHero
                                               itemSlot:kD3ItemSlotHands];
            [mutableItems setObject:item forKey:@"hands"];
        }
        
        if (rawItems[@"shoulders"]) {
            D3Item *item = [[D3Item alloc] initWithJSON:rawItems[@"shoulders"]
                                        itemOwnerHeroID:[self heroID]
                                          itemOwnerType:kD3OwnerTypeHero
                                               itemSlot:kD3ItemSlotShoulders];
            [mutableItems setObject:item forKey:@"shoulders"];
        }
        
        if (rawItems[@"legs"]) {
            D3Item *item = [[D3Item alloc] initWithJSON:rawItems[@"legs"]
                                        itemOwnerHeroID:[self heroID]
                                          itemOwnerType:kD3OwnerTypeHero
                                               itemSlot:kD3ItemSlotLegs];
            [mutableItems setObject:item forKey:@"legs"];
        }
        
        if (rawItems[@"bracers"]) {
            D3Item *item = [[D3Item alloc] initWithJSON:rawItems[@"bracers"]
                                        itemOwnerHeroID:[self heroID]
                                          itemOwnerType:kD3OwnerTypeHero
                                               itemSlot:kD3ItemSlotBracers];
            [mutableItems setObject:item forKey:@"bracers"];
        }
        
        if (rawItems[@"mainHand"]) {
            D3Item *item = [[D3Item alloc] initWithJSON:rawItems[@"mainHand"]
                                        itemOwnerHeroID:[self heroID]
                                          itemOwnerType:kD3OwnerTypeHero
                                               itemSlot:kD3ItemSlotMainHand];
            [mutableItems setObject:item forKey:@"mainHand"];
        }
        
        if (rawItems[@"offHand"]) {
            D3Item *item = [[D3Item alloc] initWithJSON:rawItems[@"offHand"]
                                        itemOwnerHeroID:[self heroID]
                                          itemOwnerType:kD3OwnerTypeHero
                                               itemSlot:kD3ItemSlotOffHand];
            [mutableItems setObject:item forKey:@"offHand"];
        }
        
        if (rawItems[@"waist"]) {
            D3Item *item = [[D3Item alloc] initWithJSON:rawItems[@"waist"]
                                        itemOwnerHeroID:[self heroID]
                                          itemOwnerType:kD3OwnerTypeHero
                                               itemSlot:kD3ItemSlotWaist];
            [mutableItems setObject:item forKey:@"waist"];
        }
        
        if (rawItems[@"rightFinger"]) {
            D3Item *item = [[D3Item alloc] initWithJSON:rawItems[@"rightFinger"]
                                        itemOwnerHeroID:[self heroID]
                                          itemOwnerType:kD3OwnerTypeHero
                                               itemSlot:kD3ItemSlotRightFinger];
            [mutableItems setObject:item forKey:@"rightFinger"];
        }
        
        if (rawItems[@"leftFinger"]) {
            D3Item *item = [[D3Item alloc] initWithJSON:rawItems[@"leftFinger"]
                                        itemOwnerHeroID:[self heroID]
                                          itemOwnerType:kD3OwnerTypeHero
                                               itemSlot:kD3ItemSlotLeftFinger];
            [mutableItems setObject:item forKey:@"leftFinger"];
        }
        
        if (rawItems[@"neck"]) {
            D3Item *item = [[D3Item alloc] initWithJSON:rawItems[@"neck"]
                                        itemOwnerHeroID:[self heroID]
                                          itemOwnerType:kD3OwnerTypeHero
                                               itemSlot:kD3ItemSlotNeck];
            [mutableItems setObject:item forKey:@"neck"];
        }
        
        [self setItems:mutableItems];
    }
    
    /// Parsing followers information
    if (json[@"followers"]) {
        NSDictionary *rawFollowers = json[@"followers"];
        
        NSMutableDictionary *mutableFollowers = [NSMutableDictionary dictionary];
        
        D3Follower *templar, *scoundrel, *enchantress;
        
        if (rawFollowers[@"templar"]) {
            templar = [[D3Follower alloc] initWithJSON:rawFollowers[@"templar"]
                                        followerHeroID:self.heroID];
            [mutableFollowers setObject:templar forKey:@"templar"];
        }
        
        if (rawFollowers[@"scoundrel"]) {
            scoundrel = [[D3Follower alloc] initWithJSON:rawFollowers[@"scoundrel"]
                                          followerHeroID:self.heroID];
            [mutableFollowers setObject:scoundrel forKey:@"scoundrel"];
        }
        
        if (rawFollowers[@"enchantress"]) {
            enchantress = [[D3Follower alloc] initWithJSON:rawFollowers[@"enchantress"]
                                            followerHeroID:self.heroID];
            [mutableFollowers setObject:enchantress forKey:@"enchantress"];
        }
        
        [self setFollowers:mutableFollowers];
    }
    
    /// Parsing stats information
    if (json[@"stats"]) {
        NSDictionary *heroStats = json[@"stats"];
        
        [self updateHeroWithLife:[heroStats[@"life"] integerValue]
                          damage:[NSNumber numberWithDouble:[heroStats[@"damage"] doubleValue]]
                     attackSpeed:[NSNumber numberWithDouble:[heroStats[@"attackSpeed"] doubleValue]]
                           armor:[heroStats[@"armor"] integerValue]
                        strength:[heroStats[@"strength"] integerValue]
                       dexterity:[heroStats[@"dexterity"] integerValue]
                        vitality:[heroStats[@"vitality"] integerValue]
                    intelligence:[heroStats[@"intelligence"] integerValue]
                  resistPhysical:[heroStats[@"physicalResist"] integerValue]
                      resistFire:[heroStats[@"fireResist"] integerValue]
                      resistCold:[heroStats[@"coldResist"] integerValue]
                 resistLightning:[heroStats[@"lightningResist"] integerValue]
                    resistPoison:[heroStats[@"poisonResist"] integerValue]
                    resistArcane:[heroStats[@"arcaneResist"] integerValue]
                      critDamage:[NSNumber numberWithDouble:[heroStats[@"critDamage"] doubleValue]]
                     blockChance:[NSNumber numberWithDouble:[heroStats[@"blockChance"] doubleValue]]
                  blockAmountMin:[heroStats[@"blockAmountMin"] integerValue]
                  blockAmountMax:[heroStats[@"blockAmountMax"] integerValue]
                  damageIncrease:[NSNumber numberWithDouble:[heroStats[@"damageIncrease"] doubleValue]]
                      critChance:[NSNumber numberWithDouble:[heroStats[@"critChance"] doubleValue]]
                 damageReduction:[NSNumber numberWithDouble:[heroStats[@"damageReduction"] doubleValue]]
                          thorns:[NSNumber numberWithDouble:[heroStats[@"thorns"] doubleValue]]
                       lifeSteal:[NSNumber numberWithDouble:[heroStats[@"lifeSteal"] doubleValue]]
                     lifePerKill:[NSNumber numberWithDouble:[heroStats[@"lifePerKill"] doubleValue]]
                        goldFind:[NSNumber numberWithDouble:[heroStats[@"goldFind"] doubleValue]]
                       magicFind:[NSNumber numberWithDouble:[heroStats[@"magicFind"] doubleValue]]
                       lifeOnHit:[NSNumber numberWithDouble:[heroStats[@"lifeOnHit"] doubleValue]]
                 primaryResource:[heroStats[@"primaryResource"] integerValue]
               secondaryResource:[heroStats[@"secondaryResource"] integerValue]];
    }
    
    /// Parsing progress information
    /// TODO: progress parsing
    
    /// Parsing kills information
    if (json[@"kills"]) {
        NSDictionary *kills = json[@"kills"];
        if (kills[@"elites"]) {
            [self setKillsElites:[kills[@"elites"] integerValue]];
        }
    }
    
    /// Parsing last updated timestamp
    if (json[@"last-updated"]) {
        [self setHeroLastUpdated:[NSDate dateWithTimeIntervalSince1970:[json[@"last-updated"] doubleValue]]];
    }
    
}

@end
