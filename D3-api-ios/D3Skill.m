//
//  D3Skill.m
//  D3-api-ios
//
//  Created by Maxim Mikheev on 15.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3Skill.h"

@implementation D3Skill

@synthesize skillSlug, skillName, skillType, skillOwnerHeroID, skillOwnerType, skillLevel, skillCategoryID, skillIcon, skillTooltipURL, skillDescription, skillSimpleDescription, skillCalculatorID, skillFlavorText;

#pragma mark - Init Methods

/// Initialize skill object with zero values
- (id)init {
    if (self = [super init]) {
        [self setSkillSlug:@""];
        [self setSkillName:@""];
        [self setSkillType:kD3SkillTypeUndefined];
        [self setSkillOwnerHeroID:0];
        [self setSkillOwnerType:kD3SkillOwnerTypeUndefined];
        [self setSkillIcon:@""];
        [self setSkillTooltipURL:@""];
        [self setSkillDescription:@""];
        [self setSkillSimpleDescription:@""];
    }
    return self;
}

/// Initialize skill object with defined values
- (id)initWithSlug:(NSString *)skillSlugVal
              name:(NSString *)skillNameVal
              type:(D3SkillType)skillTypeVal
       ownerHeroID:(NSInteger)skillOwnerHeroIDVal
         ownerType:(D3SkillOwnerType)skillOwnerTypeVal
              icon:(NSString *)skillIconVal
     tooltipParams:(NSString *)skillTooltipParamsVal
       description:(NSString *)skillDescriptionVal
 simpleDescription:(NSString *)skillSimpleDescriptionVal {
    if (self = [super init]) {
        [self setSkillSlug:skillSlugVal];
        [self setSkillName:skillNameVal];
        [self setSkillType:skillTypeVal];
        [self setSkillOwnerHeroID:skillOwnerHeroIDVal];
        [self setSkillOwnerType:skillOwnerTypeVal];
        [self setSkillIcon:skillIconVal];
        [self setSkillTooltipURL:skillTooltipParamsVal];
        [self setSkillDescription:skillDescriptionVal];
        [self setSkillSimpleDescription:skillSimpleDescriptionVal];
    }
    return self;
}

/// Initialize skill object with json dictionary
- (id)initWithJSON:(NSDictionary *)json
  skillOwnerHeroID:(NSInteger)skillOwnerHeroIDVal
    skillOwnerType:(D3SkillOwnerType)skillOwnerTypeVal
         skillType:(D3SkillType)skillTypeVal {
    D3Skill *skill = [[D3Skill alloc] init];
    
    [skill setSkillOwnerHeroID:skillOwnerHeroIDVal];
    [skill setSkillOwnerType:skillOwnerTypeVal];
    [skill setSkillType:skillTypeVal];
    
    if (json[@"slug"]) {
        [skill setSkillSlug:json[@"slug"]];
    }
    
    if (json[@"name"]) {
        [skill setSkillName:json[@"name"]];
    }
    
    if (json[@"icon"]) {
        [skill setSkillIcon:json[@"icon"]];
    }
    
    if (json[@"level"]) {
        [skill setSkillLevel:[json[@"level"] integerValue]];
    }
    
    if (json[@"categorySlug"]) {
        [skill setSkillCategoryID:json[@"categorySlug"]];
    }
    
    if (json[@"tooltipUrl"]) {
        [skill setSkillTooltipURL:json[@"tooltipUrl"]];
    }
    
    if (json[@"description"]) {
        [skill setSkillDescription:json[@"description"]];
    }
    
    if (json[@"simpleDescription"]) {
        [skill setSkillSimpleDescription:json[@"simpleDescription"]];
    }
    
    if (json[@"skillCalcId"]) {
        [skill setSkillCalculatorID:json[@"skillCalcId"]];
    }
    
    if (json[@"flavor"]) {
        [skill setSkillFlavorText:json[@"flavor"]];
    }
    
    return skill;
}

@end
