//
//  D3CareerCompletedQuest.h
//  D3-api-ios
//
//  Created by Maxim Mikheev on 21.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3CompletedQuest.h"

@interface D3CareerCompletedQuest : D3CompletedQuest

/// Career unique ID
@property (nonatomic, copy) NSString *careerBattleTag;

#pragma mark - Init Methods

/// Initialize Career's completed quest object with zero values
- (id)init;

/// Initialize Career's completed quest object with defined values
- (id)initWithCareerBattleTag:(NSString *)careerBattleTagVal
                    QuestMode:(D3CompletedQuestMode)questModeVal
              questDifficulty:(D3CompletedQuestDifficulty)questDifficultyVal
                     questAct:(D3CompletedQuestAct)questActVal
                      questID:(NSString *)questIDVal
                    questName:(NSString *)questNameVal;

@end
