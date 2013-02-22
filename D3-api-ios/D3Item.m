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
                       name:@""
                       icon:@""
               displayColor:kD3ItemDisplayColorUndefined
              tooltipParams:@""];
}

/// Initialize item object with defined values
- (id)initWithID:(NSString *)itemIDVal
     ownerHeroID:(NSInteger)itemOwnerHeroIDVal
       ownerType:(D3ItemOwnerType)itemOwnerTypeVal
            name:(NSString *)itemNameVal
            icon:(NSString *)itemIconVal
    displayColor:(D3ItemDisplayColor)itemDisplayColorVal
   tooltipParams:(NSString *)itemTooltipParamsVal {
    if (self = [super init]) {
        [self setItemID:itemIDVal];
        [self setItemOwnerHeroID:itemOwnerHeroIDVal];
        [self setItemOwnerType:itemOwnerTypeVal];
        [self setItemName:itemNameVal];
        [self setItemIcon:itemIconVal];
        [self setItemDisplayColor:itemDisplayColorVal];
        [self setItemTooltipParams:itemTooltipParamsVal];
    }
    return self;
}

@end
