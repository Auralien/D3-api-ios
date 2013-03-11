//
//  D3DataManager.h
//  D3-api-ios
//
//  Created by Maxim Mikheev on 17.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3Object.h"

/// Career Information
/// battletag-name ::= <regional battletag allowed characters>
/// battletag-code ::= <integer>
/// url ::= <host> "/api/d3/profile/" <battletag-name> "-" <battletag-code> "/"

/// Hero Information
/// battletag-name ::= <regional battletag allowed characters>
/// battletag-code ::= <integer>
/// hero-id ::= <integer>
/// url ::= <host> "/api/d3/profile/" <battletag-name> "-" <battletag-code> "/hero/" <hero-id>

/// Item Informarion
/// <host> "/api/d3/data/item/" <item-data>

/// Artisan Information
/// artisan ::= "blacksmith" | "jeweler"
/// url ::= <host> "/api/d3/data/artisan/" < follower-type>

/// Follower Information
/// follower-type ::= "enchantress" | "templar" | "scoundrel"
/// url ::= <host> "/api/d3/data/follower/" < follower-type>

#define kD3DataManagerItemIconsPath             @"http://media.blizzard.com/d3/icons/items/large/"
/// http://media.blizzard.com/d3/icons/items/large/gloves_204_barbarian_male.png
#define kD3DataManagerAPIPath                   @"http://%@.battle.net/api/d3/"
#define kD3DataManagerProfilePartOfPath         @"profile"
#define kD3DataManagerHeroPartOfPath            @"hero"
#define kD3DataManagerDataPartOfPath            @"data"
#define kD3DataManagerItemPartOfPath            @"item"
#define kD3DataManagerArtisanPartOfPath         @"artisan"
#define kD3DataManagerFollowerPartOfPath        @"follower"
#define kD3DataManagerBlacksmithPartOfPath      @"blacksmith"
#define kD3DataManagerJewelerPartOfPath         @"jeweler"
#define kD3DataManagerEnchantressPartOfPath     @"enchantress"
#define kD3DataManagerTemplarPartOfPath         @"templar"
#define kD3DataManagerScoundrel                 @"scoundrel"

#define kD3CareerBattleTagSeparator             @"#"
#define kD3CareerRegionAmericasPath             @"us"
#define kD3CareerRegionEuropePath               @"eu"
#define kD3CareerRegionKoreaPath                @"kr"
#define kD3CareerRegionTaiwanPath               @"tw"

typedef enum {
    kD3APIRegionUndefined,
    kD3APIRegionAmericas,
    kD3APIRegionEurope,
    kD3APIRegionKorea,
    kD3APIRegionTaiwan
} D3APIRegion;

typedef void (^D3DataManagerFetchURLSuccessBlock)(NSData *data);
typedef void (^D3DataManagerFetchURLFailureBlock)(NSError *error);

@interface D3DataManager : D3Object <NSURLConnectionDataDelegate>

/// Method returns region D3APIRegion code from region 2-letter string
+ (D3APIRegion)getRegionCode:(NSString *)regionString;

/// Method returns region code for url
+ (NSString *)getRegion:(D3APIRegion)apiRegion;

/// Methods starts request to server
- (void)fetchDataWithURL:(NSString *)url
            successBlock:(D3DataManagerFetchURLSuccessBlock)successBlock
            failureBlock:(D3DataManagerFetchURLFailureBlock)failureBlock;

@end
