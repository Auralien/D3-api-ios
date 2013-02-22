//
//  D3Item.h
//  D3-api-ios
//
//  Created by Maxim Mikheev on 12.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3Object.h"

typedef enum {
    kD3ItemDisplayColorUndefined,
    kD3ItemDisplayColorWhite,
    kD3ItemDisplayColorBlue,
    kD3ItemDisplayColorYellow,
    kD3ItemDisplayColorOrange
} D3ItemDisplayColor;

typedef enum {
    kD3ItemOwnerTypeUndefined,
    kD3ItemOwnerTypeHero,
    kD3ItemOwnerTypeFollowerTemplar,
    kD3ItemOwnerTypeFollowerScoundrel,
    kD3ItemOwnerTypeFollowerEnchantress
} D3ItemOwnerType;

@interface D3Item : D3Object

@property (nonatomic, copy) NSString *itemID;
@property (nonatomic) NSInteger itemOwnerHeroID;
@property (nonatomic) D3ItemOwnerType itemOwnerType;
@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *itemIcon;
@property (nonatomic) D3ItemDisplayColor itemDisplayColor;
@property (nonatomic, copy) NSString *itemTooltipParams;

#pragma mark - Init Methods

/// Initialize item object with zero values
- (id)init;

/// Initialize item object with defined values
- (id)initWithID:(NSString *)itemIDVal
     ownerHeroID:(NSInteger)itemOwnerHeroIDVal
       ownerType:(D3ItemOwnerType)itemOwnerTypeVal
            name:(NSString *)itemNameVal
            icon:(NSString *)itemIconVal
    displayColor:(D3ItemDisplayColor)itemDisplayColorVal
   tooltipParams:(NSString *)itemTooltipParamsVal;

@end
