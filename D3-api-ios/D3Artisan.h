//
//  D3Artisan.h
//  D3-api-ios
//
//  Created by Maxim Mikheev on 12.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3Object.h"

typedef enum {
    kD3ArtisanTypeUndefined,
    kD3ArtisanTypeBlacksmith,
    kD3ArtisanTypeJeweler,
} D3ArtisanType;

@interface D3Artisan : D3Object

@property (nonatomic, copy) NSString *battleTag;
@property (nonatomic) D3ArtisanType artisanType;
@property (nonatomic) NSInteger artisanLevel;
@property (nonatomic) NSInteger artisanStepCurrent;
@property (nonatomic) NSInteger artisanStepMax;
@property (nonatomic) BOOL isHardcoreArtisan;

#pragma mark - Fetch and Parse Methods

/// Method parse Artisan object from NSDictionary
+ (D3Artisan *)parseArtisanFromCareerJSON:(NSDictionary *)json withBattleTag:(NSString *)battleTag andHardcoreFlag:(BOOL)hardcoreFlag;

#pragma mark - Init Methods

/// Initialize Player's Artisan with zero values
- (id)init;

/// Initialize Player's Artisan with defined values
- (id)initWithBattleTag:(NSString *)battleTagVal
                   type:(D3ArtisanType)artisanTypeVal
                  level:(NSInteger)artisanLevelVal
            stepCurrent:(NSInteger)artisanStepCurrentVal
                stepMax:(NSInteger)artisanStepMaxVal
               hardcore:(BOOL)isHardcoreArtisanVal;

@end
