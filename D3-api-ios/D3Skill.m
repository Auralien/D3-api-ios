//
//  D3Skill.m
//  D3-api-ios
//
//  Created by Maxim Mikheev on 15.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3Skill.h"

@implementation D3Skill

@synthesize skillSlug, skillName, skillType, skillOwnerHeroID, skillOwnerType, skillIcon, skillTooltipParams, skillDescription, skillSimpleDescription;

#pragma mark - Init Methods

/// Initialize hero object with zero values
- (id)init {
    return [self initWithSlug:@""
                         name:@"" 
                         type:kD3SkillTypeUndefined
                  ownerHeroID:0
                    ownerType:kD3SkillOwnerTypeUndefined
                         icon:@""
                tooltipParams:@""
                  description:@""
            simpleDescription:@""];
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
        [self setSkillTooltipParams:skillTooltipParamsVal];
        [self setSkillDescription:skillDescriptionVal];
        [self setSkillSimpleDescription:skillSimpleDescriptionVal];
    }
    return self;
}

@end
