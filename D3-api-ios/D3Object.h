//
//  D3Object.h
//  D3-api-ios
//
//  Created by Maxim Mikheev on 12.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kDatabase @"d3.sqlite3"

typedef enum {
    kD3OwnerTypeUndefined,
    kD3OwnerTypeHero,
    kD3OwnerTypeTemplar,
    kD3OwnerTypeScoundrel,
    kD3OwnerTypeEnchantress
} D3OwnerType;

@interface D3Object : NSObject

@end
