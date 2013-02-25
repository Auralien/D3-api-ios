//
//  D3Skill.h
//  D3-api-ios
//
//  Created by Maxim Mikheev on 15.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3Object.h"

typedef enum {
    kD3SkillTypeUndefined,
    kD3SkillTypeActive,
    kD3SkillTypePassive,
    kD3SkillTypeFollower
} D3SkillType;

typedef enum {
    kD3SkillOwnerTypeUndefined,
    kD3SkillOwnerTypeHero,
    kD3SkillOwnerTypeFollowerTemplar,
    kD3SkillOwnerTypeFollowerScoundrel,
    kD3SkillOwnerTypeFollowerEnchantress
} D3SkillOwnerType;

@interface D3Skill : D3Object

/// Skill ID
@property (nonatomic, copy) NSString *skillSlug;
/// Skill name
@property (nonatomic, copy) NSString *skillName;
/// Skill type (active, passive, follower's skill)
@property (nonatomic) D3SkillType skillType;
/// Skill's owner's hero
@property (nonatomic) NSInteger skillOwnerHeroID;
/// Type of skill's owner (hero himself or one of followers)
@property (nonatomic) D3SkillOwnerType skillOwnerType;
/// Skill's available level
@property (nonatomic) NSInteger skillLevel;
/// Skill's category ID
@property (nonatomic, copy) NSString *skillCategoryID;
/// Skill's icon
@property (nonatomic, copy) NSString *skillIcon;
/// Skill's tooltips parameters
@property (nonatomic, copy) NSString *skillTooltipURL;
/// Skill's description
@property (nonatomic, copy) NSString *skillDescription;
/// Skill's simple description
@property (nonatomic, copy) NSString *skillSimpleDescription;
/// Skill's calculator ID
@property (nonatomic, copy) NSString *skillCalculatorID;
/// Skill's flavor text
@property (nonatomic, copy) NSString *skillFlavorText;

#pragma mark - Init Methods

/// Initialize hero object with zero values
- (id)init;

/// Initialize skill object with defined values
- (id)initWithSlug:(NSString *)skillSlugVal
              name:(NSString *)skillNameVal
              type:(D3SkillType)skillTypeVal
       ownerHeroID:(NSInteger)skillOwnerHeroIDVal
         ownerType:(D3SkillOwnerType)skillOwnerTypeVal
              icon:(NSString *)skillIconVal
     tooltipParams:(NSString *)skillTooltipParamsVal
       description:(NSString *)skillDescriptionVal
 simpleDescription:(NSString *)skillSimpleDescriptionVal;

/// Initialize skill object with json dictionary
- (id)initWithJSON:(NSDictionary *)json
  skillOwnerHeroID:(NSInteger)skillOwnerHeroIDVal
    skillOwnerType:(D3SkillOwnerType)skillOwnerTypeVal
         skillType:(D3SkillType)skillTypeVal;

@end
