//
//  D3Progression.h
//  D3-api-ios
//
//  Created by Maxim Mikheev on 13.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3Object.h"

typedef enum {
    kD3ProgressionModeUndefined,
    kD3ProgressionModeNormal,
    kD3ProgressionModeHardcore
} D3ProgressionMode;

typedef enum {
    kD3ProgressionDifficultyUndefined,
    kD3ProgressionDifficultyNormal,
    kD3ProgressionDifficultyNightmare,
    kD3ProgressionDifficultyHell,
    kD3ProgressionDifficultyInferno
} D3ProgressionDifficulty;

typedef enum {
    kD3ProgressionActUndefined,
    kD3ProgressionAct1,
    kD3ProgressionAct2,
    kD3ProgressionAct3,
    kD3ProgressionAct4
} D3ProgressionAct;

@interface D3Progression : D3Object

/// Progression mode - hardcore or normal
@property (nonatomic) D3ProgressionMode progressionMode;
/// Progression difficulty
@property (nonatomic) D3ProgressionDifficulty progressionDifficulty;
/// Progression act
@property (nonatomic) D3ProgressionAct progressionAct;
/// Progression completed flag
@property (nonatomic) BOOL progressionCompleted;

#pragma mark - Init Methods

/// Initialize progression object with zero values
- (id)init;

/// Initialize progression object with defined values
- (id)initWithProgressionMode:(D3ProgressionMode)progressionModeVal
                   difficulty:(D3ProgressionDifficulty)progressionDifficultyVal
                          act:(D3ProgressionAct)progressionActVal
                    completed:(BOOL)progressionCompletedVal;

@end
