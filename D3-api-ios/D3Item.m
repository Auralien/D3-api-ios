//
//  D3Item.m
//  D3-api-ios
//
//  Created by Maxim Mikheev on 12.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3Item.h"

@implementation D3Item

@synthesize itemID, itemOwnerHeroID, itemOwnerType, itemName, itemIcon, itemDisplayColor, itemTooltipParams;

#pragma mark - Init Methods

/// Initialize item object with zero values
- (id)init {
    return [self initWithID:@""
                ownerHeroID:0
                  ownerType:kD3ItemOwnerTypeUndefined
                       slot:kD3ItemSlotUndefined
                       name:@""
                       icon:@""
               displayColor:kD3ItemDisplayColorUndefined
              tooltipParams:@""];
}

/// Initialize item object with defined values
- (id)initWithID:(NSString *)itemIDVal
     ownerHeroID:(NSInteger)itemOwnerHeroIDVal
       ownerType:(D3ItemOwnerType)itemOwnerTypeVal
            slot:(D3ItemSlot)itemSlotVal
            name:(NSString *)itemNameVal
            icon:(NSString *)itemIconVal
    displayColor:(D3ItemDisplayColor)itemDisplayColorVal
   tooltipParams:(NSString *)itemTooltipParamsVal {
    if (self = [super init]) {
        [self setItemID:itemIDVal];
        [self setItemOwnerHeroID:itemOwnerHeroIDVal];
        [self setItemOwnerType:itemOwnerTypeVal];
        [self setItemSlot:itemSlotVal];
        [self setItemName:itemNameVal];
        [self setItemIcon:itemIconVal];
        [self setItemDisplayColor:itemDisplayColorVal];
        [self setItemTooltipParams:itemTooltipParamsVal];
    }
    return self;
}

/// Initialize item object with json dictionary
- (id)initWithJSON:(NSDictionary *)json
   itemOwnerHeroID:(NSInteger)itemOwnerHeroIDVal
     itemOwnerType:(D3ItemOwnerType)itemOwnerTypeVal
          itemSlot:(D3ItemSlot)itemSlotVal {
    D3Item *item = [[D3Item alloc] init];
    
    [item setItemOwnerHeroID:itemOwnerHeroIDVal];
    [item setItemOwnerType:itemOwnerTypeVal];
    [item setItemSlot:itemSlotVal];
    
    if (json[@"id"]) {
        [item setItemID:json[@"id"]];
    }
    
    if (json[@"name"]) {
        [item setItemName:json[@"name"]];
    }
    
    if (json[@"icon"]) {
        [item setItemIcon:json[@"icon"]];
    }
    
    if (json[@"displayColor"]) {
        if ([json[@"displayColor"] isEqualToString:@"white"]) {
            [item setItemDisplayColor:kD3ItemDisplayColorWhite];
        } else if ([json[@"displayColor"] isEqualToString:@"blue"]) {
            [item setItemDisplayColor:kD3ItemDisplayColorBlue];
        } else if ([json[@"displayColor"] isEqualToString:@"yellow"]) {
            [item setItemDisplayColor:kD3ItemDisplayColorYellow];
        } else if ([json[@"displayColor"] isEqualToString:@"orange"]) {
            [item setItemDisplayColor:kD3ItemDisplayColorOrange];
        } else if ([json[@"displayColor"] isEqualToString:@"green"]) {
            [item setItemDisplayColor:kD3ItemDisplayColorGreen];
        }
    }
    
    if (json[@"tooltipParams"]) {
        [item setItemTooltipParams:json[@"tooltipParams"]];
    }
    
    return item;
}

@end
