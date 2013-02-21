//
//  D3CompletedQuest.h
//  D3-api-ios
//
//  Created by Maxim Mikheev on 21.02.13.
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
    kD3QuestAct2Quest1ShadowsInTheDesert,
    kD3QuestAct2Quest2TheRoadToAlcarnus,
    kD3QuestAct2Quest3CityOfBlood,
    kD3QuestAct2Quest4ARoyalAudience,
    kD3QuestAct2Quest5UnexpectedAllies,
    kD3QuestAct2Quest6BetrayerOfTheHoradrim,
    kD3QuestAct2Quest7BloodAndSand,
    kD3QuestAct2Quest8TheBlackSoulstone,
    kD3QuestAct2Quest9TheScouringOfCaldeum,
    kD3QuestAct2Quest10LordOfLies,
    kD3QuestAct3Quest1TheSiegeOfBastionsKeep,
    kD3QuestAct3Quest2TurningTheTide,
    kD3QuestAct3Quest3TheBreachedKeep,
    kD3QuestAct3Quest4TremorsInTheStone,
    kD3QuestAct3Quest5MachinesOfWar,
    kD3QuestAct3Quest6Siegebreaker,
    kD3QuestAct3Quest7HeartOfSin,
    kD3QuestAct4Quest1FallOfTheHighHeavens,
    kD3QuestAct4Quest2TheLightOfHope,
    kD3QuestAct4Quest3BeneathTheSpire,
    kD3QuestAct4Quest4PrimeEvil
} D3Quest;

#define kD3QuestAct1Quest1Name  @"the-fallen-star"
#define kD3QuestAct1Quest2Name  @"the-legacy-of-cain"
#define kD3QuestAct1Quest3Name  @"a-shattered-crown"
#define kD3QuestAct1Quest4Name  @"reign-of-the-black-king"
#define kD3QuestAct1Quest5Name  @"sword-of-the-stranger"
#define kD3QuestAct1Quest6Name  @"the-broken-blade"
#define kD3QuestAct1Quest7Name  @"the-doom-in-wortham"
#define kD3QuestAct1Quest8Name  @"trailing-the-coven"
#define kD3QuestAct1Quest9Name  @"the-imprisoned-angel"
#define kD3QuestAct1Quest10Name @"return-to-new-tristram"

#define kD3QuestAct2Quest1Name  @"shadows-in-the-desert"
#define kD3QuestAct2Quest2Name  @"the-road-to-alcarnus"
#define kD3QuestAct2Quest3Name  @"city-of-blood"
#define kD3QuestAct2Quest4Name  @"a-royal-audience"
#define kD3QuestAct2Quest5Name  @"unexpected-allies"
#define kD3QuestAct2Quest6Name  @"betrayer-of-the-horadrim"
#define kD3QuestAct2Quest7Name  @"blood-and-sand"
#define kD3QuestAct2Quest8Name  @"the-black-soulstone"
#define kD3QuestAct2Quest9Name  @"the-scouring-of-caldeum"
#define kD3QuestAct2Quest10Name @"lord-of-lies"

#define kD3QuestAct3Quest1Name  @"the-siege-of-bastions-keep"
#define kD3QuestAct3Quest2Name  @"turning-the-tide"
#define kD3QuestAct3Quest3Name  @"the-breached-keep"
#define kD3QuestAct3Quest4Name  @"tremors-in-the-stone"
#define kD3QuestAct3Quest5Name  @"machines-of-war"
#define kD3QuestAct3Quest6Name  @"siegebreaker"
#define kD3QuestAct3Quest7Name  @"heart-of-sin"

#define kD3QuestAct4Quest1Name  @"fall-of-the-high-heavens"
#define kD3QuestAct4Quest2Name  @"the-light-of-hope"
#define kD3QuestAct4Quest3Name  @"beneath-the-spire"
#define kD3QuestAct4Quest4Name  @"prime-evil"


@interface D3CompletedQuest : D3Object

/// Quest mode - hardcore or normal
@property (nonatomic) D3CompletedQuestMode questMode;
/// Quest difficulty
@property (nonatomic) D3CompletedQuestDifficulty questDifficulty;
/// Quest act
@property (nonatomic) D3CompletedQuestAct questAct;
/// Quest ID
@property (nonatomic, copy) NSString *questID;
/// Quest name
@property (nonatomic, copy) NSString *questName;

#pragma mark - Init Methods

/// Initialize completed quest object with zero values
- (id)init;

/// Initialize completed quest object with defined values
- (id)initWithQuestMode:(D3CompletedQuestMode)questModeVal
        questDifficulty:(D3CompletedQuestDifficulty)questDifficultyVal
               questAct:(D3CompletedQuestAct)questActVal
                questID:(NSString *)questIDVal
              questName:(NSString *)questNameVal;

@end
