//
//  D3HeroCompletedQuest.h
//  D3-api-ios
//
//  Created by Maxim Mikheev on 21.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3CompletedQuest.h"

@interface D3HeroCompletedQuest : D3CompletedQuest

/// Hero unique ID
@property (nonatomic) NSInteger heroID;

#pragma mark - Init Methods

/// Initialize Hero's completed quest object with zero values
- (id)init;

/// Initialize Hero's completed quest object with defined values
- (id)initWithHeroID:(NSInteger)heroIDVal
           QuestMode:(D3CompletedQuestMode)questModeVal
     questDifficulty:(D3CompletedQuestDifficulty)questDifficultyVal
            questAct:(D3CompletedQuestAct)questActVal
             questID:(NSString *)questIDVal
           questName:(NSString *)questNameVal;

@end
