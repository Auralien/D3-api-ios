//
//  D3CompletedQuest.m
//  D3-api-ios
//
//  Created by Maxim Mikheev on 21.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3CompletedQuest.h"

@implementation D3CompletedQuest

@synthesize questMode, questDifficulty, questAct, questID, questName;

#pragma mark - Init Methods

/// Initialize completed quest object with zero values
- (id)init {
    return [self initWithQuestMode:kD3CompletedQuestModeUndefined
                   questDifficulty:kD3CompletedQuestDifficultyUndefined
                          questAct:kD3CompletedQuestActUndefined
                           questID:@""
                         questName:@""];
}

/// Initialize completed quest object with defined values
- (id)initWithQuestMode:(D3CompletedQuestMode)questModeVal
        questDifficulty:(D3CompletedQuestDifficulty)questDifficultyVal
               questAct:(D3CompletedQuestAct)questActVal
                questID:(NSString *)questIDVal
              questName:(NSString *)questNameVal {
    if (self = [super init]) {
        [self setQuestMode:questModeVal];
        [self setQuestDifficulty:questDifficultyVal];
        [self setQuestAct:questActVal];
        [self setQuestID:questIDVal];
        [self setQuestName:questNameVal];
    }
    return self;
}

@end
