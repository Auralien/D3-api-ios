//
//  D3HeroPortraitVC.h
//  D3-api-ios
//
//  Created by Apple Developer on 01.03.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import <UIKit/UIKit.h>

@class D3Hero;

@interface D3HeroPortraitVC : UIViewController

@property (nonatomic, strong) D3Hero *hero;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil hero:(D3Hero *)heroVal;

@end
