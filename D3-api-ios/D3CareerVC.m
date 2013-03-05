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
#import "D3HeroGearVC.h"

//#define kTestBattleTag      @"Auralien#2166"
#define kTestBattleTag      @"Kanonik#2981"
//Nuthill#2237
//Mythliss#2442
//Winterdark#2821
//Irrelevance#2153

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

- (IBAction)showHeroDetailsView:(id)sender;

@end

@implementation D3CareerVC

@synthesize userCareer, battleTagLabel, battleTagTextField, hero1Portrait, hero2Portrait, hero3Portrait, artisansView, testItemIcon;

- (IBAction)showHeroDetailsView:(id)sender {
    if ([self.userHeroes count] > 0) {
        D3HeroGearVC *heroDetailsVC = [[D3HeroGearVC alloc] initWithNibName:@"D3HeroGearView"
                                                                     bundle:nil
                                                                       hero:self.userHeroes[0]];
        [[self navigationController] pushViewController:heroDetailsVC animated:YES];
    }
}

- (IBAction)findCareerButtonPressed:(id)sender {
    [battleTagTextField resignFirstResponder];
    
    NSString *battleTag = [battleTagTextField text];
    [D3Career fetchCareerForBattleTag:battleTag
                               region:kD3APIRegionEurope
                              success:^(D3Career *career){
                                  self.userCareer = career;
                                  self.battleTagLabel.text = career.battleTag;
                                  
                                  D3ArtisansStatsVC *artisanStatsVC = [[D3ArtisansStatsVC alloc]
                                                                       initWithNibName:@"D3ArtisansStatsView"
                                                                       bundle:nil
                                                                       artisans:self.userCareer.artisans
                                                                       hardcoreArtisans:self.userCareer.hardcoreArtisans];
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
                                              if ([sortedHeroes count] > 0) {
                                                  D3HeroPortraitVC *portrait1VC = [[D3HeroPortraitVC alloc] initWithNibName:@"D3HeroPortraitView" bundle:nil hero:sortedHeroes[0]];
                                                  [[self hero1Portrait] addSubview:portrait1VC.view];
                                              }
                                              
                                              if ([sortedHeroes count] > 1) {
                                                  D3HeroPortraitVC *portrait2VC = [[D3HeroPortraitVC alloc] initWithNibName:@"D3HeroPortraitView" bundle:nil hero:sortedHeroes[1]];
                                                  [[self hero2Portrait] addSubview:portrait2VC.view];
                                              }
                                              
                                              if ([sortedHeroes count] > 2) {
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

@end
