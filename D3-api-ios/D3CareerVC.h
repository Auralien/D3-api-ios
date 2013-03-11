//
//  D3CareerVC.h
//  D3-api-ios
//
//  Created by Apple Developer on 28.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "D3API.h"

@interface D3CareerVC : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSString *battleTag;
@property (nonatomic) D3APIRegion region;

@end
