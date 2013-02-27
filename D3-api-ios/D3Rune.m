//
//  D3Rune.m
//  D3-api-ios
//
//  Created by Maxim Mikheev on 27.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3Rune.h"

@implementation D3Rune

@synthesize runeID, runeType, runeName, runeDescription, runeSimpleDescription, runeTooltipParams, runeSkillCalcID, runeLevel, runeOrder, runeOwnerHeroID, runeOwnerType, runeSkillID;

#pragma mark - Init Methods

/// Initialize rune object with zero values
- (id)init {
    return [self initRuneID:@""
                       type:@""
                       name:@""
                description:@""
          simpleDescription:@""
              tooltipParams:@""
                skillCalcID:@""
                      level:0
                      order:0
                ownerHeroID:0
                  ownerType:kD3OwnerTypeUndefined
                    skillID:@""];
}

/// Initialize rune object with defined values
- (id)initRuneID:(NSString *)runeIDVal
            type:(NSString *)runeTypeVal
            name:(NSString *)runeNameVal
     description:(NSString *)runeDescriptionVal
simpleDescription:(NSString *)runeSimpleDescriptionVal
   tooltipParams:(NSString *)runeTooltipParamsVal
     skillCalcID:(NSString *)runeSkillCalcIDVal
           level:(NSInteger)runeLevelVal
           order:(NSInteger)runeOrderVal
     ownerHeroID:(NSInteger)runeOwnerHeroIDVal
       ownerType:(D3OwnerType)runeOwnerTypeVal
         skillID:(NSString *)runeSkillIDVal {
    if (self = [super init]) {
        [self setRuneID:runeIDVal];
        [self setRuneType:runeTypeVal];
        [self setRuneName:runeNameVal];
        [self setRuneDescription:runeDescriptionVal];
        [self setRuneSimpleDescription:runeSimpleDescriptionVal];
        [self setRuneTooltipParams:runeTooltipParamsVal];
        [self setRuneSkillCalcID:runeSkillCalcIDVal];
        [self setRuneLevel:runeLevelVal];
        [self setRuneOrder:runeOrderVal];
        [self setRuneOwnerHeroID:runeOwnerHeroIDVal];
        [self setRuneOwnerType:runeOwnerTypeVal];
        [self setRuneSkillID:runeSkillIDVal];
    }
    return self;
}

/// Initialize rune object with json dictionary
- (id)initWithJSON:(NSDictionary *)json
       ownerHeroID:(NSInteger)runeOwnerHeroIDVal
         ownerType:(D3OwnerType)runeOwnerTypeVal
           skillID:(NSString *)runeSkillIDVal {
    D3Rune *rune = [[D3Rune alloc] init];
    
    [rune setRuneOwnerHeroID:runeOwnerHeroIDVal];
    [rune setRuneOwnerType:runeOwnerTypeVal];
    [rune setRuneSkillID:runeSkillIDVal];
    
    if (json[@"slug"]) {
        [rune setRuneID:json[@"slug"]];
    }
    
    if (json[@"type"]) {
        [rune setRuneType:json[@"type"]];
    }
    
    if (json[@"name"]) {
        [rune setRuneType:json[@"name"]];
    }
    
    if (json[@"level"]) {
        [rune setRuneLevel:[json[@"level"] integerValue]];
    }
    
    if (json[@"description"]) {
        [rune setRuneDescription:json[@"description"]];
    }
    
    if (json[@"simpleDescription"]) {
        [rune setRuneSimpleDescription:json[@"simpleDescription"]];
    }
    
    if (json[@"tooltipParams"]) {
        [rune setRuneTooltipParams:json[@"tooltipParams"]];
    }
    
    if (json[@"skillCalcId"]) {
        [rune setRuneSkillCalcID:json[@"skillCalcId"]];
    }
    
    if (json[@"order"]) {
        [rune setRuneOrder:[json[@"order"] integerValue]];
    }
    
    return rune;
}

@end
