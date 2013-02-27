//
//  D3Follower.h
//  D3-api-ios
//
//  Created by Maxim Mikheev on 12.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3Object.h"

typedef enum {
    kD3FollowerTypeUndefined,
    kD3FollowerTypeTemplar,
    kD3FollowerTypeScoundrel,
    kD3FollowerTypeEnchantress
} D3FollowerType;

@interface D3Follower : D3Object

/// Follower's type
@property (nonatomic) D3FollowerType followerType;
/// Follower's hero id
@property (nonatomic) NSInteger followerHeroID;
/// Follower's level
@property (nonatomic) NSInteger followerLevel;
/// Follower's gold find bonus
@property (nonatomic) NSInteger followerGoldFind;
/// Follower's magic find bonus
@property (nonatomic) NSInteger followerMagicFind;
/// Follower's experience bonus
@property (nonatomic) NSInteger followerExperienceBonus;
/// Follower's items list
@property (nonatomic, strong) NSArray *followerItems;
/// Follower's skills list
@property (nonatomic, strong) NSArray *followerSkills;

#pragma mark - Init Methods

/// Initialize follower object with zero values
- (id)init;

/// Initialize follower object with defined values
- (id)initWithFollowerType:(D3FollowerType)followerTypeVal
                    heroID:(NSInteger)followerHeroIDVal
                     level:(NSInteger)followerLevelVal
                  goldFind:(NSInteger)followerGoldFindVal
                 magicFind:(NSInteger)followerMagicFindVal
           experienceBonus:(NSInteger)followerExperienceBonusVal;

/// Initialize follower object with json dictionary
- (id)initWithJSON:(NSDictionary *)json
    followerHeroID:(NSInteger)followerHeroIDVal;

@end
