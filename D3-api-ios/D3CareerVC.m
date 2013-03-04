//
//  D3CareerVC.m
//  D3-api-ios
//
//  Created by Apple Developer on 28.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3CareerVC.h"
#import "D3DataManager.h"
#import "D3Career.h"
#import "D3Hero.h"
#import "D3HeroPortraitVC.h"
#import "D3ArtisansStatsVC.h"
#import "D3Item.h"

//#define kTestBattleTag      @"Auralien#2166"
#define kTestBattleTag      @"Kanonik#2981"

@interface D3CareerVC ()

@property (nonatomic, strong) D3Career *userCareer;
@property (nonatomic, strong) NSMutableArray *userHeroes;
@property (nonatomic, weak) IBOutlet UILabel *battleTagLabel;
@property (nonatomic, weak) IBOutlet UITextField *battleTagTextField;

@property (nonatomic, weak) IBOutlet UIView *hero1Portrait;
@property (nonatomic, weak) IBOutlet UIView *hero2Portrait;
@property (nonatomic, weak) IBOutlet UIView *hero3Portrait;

@property (nonatomic, weak) IBOutlet UIView *artisansView;

@property (nonatomic, weak) IBOutlet UIImageView *testItemIcon;

@end

@implementation D3CareerVC

@synthesize userCareer, battleTagLabel, battleTagTextField, hero1Portrait, hero2Portrait, hero3Portrait, artisansView, testItemIcon;

- (IBAction)findCareerButtonPressed:(id)sender {
    [battleTagTextField resignFirstResponder];
    
    NSString *battleTag = [battleTagTextField text];
    [D3Career fetchCareerForBattleTag:battleTag
                               region:kD3APIRegionEurope
                              success:^(D3Career *career){
                                  NSLog(@"career battletag = %@", career.battleTag);
                                  NSLog(@"monk time played = %f", [career.timePlayedMonk doubleValue]);
                                  self.userCareer = career;
                                  self.battleTagLabel.text = career.battleTag;
                                  
                                  D3ArtisansStatsVC *artisanStatsVC = [[D3ArtisansStatsVC alloc] initWithNibName:@"D3ArtisansStatsView" bundle:nil];
                                  [[self artisansView] addSubview:artisanStatsVC.view];
                                  
                                  self.userHeroes = [self.userCareer.heroes mutableCopy];
                                  
                                  if ([self.userHeroes count] > 0) {
                                      NSArray *sortedHeroes = [self.userHeroes sortedArrayUsingComparator:^NSComparisonResult(id hero1, id hero2){
                                          NSNumber *hero1Level = [NSNumber numberWithInteger:[(D3Hero *)hero1 heroLevel]];
                                          NSNumber *hero2Level = [NSNumber numberWithInteger:[(D3Hero *)hero2 heroLevel]];
                                          NSComparisonResult result = [hero1Level compare:hero2Level];
                                          
                                          if (result == NSOrderedAscending) {
                                              return NSOrderedDescending;
                                          } else if (result == NSOrderedDescending) {
                                              return NSOrderedAscending;
                                          } else {
                                              return NSOrderedSame;
                                          }
                                      }];
                                      
                                      /// Test Hero profiles update
                                      for (D3Hero *hero in self.userCareer.heroes) {
                                          [hero completeHeroProfileWithSuccess:^(D3Hero *hero){
                                              NSLog(@"hero = %@", hero);
                                              
                                              if (sortedHeroes[0]) {
                                                  D3HeroPortraitVC *portrait1VC = [[D3HeroPortraitVC alloc] initWithNibName:@"D3HeroPortraitView" bundle:nil hero:sortedHeroes[0]];
                                                  [[self hero1Portrait] addSubview:portrait1VC.view];
                                              }
                                              
                                              if (sortedHeroes[1]) {
                                                  D3HeroPortraitVC *portrait2VC = [[D3HeroPortraitVC alloc] initWithNibName:@"D3HeroPortraitView" bundle:nil hero:sortedHeroes[1]];
                                                  [[self hero2Portrait] addSubview:portrait2VC.view];
                                              }
                                              
                                              if (sortedHeroes[2]) {
                                                  D3HeroPortraitVC *portrait3VC = [[D3HeroPortraitVC alloc] initWithNibName:@"D3HeroPortraitView" bundle:nil hero:sortedHeroes[2]];
                                                  [[self hero3Portrait] addSubview:portrait3VC.view];
                                              }
                                          }
                                                                       failure:^(NSError *error){
                                                                           NSLog(@"Error fetching full hero profile: %@", [error localizedDescription]);
                                                                       }];
                                      }
                                      
                                  }
                                  
                                  
                                  
                              }
                              failure:^(NSError *error) {
                                  NSLog(@"Error happened: %@", [error localizedDescription]);
                              }];
    
    /// Testing image download
    [D3Item fetchItemImage:@"gloves_204_barbarian_male"
                   success:^(NSData *data){
                       UIImage *image = [[UIImage alloc] initWithData:data];
                       [[self testItemIcon] setImage:image];
                   }
                   failure:^(NSError *error) {
                       NSLog(@"Error happened: %@", [error localizedDescription]);
                   }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscape;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationLandscapeLeft;
}

/*- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}*/

@end
