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

@property (nonatomic) D3FollowerType followerType;
@property (nonatomic) NSInteger followerHeroID;
@property (nonatomic) NSInteger followerLevel;
@property (nonatomic) NSInteger followerGoldFind;
@property (nonatomic) NSInteger followerMagicFind;
@property (nonatomic) NSInteger followerExperienceBonus;
@property (nonatomic, strong) NSArray *followerItems;
@property (nonatomic, strong) NSArray *followerSkills;

@end
