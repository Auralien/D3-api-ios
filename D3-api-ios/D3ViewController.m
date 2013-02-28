//
//  D3ViewController.m
//  D3-api-ios
//
//  Created by Maxim Mikheev on 12.02.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3ViewController.h"
#import "D3DataManager.h"
#import "D3Career.h"
#import "D3Hero.h"

//#define kTestBattleTag      @"Auralien#2166"
#define kTestBattleTag      @"Kanonik#2981"

@interface D3ViewController ()

@property (nonatomic, strong) D3Career *career;

@property (nonatomic, weak) IBOutlet UIImageView *classImage;

@end

@implementation D3ViewController

@synthesize label, classImage;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [D3Career fetchCareerForBattleTag:kTestBattleTag
                               region:kD3APIRegionEurope
                              success:^(D3Career *career){
                                  NSLog(@"career battletag = %@", career.battleTag);
                                  NSLog(@"monk time played = %f", [career.timePlayedMonk doubleValue]);
                                  self.career = career;
                                  self.label.text = career.battleTag;
                                  
                                  
                                  
                                  /// Test Hero profiles update
                                  for (D3Hero *hero in self.career.heroes) {
                                      [hero completeHeroProfileWithSuccess:^(D3Hero *hero){
                                          NSLog(@"hero = %@", hero);
                                          
                                          switch (hero.heroClass) {
                                              case kD3HeroClassBarbarian:
                                                  [self.classImage setImage:[UIImage imageNamed:@"BarbarianCrest.png"]];
                                                  break;
                                              case kD3HeroClassDemonHunter:
                                                  [self.classImage setImage:[UIImage imageNamed:@"DemonHunterCrest.png"]];
                                                  break;
                                              case kD3HeroClassMonk:
                                                  [self.classImage setImage:[UIImage imageNamed:@"MonkCrest.png"]];
                                                  break;
                                              case kD3HeroClassWitchDoctor:
                                                  [self.classImage setImage:[UIImage imageNamed:@"WitchDoctorCrest.png"]];
                                                  break;
                                              case kD3HeroClassWizard:
                                                  [self.classImage setImage:[UIImage imageNamed:@"Wizard.png"]];
                                                  break;
                                                  
                                              default:
                                                  break;
                                          }
                                      }
                                                                   failure:^(NSError *error){
                                                                       NSLog(@"Error fetching full hero profile: %@", [error localizedDescription]);
                                                                   }];
                                  }
                              }
                              failure:^(NSError *error) {
                                  NSLog(@"Error happened: %@", [error localizedDescription]);
                              }];
}

- (IBAction)buttonPressed:(id)sender {
    NSLog(@"Career battle tag: %@", self.career.battleTag);
}

@end
