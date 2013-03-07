//
//  D3Follower.m
//  D3-api-ios
//
//  Created by Maxim Mikheev on 12.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3Follower.h"
#import "D3Item.h"
#import "D3Skill.h"

@implementation D3Follower

@synthesize followerType, followerHeroID, followerLevel, followerGoldFind, followerMagicFind, followerExperienceBonus, followerItems, followerSkills;

#pragma mark - Init Methods

/// Initialize follower object with zero values
- (id)init {
    return [self initWithFollowerType:kD3FollowerTypeUndefined
                               heroID:0
                                level:0
                             goldFind:0
                            magicFind:0
                      experienceBonus:0];
}

/// Initialize follower object with defined values
- (id)initWithFollowerType:(D3FollowerType)followerTypeVal
                    heroID:(NSInteger)followerHeroIDVal
                     level:(NSInteger)followerLevelVal
                  goldFind:(NSInteger)followerGoldFindVal
                 magicFind:(NSInteger)followerMagicFindVal
           experienceBonus:(NSInteger)followerExperienceBonusVal {
    if (self = [super init]) {
        [self setFollowerType:followerTypeVal];
        [self setFollowerHeroID:followerHeroIDVal];
        [self setFollowerLevel:followerLevelVal];
        [self setFollowerGoldFind:followerGoldFindVal];
        [self setFollowerMagicFind:followerMagicFindVal];
        [self setFollowerExperienceBonus:followerExperienceBonusVal];
    }
    return self;
}

