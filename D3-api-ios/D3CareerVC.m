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

//#define kTestBattleTag      @"Auralien#2166"
#define kTestBattleTag      @"Kanonik#2981"

@interface D3CareerVC ()

@property (nonatomic, strong) D3Career *userCareer;

@property (nonatomic, weak) IBOutlet UILabel *battleTagLabel;
@property (nonatomic, weak) IBOutlet UITextField *battleTagTextField;

@end

@implementation D3CareerVC

@synthesize userCareer, battleTagLabel, battleTagTextField;

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
                                  
                                  
                                  
                                  /// Test Hero profiles update
                                  for (D3Hero *hero in self.userCareer.heroes) {
                                      [hero completeHeroProfileWithSuccess:^(D3Hero *hero){
                                          NSLog(@"hero = %@", hero);
                                          
                                          /*switch (hero.heroClass) {
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
                                           }*/
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
