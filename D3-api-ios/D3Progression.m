//
//  D3Progression.m
//  D3-api-ios
//
//  Created by Maxim Mikheev on 13.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3Progression.h"

@implementation D3Progression

@synthesize progressionMode, progressionDifficulty, progressionAct, progressionCompleted;

#pragma mark - Init Methods

/// Initialize progression object with zero values
- (id)init {
    return [self initWithProgressionMode:kD3ProgressionModeUndefined
                              difficulty:kD3ProgressionDifficultyUndefined
                                     act:kD3ProgressionActUndefined
                               completed:NO];
}

/// Initialize progression object with defined values
- (id)initWithProgressionMode:(D3ProgressionMode)progressionModeVal
                   difficulty:(D3ProgressionDifficulty)progressionDifficultyVal
                          act:(D3ProgressionAct)progressionActVal
                    completed:(BOOL)progressionCompletedVal {
    if (self = [super init]) {
        [self setProgressionMode:progressionModeVal];
        [self setProgressionDifficulty:progressionDifficultyVal];
        [self setProgressionAct:progressionActVal];
        [self setProgressionCompleted:progressionCompletedVal];
    }
    return self;
}

@end
