//
//  D3CareerProgression.m
//  D3-api-ios
//
//  Created by Apple Developer on 13.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3CareerProgression.h"

@implementation D3CareerProgression

@synthesize careerBattleTag;

#pragma mark - Init Methods

/// Initialize career progression object with zero values
- (id)init {
    return [self initWithCareerBattleTag:@""
                         progressionMode:kD3ProgressionModeUndefined
                              difficulty:kD3ProgressionDifficultyUndefined
                                     act:kD3ProgressionActUndefined
                               completed:NO];
}

/// Initialize career progression object with defined values
- (id)initWithCareerBattleTag:(NSString *)careerBattleTagVal
              progressionMode:(D3ProgressionMode)progressionModeVal
                   difficulty:(D3ProgressionDifficulty)progressionDifficultyVal
                          act:(D3ProgressionAct)progressionActVal
                    completed:(BOOL)progressionCompletedVal {
    if (self = [super initWithProgressionMode:progressionModeVal
                                   difficulty:progressionDifficultyVal
                                          act:progressionActVal
                                    completed:progressionCompletedVal]) {
        [self setCareerBattleTag:careerBattleTagVal];
    }
    return self;
}

@end
