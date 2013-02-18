//
//  D3ViewController.m
//  D3-api-ios
//
//  Created by Maxim Mikheev on 12.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3ViewController.h"
#import "D3Career.h"

@interface D3ViewController ()

@property (nonatomic, strong) D3Career *career;

@end

@implementation D3ViewController

@synthesize label;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [D3Career fetchCareerForBattleTag:@"1234"
                              success:^(D3Career *career){
                                  NSLog(@"career battletag = %@", career.battleTag);
                                  NSLog(@"monk time played = %f", [career.timePlayedMonk doubleValue]);
                                  self.career = career;
                                  self.label.text = career.battleTag;
                              }
                              failure:^(NSError *error) {
                                  NSLog(@"Error happened: %@", [error localizedDescription]);
                              }];
}

- (IBAction)buttonPressed:(id)sender {
    NSLog(@"Career battle tag: %@", self.career.battleTag);
}

@end
