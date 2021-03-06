# Diablo 3 iOS API

This is an iOS wrapper above Diablo 3 Web API. It allows you to embed Diablo 3 player's career information into your iOS application.

## Overview

This API Kit provides support for iOS apps using Diablo 3 Web API. The Kit is written in Objective*C and is using The Blizzard Community Platform API which provides a number of resources for developers, third parties, and Diablo 3 enthusiasts to gather data about their accounts and heroes.

**Be advised to read [Blizzard's Diablo 3 API description on GitHub](https://github.com/Blizzard/d3-api-docs) first before using this Kit.**

## Setup

To begin work with this Kit copy following files from this repo into your iOS Project:

* D3API.h
* D3Object.h
* D3Object.m
* D3DataManager.h
* D3DataManager.m
* D3Career.h
* D3Career.m
* D3Hero.h
* D3Hero.m
* D3Skill.h
* D3Skill.m
* D3Rune.h
* D3Rune.m
* D3Item.h
* D3Item.m
* D3Follower.h
* D3Follower.m
* D3Artisan.h
* D3Artisan.m
* D3Progression.h
* D3Progression.m
* D3HeroProgression.h
* D3HeroProgression.m
* D3CareerProgression.h
* D3CareerProgression.m
* D3CompletedQuest.h
* D3CompletedQuest.m
* D3HeroCompletedQuest.h
* D3HeroCompletedQuest.m
* D3CareerCompletedQuest.h
* D3CareerCompletedQuest.m

After copying just import `D3API.h` header file into the proper classes according to your application logic and you are ready to use this Kit.

## Example Usage

Diablo 3 Web API allows to get information concerning player's career, player's heroes, artisans and followers, items. Blizzard provides this information in JSON format. This Kit parses information from JSON into a set of objects, which can be used in your iOS application.

You can find more information concerning Blizzard returned JSON in [Blizzards API description on GitHub](https://github.com/Blizzard/d3-api-docs).

Also you can check sample iPad project from this repository that uses this Kit.

### Player's career fetching

To get information concerning player's career you need to call this method:

```
+ (void)fetchCareerForBattleTag:(NSString *)battleTag
                         region:(D3APIRegion)region
                        success:(void (^)(D3Career *career))success
                        failure:(void (^)(NSError *error))failure;
```

This code presents an example of fetching career for `battleTag` *Auralien-2166* in Europe region:

```
// Create success block
void (^successBlock)(D3Career *) = ^(D3Career *career){
    // Update user interface with fetched career object's data here.
};

// Create failure block
void (^failureBlock)(NSError *) = ^(NSError *error){
    NSLog(@"Error happened: %@", [error localizedDescription]);
};

// Fetch career
[D3Career fetchCareerForBattleTag:@"Auralien#2166"
                           region:kD3APIRegionEurope
                          success:successBlock
                          failure:failureBlock];
```

### Hero's profile fetching

For every hero object you can call a method that completed hero's information:

```
- (void)completeHeroProfileWithSuccess:(void (^)(D3Hero *hero))success
                               failure:(void (^)(NSError *error))failure;
```

Example code above gets full hero's profiles for all heroes in player's career object named `userCareer`:

```
for (D3Hero *hero in self.userCareer.heroes) {
	[hero completeHeroProfileWithSuccess:^(D3Hero *hero){
		// Update user interface with fetched hero'es data here.
	  
	}
	                             failure:^(NSError *error){
	                             	 NSLog(@"Error fetching full hero profile: %@", [error localizedDescription]);
	                             }];
}
```

## Licence

<a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/3.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">Diablo 3 iOS API</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="https://github.com/Auralien/D3-api-ios" property="cc:attributionName" rel="cc:attributionURL">Maxim Mikheev</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/">Creative Commons Attribution-ShareAlike 3.0 Unported License</a>.<br />Based on a work at <a xmlns:dct="http://purl.org/dc/terms/" href="https://github.com/Blizzard/d3-api-docs" rel="dct:source">https://github.com/Blizzard/d3-api-docs</a>.