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

//#define kTestBattleTag      @"Auralien#2166"
#define kTestBattleTag      @"Kanonik#2981"

@interface D3CareerVC ()

@property (nonatomic, strong) D3Career *userCareer;
@property (nonatomic, strong) NSMutableArray *userHeroes;
@property (nonatomic, weak) IBOutlet UILabel *battleTagLabel;
@property (nonatomic, weak) IBOutlet UITextField *battleTagTextField;

@property (nonatomic, weak) IBOutlet UIImageView *hero1BackgroundImageView;
@property (nonatomic, weak) IBOutlet UIImageView *hero2BackgroundImageView;
@property (nonatomic, weak) IBOutlet UIImageView *hero3BackgroundImageView;

@property (nonatomic, weak) IBOutlet UIImageView *hero1PortraitImageView;
@property (nonatomic, weak) IBOutlet UIImageView *hero2PortraitImageView;
@property (nonatomic, weak) IBOutlet UIImageView *hero3PortraitImageView;

@property (nonatomic, weak) IBOutlet UIView *hero1Portrait;
@property (nonatomic, weak) IBOutlet UIView *hero2Portrait;
@property (nonatomic, weak) IBOutlet UIView *hero3Portrait;

@end

@implementation D3CareerVC

@synthesize userCareer, battleTagLabel, battleTagTextField, hero1BackgroundImageView, hero2BackgroundImageView, hero3BackgroundImageView, hero1PortraitImageView, hero2PortraitImageView, hero3PortraitImageView, hero1Portrait;

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
                                      
                                      if (sortedHeroes[0]) {
                                          /// Set hero's portrait background
                                          if (![sortedHeroes[0] isHardcoreHero]) {
                                              [self.hero1BackgroundImageView setImage:[UIImage imageNamed:@"NormalHeroPortraitActive.jpg"]];
                                          } else {
                                              [self.hero1BackgroundImageView setImage:[UIImage imageNamed:@"HardcoreHeroPortraitActive.jpg"]];
                                          }
                                          
                                          /// Set hero's portrait
                                          switch ([sortedHeroes[0] heroClass]) {
                                              case kD3HeroClassBarbarian: {
                                                  if ([sortedHeroes[0] heroGender] == kD3HeroGenderMale) {
                                                      [self.hero1PortraitImageView setImage:[UIImage imageNamed:@"BarbarianMale.jpg"]];
                                                  } else if ([sortedHeroes[0] heroGender] == kD3HeroGenderFemale) {
                                                      [self.hero1PortraitImageView setImage:[UIImage imageNamed:@"BarbarianFemale.jpg"]];
                                                  }
                                              } break;
                                              case kD3HeroClassDemonHunter:{
                                                  if ([sortedHeroes[0] heroGender] == kD3HeroGenderMale) {
                                                      [self.hero1PortraitImageView setImage:[UIImage imageNamed:@"DemonHunterMale.jpg"]];
                                                  } else if ([sortedHeroes[0] heroGender] == kD3HeroGenderFemale) {
                                                      [self.hero1PortraitImageView setImage:[UIImage imageNamed:@"DemonHunterFemale.jpg"]];
                                                  }
                                              } break;
                                              case kD3HeroClassMonk:{
                                                  if ([sortedHeroes[0] heroGender] == kD3HeroGenderMale) {
                                                      [self.hero1PortraitImageView setImage:[UIImage imageNamed:@"MonkMale.jpg"]];
                                                  } else if ([sortedHeroes[0] heroGender] == kD3HeroGenderFemale) {
                                                      [self.hero1PortraitImageView setImage:[UIImage imageNamed:@"MonkFemale.jpg"]];
                                                  }
                                              } break;
                                              case kD3HeroClassWitchDoctor:{
                                                  if ([sortedHeroes[0] heroGender] == kD3HeroGenderMale) {
                                                      [self.hero1PortraitImageView setImage:[UIImage imageNamed:@"WitchDoctorMale.jpg"]];
                                                  } else if ([sortedHeroes[0] heroGender] == kD3HeroGenderFemale) {
                                                      [self.hero1PortraitImageView setImage:[UIImage imageNamed:@"WitchDoctorFemale.jpg"]];
                                                  }
                                              } break;
                                              case kD3HeroClassWizard:{
                                                  if ([sortedHeroes[0] heroGender] == kD3HeroGenderMale) {
                                                      [self.hero1PortraitImageView setImage:[UIImage imageNamed:@"WizardMale.jpg"]];
                                                  } else if ([sortedHeroes[0] heroGender] == kD3HeroGenderFemale) {
                                                      [self.hero1PortraitImageView setImage:[UIImage imageNamed:@"WizardFemale.jpg"]];
                                                  }
                                              } break;
                                                  
                                              default:
                                                  break;
                                          }
                                      }
                                      
                                      if (sortedHeroes[1]) {
                                          /// Set hero's portrait background
                                          if (![sortedHeroes[1] isHardcoreHero]) {
                                              [self.hero2BackgroundImageView setImage:[UIImage imageNamed:@"NormalHeroPortraitActive.jpg"]];
                                          } else {
                                              [self.hero2BackgroundImageView setImage:[UIImage imageNamed:@"HardcoreHeroPortraitActive.jpg"]];
                                          }
                                          
                                          /// Set hero's portrait
                                          switch ([sortedHeroes[1] heroClass]) {
                                              case kD3HeroClassBarbarian: {
                                                  if ([sortedHeroes[1] heroGender] == kD3HeroGenderMale) {
                                                      [self.hero2PortraitImageView setImage:[UIImage imageNamed:@"BarbarianMale.jpg"]];
                                                  } else if ([sortedHeroes[1] heroGender] == kD3HeroGenderFemale) {
                                                      [self.hero2PortraitImageView setImage:[UIImage imageNamed:@"BarbarianFemale.jpg"]];
                                                  }
                                              } break;
                                              case kD3HeroClassDemonHunter:{
                                                  if ([sortedHeroes[1] heroGender] == kD3HeroGenderMale) {
                                                      [self.hero2PortraitImageView setImage:[UIImage imageNamed:@"DemonHunterMale.jpg"]];
                                                  } else if ([sortedHeroes[1] heroGender] == kD3HeroGenderFemale) {
                                                      [self.hero2PortraitImageView setImage:[UIImage imageNamed:@"DemonHunterFemale.jpg"]];
                                                  }
                                              } break;
                                              case kD3HeroClassMonk:{
                                                  if ([sortedHeroes[1] heroGender] == kD3HeroGenderMale) {
                                                      [self.hero2PortraitImageView setImage:[UIImage imageNamed:@"MonkMale.jpg"]];
                                                  } else if ([sortedHeroes[1] heroGender] == kD3HeroGenderFemale) {
                                                      [self.hero2PortraitImageView setImage:[UIImage imageNamed:@"MonkFemale.jpg"]];
                                                  }
                                              } break;
                                              case kD3HeroClassWitchDoctor:{
                                                  if ([sortedHeroes[1] heroGender] == kD3HeroGenderMale) {
                                                      [self.hero2PortraitImageView setImage:[UIImage imageNamed:@"WitchDoctorMale.jpg"]];
                                                  } else if ([sortedHeroes[1] heroGender] == kD3HeroGenderFemale) {
                                                      [self.hero2PortraitImageView setImage:[UIImage imageNamed:@"WitchDoctorFemale.jpg"]];
                                                  }
                                              } break;
                                              case kD3HeroClassWizard:{
                                                  if ([sortedHeroes[1] heroGender] == kD3HeroGenderMale) {
                                                      [self.hero2PortraitImageView setImage:[UIImage imageNamed:@"WizardMale.jpg"]];
                                                  } else if ([sortedHeroes[1] heroGender] == kD3HeroGenderFemale) {
                                                      [self.hero2PortraitImageView setImage:[UIImage imageNamed:@"WizardFemale.jpg"]];
                                                  }
                                              } break;
                                                  
                                              default:
                                                  break;
                                          }
                                      }
                                      
                                      if (sortedHeroes[2]) {
                                          /// Set hero's portrait background
                                          if (![sortedHeroes[2] isHardcoreHero]) {
                                              [self.hero3BackgroundImageView setImage:[UIImage imageNamed:@"NormalHeroPortraitActive.jpg"]];
                                          } else {
                                              [self.hero3BackgroundImageView setImage:[UIImage imageNamed:@"HardcoreHeroPortraitActive.jpg"]];
                                          }
                                          
                                          /// Set hero's portrait
                                          switch ([sortedHeroes[2] heroClass]) {
                                              case kD3HeroClassBarbarian: {
                                                  if ([sortedHeroes[2] heroGender] == kD3HeroGenderMale) {
                                                      [self.hero3PortraitImageView setImage:[UIImage imageNamed:@"BarbarianMale.jpg"]];
                                                  } else if ([sortedHeroes[2] heroGender] == kD3HeroGenderFemale) {
                                                      [self.hero3PortraitImageView setImage:[UIImage imageNamed:@"BarbarianFemale.jpg"]];
                                                  }
                                              } break;
                                              case kD3HeroClassDemonHunter:{
                                                  if ([sortedHeroes[2] heroGender] == kD3HeroGenderMale) {
                                                      [self.hero3PortraitImageView setImage:[UIImage imageNamed:@"DemonHunterMale.jpg"]];
                                                  } else if ([sortedHeroes[2] heroGender] == kD3HeroGenderFemale) {
                                                      [self.hero3PortraitImageView setImage:[UIImage imageNamed:@"DemonHunterFemale.jpg"]];
                                                  }
                                              } break;
                                              case kD3HeroClassMonk:{
                                                  if ([sortedHeroes[2] heroGender] == kD3HeroGenderMale) {
                                                      [self.hero3PortraitImageView setImage:[UIImage imageNamed:@"MonkMale.jpg"]];
                                                  } else if ([sortedHeroes[2] heroGender] == kD3HeroGenderFemale) {
                                                      [self.hero3PortraitImageView setImage:[UIImage imageNamed:@"MonkFemale.jpg"]];
                                                  }
                                              } break;
                                              case kD3HeroClassWitchDoctor:{
                                                  if ([sortedHeroes[2] heroGender] == kD3HeroGenderMale) {
                                                      [self.hero3PortraitImageView setImage:[UIImage imageNamed:@"WitchDoctorMale.jpg"]];
                                                  } else if ([sortedHeroes[2] heroGender] == kD3HeroGenderFemale) {
                                                      [self.hero3PortraitImageView setImage:[UIImage imageNamed:@"WitchDoctorFemale.jpg"]];
                                                  }
                                              } break;
                                              case kD3HeroClassWizard:{
                                                  if ([sortedHeroes[2] heroGender] == kD3HeroGenderMale) {
                                                      [self.hero3PortraitImageView setImage:[UIImage imageNamed:@"WizardMale.jpg"]];
                                                  } else if ([sortedHeroes[2] heroGender] == kD3HeroGenderFemale) {
                                                      [self.hero3PortraitImageView setImage:[UIImage imageNamed:@"WizardFemale.jpg"]];
                                                  }
                                              } break;
                                                  
                                              default:
                                                  break;
                                          }
                                      }
                                      
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
                                  
                                  
                                  /// Test Hero profiles update
                                  for (D3Hero *hero in self.userCareer.heroes) {
                                      [hero completeHeroProfileWithSuccess:^(D3Hero *hero){
                                          NSLog(@"hero = %@", hero);
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
