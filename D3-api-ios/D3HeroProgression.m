//
//  D3HeroProgression.m
//  D3-api-ios
//
//  Created by Apple Developer on 13.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3HeroProgression.h"

@implementation D3HeroProgression

@synthesize heroID;

#pragma mark - Init Methods

/// Initialize hero progression object with zero values
- (id)init {
    return [self initWithHeroID:0
                progressionMode:kD3ProgressionModeUndefined
                     difficulty:kD3ProgressionDifficultyUndefined
                            act:kD3ProgressionActUndefined
                      completed:NO];
}

/// Initialize hero progression object with defined values
- (id)initWithHeroID:(NSInteger)heroIDVal
     progressionMode:(D3ProgressionMode)progressionModeVal
          difficulty:(D3ProgressionDifficulty)progressionDifficultyVal
                 act:(D3ProgressionAct)progressionActVal
           completed:(BOOL)progressionCompletedVal {
    if (self = [super initWithProgressionMode:progressionModeVal
                                   difficulty:progressionDifficultyVal
                                          act:progressionActVal
                                    completed:progressionCompletedVal]) {
        [self setHeroID:heroIDVal];
    }
    return self;
}

@end
