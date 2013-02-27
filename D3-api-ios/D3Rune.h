//
//  D3Rune.h
//  D3-api-ios
//
//  Created by Maxim Mikheev on 27.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3Object.h"

@interface D3Rune : D3Object

/// Rune's ID
@property (nonatomic, copy) NSString *runeID;
/// Rune's type
@property (nonatomic, copy) NSString *runeType;
/// Rune's name
@property (nonatomic, copy) NSString *runeName;
/// Rune's description
@property (nonatomic, copy) NSString *runeDescription;
/// Rune's simple description
@property (nonatomic, copy) NSString *runeSimpleDescription;
/// Rune's tooltip params
@property (nonatomic, copy) NSString *runeTooltipParams;
/// Rune's skill calculator ID
@property (nonatomic, copy) NSString *runeSkillCalcID;
/// Rune's level
@property (nonatomic) NSInteger runeLevel;
/// Rune's order
@property (nonatomic) NSInteger runeOrder;

/// Rune's skill's owner's hero
@property (nonatomic) NSInteger runeOwnerHeroID;
/// Type of rune's skill's owner (hero himself or one of followers)
@property (nonatomic) D3OwnerType runeOwnerType;
/// Rune's skill ID
@property (nonatomic, copy) NSString *runeSkillID;

#pragma mark - Init Methods

/// Initialize rune object with zero values
- (id)init;

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
         skillID:(NSString *)runeSkillIDVal;

/// Initialize rune object with json dictionary
- (id)initWithJSON:(NSDictionary *)json
       ownerHeroID:(NSInteger)runeOwnerHeroIDVal
         ownerType:(D3OwnerType)runeOwnerTypeVal
           skillID:(NSString *)runeSkillIDVal;

@end
