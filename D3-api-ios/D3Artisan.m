//
//  D3Artisan.m
//  D3-api-ios
//
//  Created by Maxim Mikheev on 12.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3Artisan.h"

@implementation D3Artisan

@synthesize battleTag, artisanType, artisanLevel, artisanStepCurrent, artisanStepMax, isHardcoreArtisan;

#pragma mark - Fetch and Parse Methods

/// Method parse Artisan object from NSDictionary
+ (D3Artisan *)parseArtisanFromCareerJSON:(NSDictionary *)json withBattleTag:(NSString *)battleTag andHardcoreFlag:(BOOL)hardcoreFlag {
    D3Artisan *artisan = nil;
    
    if ([json isKindOfClass:[NSDictionary class]]) {
        D3ArtisanType artisanType = kD3ArtisanTypeUndefined;
        if (json[@"slug"]) {
            if ([json[@"slug"] isEqualToString:@"blacksmith"]) {
                artisanType = kD3ArtisanTypeBlacksmith;
            } else if ([json[@"slug"] isEqualToString:@"jeweler"]) {
                artisanType = kD3ArtisanTypeJeweler;
            }
        }
        
        artisan = [[D3Artisan alloc] initWithBattleTag:battleTag
                                                  type:artisanType
                                                 level:[json[@"level"] integerValue]
                                           stepCurrent:[json[@"stepCurrent"] integerValue]
                                               stepMax:[json[@"stepMax"] integerValue]
                                              hardcore:hardcoreFlag];
    }
    
    return artisan;
}


#pragma mark - Init Methods

/// Initialize Player's Artisan with zero values
- (id)init {
    return [self initWithBattleTag:@""
                              type:kD3ArtisanTypeUndefined
                             level:0
                       stepCurrent:0
                           stepMax:0
                          hardcore:NO];
}

/// Initialize Player's Artisan with defined values
- (id)initWithBattleTag:(NSString *)battleTagVal
                   type:(D3ArtisanType)artisanTypeVal
                  level:(NSInteger)artisanLevelVal
            stepCurrent:(NSInteger)artisanStepCurrentVal
                stepMax:(NSInteger)artisanStepMaxVal
               hardcore:(BOOL)isHardcoreArtisanVal {
    if (self = [super init]) {
        [self setBattleTag:battleTagVal];
        [self setArtisanType:artisanTypeVal];
        [self setArtisanLevel:artisanLevelVal];
        [self setArtisanStepCurrent:artisanStepCurrentVal];
        [self setArtisanStepMax:artisanStepMaxVal];
        [self setIsHardcoreArtisan:isHardcoreArtisanVal];
    }
    return self;
}

@end
