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
    kD3ItemDisplayColorOrange,
    kD3ItemDisplayColorGreen
} D3ItemDisplayColor;

typedef enum {
    kD3ItemOwnerTypeUndefined,
    kD3ItemOwnerTypeHero,
    kD3ItemOwnerTypeFollowerTemplar,
    kD3ItemOwnerTypeFollowerScoundrel,
    kD3ItemOwnerTypeFollowerEnchantress
} D3ItemOwnerType;

typedef enum {
    kD3ItemSlotUndefined,
    kD3ItemSlotHead,
    kD3ItemSlotTorso,
    kD3ItemSlotFeet,
    kD3ItemSlotHands,
    kD3ItemSlotShoulders,
    kD3ItemSlotLegs,
    kD3ItemSlotBracers,
    kD3ItemSlotMainHand,
    kD3ItemSlotOffHand,
    kD3ItemSlotWaist,
    kD3ItemSlotRightFinger,
    kD3ItemSlotLeftFinger,
    kD3ItemSlotNeck,
    kD3ItemSlotSpecial
} D3ItemSlot;

@interface D3Item : D3Object

/// Item unique ID
@property (nonatomic, copy) NSString *itemID;
/// Item's owner unique ID
@property (nonatomic) NSInteger itemOwnerHeroID;
/// Item's owner's type - hero or one of followers
@property (nonatomic) D3ItemOwnerType itemOwnerType;
/// Item's slot
@property (nonatomic) D3ItemSlot itemSlot;
/// Item name
@property (nonatomic, copy) NSString *itemName;
/// Item's icon path
@property (nonatomic, copy) NSString *itemIcon;
/// Item's color
@property (nonatomic) D3ItemDisplayColor itemDisplayColor;
/// Item's tooltip path
@property (nonatomic, copy) NSString *itemTooltipParams;

#pragma mark - Init Methods

/// Initialize item object with zero values
- (id)init;

/// Initialize item object with defined values
- (id)initWithID:(NSString *)itemIDVal
     ownerHeroID:(NSInteger)itemOwnerHeroIDVal
       ownerType:(D3ItemOwnerType)itemOwnerTypeVal
            slot:(D3ItemSlot)itemSlotVal
            name:(NSString *)itemNameVal
            icon:(NSString *)itemIconVal
    displayColor:(D3ItemDisplayColor)itemDisplayColorVal
   tooltipParams:(NSString *)itemTooltipParamsVal;

/// Initialize item object with json dictionary
- (id)initWithJSON:(NSDictionary *)json
   itemOwnerHeroID:(NSInteger)itemOwnerHeroIDVal
     itemOwnerType:(D3ItemOwnerType)itemOwnerTypeVal
          itemSlot:(D3ItemSlot)itemSlotVal;

@end
