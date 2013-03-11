//
//  D3CareersDataSource.h
//  D3-api-ios
//
//  Created by Apple Developer on 11.03.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    kD3CareersDataSourceTypeHistory,
    kD3CareersDataSourceTypeFavorites
} D3CareersDataSourceType;

@interface D3CareersDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>

/// Careers list
@property (nonatomic, strong) NSMutableArray *careers;

- (id)initWithCareersDataSourceType:(D3CareersDataSourceType)type;

- (void)saveCareers;

@end
