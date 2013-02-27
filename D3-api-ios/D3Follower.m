//
//  D3Follower.m
//  D3-api-ios
//
//  Created by Maxim Mikheev on 12.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3Follower.h"

@implementation D3Follower

@synthesize followerType, followerHeroID, followerLevel, followerGoldFind, followerMagicFind, followerExperienceBonus, followerItems, followerSkills;

/// TODO: Follower custom init methods!

/// Initialize follower object with json dictionary
- (id)initWithJSON:(NSDictionary *)json
    followerHeroID:(NSInteger)followerHeroIDVal {
    D3Follower *follower = [[D3Follower alloc] init];
    
    [follower setFollowerHeroID:followerHeroIDVal];
    
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
    
    if (json[@"level"]) {
        [follower setFollowerLevel:[json[@"level"] integerValue]];
    }
    
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
    
    /// TODO: add items and skills
    
    return follower;
}

@end
