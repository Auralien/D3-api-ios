//
//  D3CareerCompletedQuest.m
//  D3-api-ios
//
//  Created by Maxim Mikheev on 21.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3CareerCompletedQuest.h"

@implementation D3CareerCompletedQuest

@synthesize careerBattleTag;

#pragma mark - Init Methods

/// Initialize Career's completed quest object with zero values
- (id)init {
    return [self initWithCareerBattleTag:@""
                               QuestMode:kD3CompletedQuestModeUndefined
                         questDifficulty:kD3CompletedQuestDifficultyUndefined
                                questAct:kD3CompletedQuestActUndefined
                                 questID:@""
                               questName:@""];
}

/// Initialize Career's completed quest object with defined values
- (id)initWithCareerBattleTag:(NSString *)careerBattleTagVal
                    QuestMode:(D3CompletedQuestMode)questModeVal
              questDifficulty:(D3CompletedQuestDifficulty)questDifficultyVal
                     questAct:(D3CompletedQuestAct)questActVal
                      questID:(NSString *)questIDVal
                    questName:(NSString *)questNameVal {
    if (self = [super initWithQuestMode:questModeVal
                        questDifficulty:questDifficultyVal
                               questAct:questActVal
                                questID:questIDVal
                              questName:questNameVal]) {
        [self setCareerBattleTag:careerBattleTagVal];
    }
    return self;
}


@end
