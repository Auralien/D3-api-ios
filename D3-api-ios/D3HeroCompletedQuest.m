//
//  D3HeroCompletedQuest.m
//  D3-api-ios
//
//  Created by Maxim Mikheev on 21.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3HeroCompletedQuest.h"

@implementation D3HeroCompletedQuest

@synthesize heroID;

#pragma mark - Init Methods

/// Initialize Hero's completed quest object with zero values
- (id)init {
    return [self initWithHeroID:0
                      QuestMode:kD3CompletedQuestModeUndefined
                questDifficulty:kD3CompletedQuestDifficultyUndefined
                       questAct:kD3CompletedQuestActUndefined
                        questID:@""
                      questName:@""];
}

/// Initialize Hero's completed quest object with defined values
- (id)initWithHeroID:(NSInteger)heroIDVal
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
        [self setHeroID:heroIDVal];
    }
    return self;
}

@end
