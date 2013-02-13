//
//  D3CareerProgression.h
//  D3-api-ios
//
//  Created by Apple Developer on 13.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3Progression.h"

@interface D3CareerProgression : D3Progression

/// Career unique ID
@property (nonatomic, copy) NSString *careerBattleTag;

#pragma mark - Init Methods

/// Initialize career progression object with zero values
- (id)init;

/// Initialize career progression object with defined values
- (id)initWithCareerBattleTag:(NSString *)careerBattleTagVal
              progressionMode:(D3ProgressionMode)progressionModeVal
                   difficulty:(D3ProgressionDifficulty)progressionDifficultyVal
                          act:(D3ProgressionAct)progressionActVal
                    completed:(BOOL)progressionCompletedVal;

@end
