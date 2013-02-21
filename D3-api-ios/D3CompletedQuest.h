//
//  D3CompletedQuest.h
//  D3-api-ios
//
//  Created by Apple Developer on 21.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3Object.h"

typedef enum {
    kD3CompletedQuestModeUndefined,
    kD3CompletedQuestModeNormal,
    kD3CompletedQuestModeHardcore
} D3CompletedQuestMode;

typedef enum {
    kD3CompletedQuestDifficultyUndefined,
    kD3CompletedQuestDifficultyNormal,
    kD3CompletedQuestDifficultyNightmare,
    kD3CompletedQuestDifficultyHell,
    kD3CompletedQuestDifficultyInferno
} D3CompletedQuestDifficulty;

typedef enum {
    kD3CompletedQuestActUndefined,
    kD3CompletedQuestAct1,
    kD3CompletedQuestAct2,
    kD3CompletedQuestAct3,
    kD3CompletedQuestAct4
} D3CompletedQuestAct;

typedef enum {
    kD3QuestAct1Quest1TheFallenStar,
    kD3QuestAct1Quest2TheLegacyOfCain,
    kD3QuestAct1Quest3AShatteredCrown,
    kD3QuestAct1Quest4ReignOfTheBlackKing,
    kD3QuestAct1Quest5SwordOfTheStranger,
    kD3QuestAct1Quest6TheBrokenBlade,
    kD3QuestAct1Quest7TheDoomInWortham,
    kD3QuestAct1Quest8TrailingTheCoven,
    kD3QuestAct1Quest9TheImprisonedAngel,
    kD3QuestAct1Quest10ReturnToNewTristram,
} D3Quest;

@interface D3CompletedQuest : D3Object

@property (nonatomic) D3CompletedQuestMode questMode;
@property (nonatomic) D3CompletedQuestDifficulty questDifficulty;
@property (nonatomic) D3CompletedQuestAct questAct;



@end