/// Initialize follower object with json dictionary
- (id)initWithJSON:(NSDictionary *)json
    followerHeroID:(NSInteger)followerHeroIDVal {
    D3Follower *follower = [[D3Follower alloc] init];
    
    [follower setFollowerHeroID:followerHeroIDVal];
    
    /// Parsing follower's type information
    if (json[@"slug"]) {
        NSString *rawFollowerType = json[@"slug"];
        if ([rawFollowerType isEqualToString:@"templar"]) {
            [follower setFollowerType:kD3FollowerTypeTemplar];
        } else if ([rawFollowerType isEqualToString:@"scoundrel"]) {
            [follower setFollowerType:kD3FollowerTypeScoundrel];
        } else if ([rawFollowerType isEqualToString:@"enchantress"]) {
            [follower setFollowerType:kD3FollowerTypeEnchantress];
        }
    }
    
    /// Parsing follower's level information
    if (json[@"level"]) {
        [follower setFollowerLevel:[json[@"level"] integerValue]];
    }
    
    /// Parsion follower's stats information
    if (json[@"stats"]) {
        NSDictionary *followerStats = json[@"stats"];
        
        if (followerStats[@"goldFind"]) {
            [follower setFollowerGoldFind:[followerStats[@"goldFind"] integerValue]];
        }
        
        if (followerStats[@"magicFind"]) {
            [follower setFollowerMagicFind:[followerStats[@"magicFind"] integerValue]];
        }
        
        if (followerStats[@"experienceBonus"]) {
            [follower setFollowerExperienceBonus:[followerStats[@"experienceBonus"] integerValue]];
        }
    }
    
    /// Parsing follower's items into @a followerItems
    if (json[@"items"]) {
        NSDictionary *rawItems = json[@"items"];
        NSMutableDictionary *mutableFollowerItems = [NSMutableDictionary dictionary];
        
        D3OwnerType itemOwnerType;
        
        switch ([follower followerType]) {
            case kD3FollowerTypeTemplar:
                itemOwnerType = kD3OwnerTypeTemplar;
                break;
            case kD3FollowerTypeScoundrel:
                itemOwnerType = kD3OwnerTypeScoundrel;
                break;
            case kD3FollowerTypeEnchantress:
                itemOwnerType = kD3OwnerTypeEnchantress;
                break;
                
            default:
                itemOwnerType = kD3OwnerTypeUndefined;
                break;
        }
        
        if (rawItems[@"special"]) {
            D3Item *specialItem = [[D3Item alloc] initWithJSON:rawItems[@"special"]
                                               itemOwnerHeroID:[follower followerHeroID]
                                                 itemOwnerType:itemOwnerType
                                                      itemSlot:kD3ItemSlotSpecial];
            [mutableFollowerItems setObject:specialItem forKey:@"special"];
        }
        
        if (rawItems[@"mainHand"]) {
            D3Item *mainHandItem = [[D3Item alloc] initWithJSON:rawItems[@"mainHand"]
                                                itemOwnerHeroID:[follower followerHeroID]
                                                  itemOwnerType:itemOwnerType
                                                       itemSlot:kD3ItemSlotMainHand];
            [mutableFollowerItems setObject:mainHandItem forKey:@"mainHand"];
        }
        
        if (rawItems[@"offHand"]) {
            D3Item *offHandItem = [[D3Item alloc] initWithJSON:rawItems[@"offHand"]
                                               itemOwnerHeroID:[follower followerHeroID]
                                                 itemOwnerType:itemOwnerType
                                                      itemSlot:kD3ItemSlotOffHand];
            [mutableFollowerItems setObject:offHandItem forKey:@"offHand"];
        }
        
        if (rawItems[@"rightFinger"]) {
            D3Item *rightFingerItem = [[D3Item alloc] initWithJSON:rawItems[@"rightFinger"]
                                                   itemOwnerHeroID:[follower followerHeroID]
                                                     itemOwnerType:itemOwnerType
                                                          itemSlot:kD3ItemSlotRightFinger];
            [mutableFollowerItems setObject:rightFingerItem forKey:@"rightFinger"];
        }
        
        if (rawItems[@"leftFinger"]) {
            D3Item *leftFingerItem = [[D3Item alloc] initWithJSON:rawItems[@"leftFinger"]
                                                  itemOwnerHeroID:[follower followerHeroID]
                                                    itemOwnerType:itemOwnerType
                                                         itemSlot:kD3ItemSlotLeftFinger];
            [mutableFollowerItems setObject:leftFingerItem forKey:@"leftFinger"];
        }
        
        if (rawItems[@"neck"]) {
            D3Item *neckItem = [[D3Item alloc] initWithJSON:rawItems[@"neck"]
                                            itemOwnerHeroID:[follower followerHeroID]
                                              itemOwnerType:itemOwnerType
                                                   itemSlot:kD3ItemSlotNeck];
            [mutableFollowerItems setObject:neckItem forKey:@"neck"];
        }
        
        [self setFollowerItems:mutableFollowerItems];
    }
    
    /// Parsing follower's skills into @a followerSkills
    if (json[@"skills"]) {
        NSArray *rawSkills = json[@"skills"];
        NSMutableArray *mutableFollowerSkills = [NSMutableArray array];
        
        D3OwnerType skillOwnerType;
        
        switch ([follower followerType]) {
            case kD3FollowerTypeTemplar:
                skillOwnerType = kD3OwnerTypeTemplar;
                break;
            case kD3FollowerTypeScoundrel:
                skillOwnerType = kD3OwnerTypeScoundrel;
                break;
            case kD3FollowerTypeEnchantress:
                skillOwnerType = kD3OwnerTypeEnchantress;
                break;
                
            default:
                skillOwnerType = kD3OwnerTypeUndefined;
                break;
        }
        
        for (NSDictionary *rawSkill in rawSkills) {
            if (rawSkill[@"skill"]) {
                D3Skill *skill = [[D3Skill alloc] initWithJSON:rawSkill[@"skill"]
                                              skillOwnerHeroID:[follower followerHeroID]
                                                skillOwnerType:skillOwnerType
                                                     skillType:kD3SkillTypeFollower];
                [mutableFollowerSkills addObject:skill];
            }
        }
        
        [self setFollowerSkills:mutableFollowerSkills];
    }
    
    return follower;
}

@end
