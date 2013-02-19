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

#define kD3DataManagerAPIPath                 @"http://%@.battle.net/api/d3/"
#define kD3DataManagerCareerPath              @"http://%@.battle.net/api/d3/profile/"
#define kD3DataManagerHeroPartOfPath          @"hero"

#define kD3CareerBattleTagSeparator         @"#"
#define kD3CareerRegionAmericasPath         @"us"
#define kD3CareerRegionEuropePath           @"eu"
#define kD3CareerRegionKoreaPath            @"kr"
#define kD3CareerRegionTaiwanPath           @"tw"

typedef void (^D3DataManagerFetchURLSuccessBlock)(NSDictionary *json);
typedef void (^D3DataManagerFetchURLFailureBlock)(NSError *error);

@interface D3DataManager : D3Object <NSURLConnectionDataDelegate>

/// Methods starts request to server
- (void)fetchDataWithURL:(NSString *)url
            successBlock:(D3DataManagerFetchURLSuccessBlock)successBlock
            failureBlock:(D3DataManagerFetchURLFailureBlock)failureBlock;

@end
