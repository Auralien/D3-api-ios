//
//  D3HeroProgression.h
//  D3-api-ios
//
//  Created by Maxim Mikheev on 13.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3Progression.h"

@interface D3HeroProgression : D3Progression

/// Hero unique ID
@property (nonatomic) NSInteger heroID;

#pragma mark - Init Methods

/// Initialize hero progression object with zero values
- (id)init;

/// Initialize hero progression object with defined values
- (id)initWithHeroID:(NSInteger)heroIDVal
     progressionMode:(D3ProgressionMode)progressionModeVal
          difficulty:(D3ProgressionDifficulty)progressionDifficultyVal
                 act:(D3ProgressionAct)progressionActVal
           completed:(BOOL)progressionCompletedVal;

@end
