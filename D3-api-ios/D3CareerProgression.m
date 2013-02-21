//
//  D3CareerProgression.m
//  D3-api-ios
//
//  Created by Maxim Mikheev on 13.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3CareerProgression.h"

@implementation D3CareerProgression

@synthesize careerBattleTag;

#pragma mark - Fetch and Parse Methods

/// Method parses progression JSON and return array of D3CareerProgression objects
+ (NSArray *)parseCareerProgressionFromJSON:(NSDictionary *)json
                              withBattleTag:(NSString *)battleTag
                            andHardcoreFlag:(BOOL)hardcoreFlag {
    NSMutableArray *progressionElementsArray = [NSMutableArray array];
    NSDictionary *difficulty;
    
    D3ProgressionMode progressionMode = kD3ProgressionModeUndefined;
    if (hardcoreFlag)   progressionMode = kD3ProgressionModeHardcore;
    else                progressionMode = kD3ProgressionModeNormal;
    
    /// Saving normal
    difficulty = json[@"normal"];
    if (difficulty) {
        NSDictionary *act;
        
        /// Saving normal act 1
        act = difficulty[@"act1"];
        if (act) {
            if (act[@"completed"]) {
                BOOL completed = [act[@"completed"] boolValue];
                D3CareerProgression *careerProgression = [[D3CareerProgression alloc]
                                                          initWithCareerBattleTag:battleTag
                                                          progressionMode:progressionMode
                                                          difficulty:kD3ProgressionDifficultyNormal
                                                          act:kD3ProgressionAct1
                                                          completed:completed];
                [progressionElementsArray addObject:careerProgression];
            }
        }
        
        /// Saving normal act 2
        act = difficulty[@"act2"];
        if (act) {
            if (act[@"completed"]) {
                BOOL completed = [act[@"completed"] boolValue];
                D3CareerProgression *careerProgression = [[D3CareerProgression alloc]
                                                          initWithCareerBattleTag:battleTag
                                                          progressionMode:progressionMode
                                                          difficulty:kD3ProgressionDifficultyNormal
                                                          act:kD3ProgressionAct2
                                                          completed:completed];
                [progressionElementsArray addObject:careerProgression];
            }
        }
        
        /// Saving normal act 3
        act = difficulty[@"act3"];
        if (act) {
            if (act[@"completed"]) {
                BOOL completed = [act[@"completed"] boolValue];
                D3CareerProgression *careerProgression = [[D3CareerProgression alloc]
                                                          initWithCareerBattleTag:battleTag
                                                          progressionMode:progressionMode
                                                          difficulty:kD3ProgressionDifficultyNormal
                                                          act:kD3ProgressionAct3
                                                          completed:completed];
                [progressionElementsArray addObject:careerProgression];
            }
        }
        
        /// Saving normal cat 4
        act = difficulty[@"act4"];
        if (act) {
            if (act[@"completed"]) {
                BOOL completed = [act[@"completed"] boolValue];
                D3CareerProgression *careerProgression = [[D3CareerProgression alloc]
                                                          initWithCareerBattleTag:battleTag
                                                          progressionMode:progressionMode
                                                          difficulty:kD3ProgressionDifficultyNormal
                                                          act:kD3ProgressionAct4
                                                          completed:completed];
                [progressionElementsArray addObject:careerProgression];
            }
        }
    }
    
    /// Saving nightmare
    difficulty = json[@"nightmare"];
    if (difficulty) {
        NSDictionary *act;
        
        /// Saving nightmare act 1
        act = difficulty[@"act1"];
        if (act) {
            if (act[@"completed"]) {
                BOOL completed = [act[@"completed"] boolValue];
                D3CareerProgression *careerProgression = [[D3CareerProgression alloc]
                                                          initWithCareerBattleTag:battleTag
                                                          progressionMode:progressionMode
                                                          difficulty:kD3ProgressionDifficultyNightmare
                                                          act:kD3ProgressionAct1
                                                          completed:completed];
                [progressionElementsArray addObject:careerProgression];
            }
        }
        
        /// Saving nightmare act 2
        act = difficulty[@"act2"];
        if (act) {
            if (act[@"completed"]) {
                BOOL completed = [act[@"completed"] boolValue];
                D3CareerProgression *careerProgression = [[D3CareerProgression alloc]
                                                          initWithCareerBattleTag:battleTag
                                                          progressionMode:progressionMode
                                                          difficulty:kD3ProgressionDifficultyNightmare
                                                          act:kD3ProgressionAct2
                                                          completed:completed];
                [progressionElementsArray addObject:careerProgression];
            }
        }
        
        /// Saving nightmare act 3
        act = difficulty[@"act3"];
        if (act) {
            if (act[@"completed"]) {
                BOOL completed = [act[@"completed"] boolValue];
                D3CareerProgression *careerProgression = [[D3CareerProgression alloc]
                                                          initWithCareerBattleTag:battleTag
                                                          progressionMode:progressionMode
                                                          difficulty:kD3ProgressionDifficultyNightmare
                                                          act:kD3ProgressionAct3
                                                          completed:completed];
                [progressionElementsArray addObject:careerProgression];
            }
        }
        
        /// Saving nightmare act 4
        act = difficulty[@"act4"];
        if (act) {
            if (act[@"completed"]) {
                BOOL completed = [act[@"completed"] boolValue];
                D3CareerProgression *careerProgression = [[D3CareerProgression alloc]
                                                          initWithCareerBattleTag:battleTag
                                                          progressionMode:progressionMode
                                                          difficulty:kD3ProgressionDifficultyNightmare
                                                          act:kD3ProgressionAct4
                                                          completed:completed];
                [progressionElementsArray addObject:careerProgression];
            }
        }
    }
    
    /// Saving hell
    difficulty = json[@"hell"];
    if (difficulty) {
        NSDictionary *act;
        
        /// Saving hell act 1
        act = difficulty[@"act1"];
        if (act) {
            if (act[@"completed"]) {
                BOOL completed = [act[@"completed"] boolValue];
                D3CareerProgression *careerProgression = [[D3CareerProgression alloc]
                                                          initWithCareerBattleTag:battleTag
                                                          progressionMode:progressionMode
                                                          difficulty:kD3ProgressionDifficultyHell
                                                          act:kD3ProgressionAct1
                                                          completed:completed];
                [progressionElementsArray addObject:careerProgression];
            }
        }
        
        /// Saving hell act 2
        act = difficulty[@"act2"];
        if (act) {
            if (act[@"completed"]) {
                BOOL completed = [act[@"completed"] boolValue];
                D3CareerProgression *careerProgression = [[D3CareerProgression alloc]
                                                          initWithCareerBattleTag:battleTag
                                                          progressionMode:progressionMode
                                                          difficulty:kD3ProgressionDifficultyHell
                                                          act:kD3ProgressionAct2
                                                          completed:completed];
                [progressionElementsArray addObject:careerProgression];
            }
        }
        
        /// Saving hell act 3
        act = difficulty[@"act3"];
        if (act) {
            if (act[@"completed"]) {
                BOOL completed = [act[@"completed"] boolValue];
                D3CareerProgression *careerProgression = [[D3CareerProgression alloc]
                                                          initWithCareerBattleTag:battleTag
                                                          progressionMode:progressionMode
                                                          difficulty:kD3ProgressionDifficultyHell
                                                          act:kD3ProgressionAct3
                                                          completed:completed];
                [progressionElementsArray addObject:careerProgression];
            }
        }
        
        /// Saving hell act 4
        act = difficulty[@"act4"];
        if (act) {
            if (act[@"completed"]) {
                BOOL completed = [act[@"completed"] boolValue];
                D3CareerProgression *careerProgression = [[D3CareerProgression alloc]
                                                          initWithCareerBattleTag:battleTag
                                                          progressionMode:progressionMode
                                                          difficulty:kD3ProgressionDifficultyHell
                                                          act:kD3ProgressionAct4
                                                          completed:completed];
                [progressionElementsArray addObject:careerProgression];
            }
        }
    }
    
    /// Saving inferno
    difficulty = json[@"inferno"];
    if (difficulty) {
        NSDictionary *act;
        
        /// Saving inferno act 1
        act = difficulty[@"act1"];
        if (act) {
            if (act[@"completed"]) {
                BOOL completed = [act[@"completed"] boolValue];
                D3CareerProgression *careerProgression = [[D3CareerProgression alloc]
                                                          initWithCareerBattleTag:battleTag
                                                          progressionMode:progressionMode
                                                          difficulty:kD3ProgressionDifficultyInferno
                                                          act:kD3ProgressionAct1
                                                          completed:completed];
                [progressionElementsArray addObject:careerProgression];
            }
        }
        
        /// Saving inferno act 2
        act = difficulty[@"act2"];
        if (act) {
            if (act[@"completed"]) {
                BOOL completed = [act[@"completed"] boolValue];
                D3CareerProgression *careerProgression = [[D3CareerProgression alloc]
                                                          initWithCareerBattleTag:battleTag
                                                          progressionMode:progressionMode
                                                          difficulty:kD3ProgressionDifficultyInferno
                                                          act:kD3ProgressionAct2
                                                          completed:completed];
                [progressionElementsArray addObject:careerProgression];
            }
        }
        
        /// Saving inferno act 3
        act = difficulty[@"act3"];
        if (act) {
            if (act[@"completed"]) {
                BOOL completed = [act[@"completed"] boolValue];
                D3CareerProgression *careerProgression = [[D3CareerProgression alloc]
                                                          initWithCareerBattleTag:battleTag
                                                          progressionMode:progressionMode
                                                          difficulty:kD3ProgressionDifficultyInferno
                                                          act:kD3ProgressionAct3
                                                          completed:completed];
                [progressionElementsArray addObject:careerProgression];
            }
        }
        
        /// Saving inferno act 4
        act = difficulty[@"act4"];
        if (act) {
            if (act[@"completed"]) {
                BOOL completed = [act[@"completed"] boolValue];
                D3CareerProgression *careerProgression = [[D3CareerProgression alloc]
                                                          initWithCareerBattleTag:battleTag
                                                          progressionMode:progressionMode
                                                          difficulty:kD3ProgressionDifficultyInferno
                                                          act:kD3ProgressionAct4
                                                          completed:completed];
                [progressionElementsArray addObject:careerProgression];
            }
        }
    }
    
    return progressionElementsArray;
}

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
