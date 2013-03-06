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

@property (nonatomic, weak) IBOutlet UITableView *heroesTableView;

- (IBAction)showHeroDetailsView:(id)sender;

@end

@implementation D3CareerVC

@synthesize userCareer, battleTagLabel, battleTagTextField, hero1Portrait, hero2Portrait, hero3Portrait, artisansView, heroesTableView;

/// Method shows hero's details view
- (IBAction)showHeroDetailsView:(id)sender {
    UIButton *senderButton = (UIButton *)sender;
    
    if ((senderButton.tag == 1) && ([self.userHeroes count] > 0)) {
        D3HeroGearVC *heroDetailsVC = [[D3HeroGearVC alloc] initWithNibName:@"D3HeroGearView"
                                                                     bundle:nil
                                                                       hero:self.userHeroes[0]];
        [[self navigationController] pushViewController:heroDetailsVC animated:YES];
    }
    
    if ((senderButton.tag == 2) && ([self.userHeroes count] > 1)) {
        D3HeroGearVC *heroDetailsVC = [[D3HeroGearVC alloc] initWithNibName:@"D3HeroGearView"
                                                                     bundle:nil
                                                                       hero:self.userHeroes[1]];
        [[self navigationController] pushViewController:heroDetailsVC animated:YES];
    }
    
    if ((senderButton.tag == 3) && ([self.userHeroes count] > 2)) {
        D3HeroGearVC *heroDetailsVC = [[D3HeroGearVC alloc] initWithNibName:@"D3HeroGearView"
                                                                     bundle:nil
                                                                       hero:self.userHeroes[2]];
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
                                      NSArray *sortedHeroes = self.userHeroes;
                                      
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
                                  
                                  [self.heroesTableView reloadData];
                                  
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

#pragma mark - TableView Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ([self.userCareer.heroes count] > 3) ? [self.userCareer.heroes count] - 3 : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    static NSString *CareerViewCellID = @"CareerViewCellID";
    cell = [tableView dequeueReusableCellWithIdentifier:CareerViewCellID];
    
    UIImageView *heroPortrait;
    UILabel *heroName, *heroLevelAndClass, *heroEliteKills;
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CareerViewCellID];
        
        heroPortrait = [[UIImageView alloc] initWithFrame:CGRectMake(1.0, 1.0, 62.0, 48.0)];
        [heroPortrait setTag:1];
        [[cell contentView] addSubview:heroPortrait];
        
        heroName = [[UILabel alloc] initWithFrame:CGRectMake(70.0, 12.0, 170.0, 24.0)];
        // #d96500
        [heroName setTextColor:[self colorWithHexString:@"d96500"]];
        [heroName setTag:2];
        [heroName setBackgroundColor:[UIColor clearColor]];
        [[cell contentView] addSubview:heroName];
        
        heroLevelAndClass = [[UILabel alloc] initWithFrame:CGRectMake(250.0, 12.0, 200.0, 24.0)];
        // a99877 or for hardcore #e60101
        [heroLevelAndClass setTextColor:[self colorWithHexString:@"a99877"]];
        [heroLevelAndClass setTag:3];
        [heroLevelAndClass setBackgroundColor:[UIColor clearColor]];
        [[cell contentView] addSubview:heroLevelAndClass];
        
        heroEliteKills = [[UILabel alloc] initWithFrame:CGRectMake(460.0, 12.0, 130.0, 24.0)];
        // a99877
        [heroEliteKills setTextColor:[self colorWithHexString:@"a99877"]];
        [heroEliteKills setTag:4];
        [heroEliteKills setBackgroundColor:[UIColor clearColor]];
        [[cell contentView] addSubview:heroEliteKills];
    } else {
        heroPortrait = (UIImageView *)[[cell contentView] viewWithTag:1];
        heroName = (UILabel *)[[cell contentView] viewWithTag:2];
        heroLevelAndClass = (UILabel *)[[cell contentView] viewWithTag:3];
        heroEliteKills = (UILabel *)[[cell contentView] viewWithTag:4];
    }
    
    D3Hero *currentHero = [self.userCareer.heroes objectAtIndex:[indexPath row] + 3];
    
    /// Set hero's portrait
    switch ([currentHero heroClass]) {
        case kD3HeroClassBarbarian: {
            if ([currentHero heroGender] == kD3HeroGenderMale) {
                [heroPortrait setImage:[UIImage imageNamed:@"BarbarianMale.jpg"]];
            } else if ([currentHero heroGender] == kD3HeroGenderFemale) {
                [heroPortrait setImage:[UIImage imageNamed:@"BarbarianFemale.jpg"]];
            }
        } break;
        case kD3HeroClassDemonHunter:{
            if ([currentHero heroGender] == kD3HeroGenderMale) {
                [heroPortrait setImage:[UIImage imageNamed:@"DemonHunterMale.jpg"]];
            } else if ([currentHero heroGender] == kD3HeroGenderFemale) {
                [heroPortrait setImage:[UIImage imageNamed:@"DemonHunterFemale.jpg"]];
            }
        } break;
        case kD3HeroClassMonk:{
            if ([currentHero heroGender] == kD3HeroGenderMale) {
                [heroPortrait setImage:[UIImage imageNamed:@"MonkMale.jpg"]];
            } else if ([currentHero heroGender] == kD3HeroGenderFemale) {
                [heroPortrait setImage:[UIImage imageNamed:@"MonkFemale.jpg"]];
            }
        } break;
        case kD3HeroClassWitchDoctor:{
            if ([currentHero heroGender] == kD3HeroGenderMale) {
                [heroPortrait setImage:[UIImage imageNamed:@"WitchDoctorMale.jpg"]];
            } else if ([currentHero heroGender] == kD3HeroGenderFemale) {
                [heroPortrait setImage:[UIImage imageNamed:@"WitchDoctorFemale.jpg"]];
            }
        } break;
        case kD3HeroClassWizard:{
            if ([currentHero heroGender] == kD3HeroGenderMale) {
                [heroPortrait setImage:[UIImage imageNamed:@"WizardMale.jpg"]];
            } else if ([currentHero heroGender] == kD3HeroGenderFemale) {
                [heroPortrait setImage:[UIImage imageNamed:@"WizardFemale.jpg"]];
            }
        } break;
            
        default:
            break;
    }
    
    /// Setting hero's name
    [heroName setText:[currentHero heroName]];
    
    /// Setting hero's level and class
    NSString *heroClass = nil;
    switch (currentHero.heroClass) {
        case kD3HeroClassBarbarian:
            heroClass = NSLocalizedString(@"Barbarian", @"Barbarian");
            break;
        case kD3HeroClassDemonHunter:
            heroClass = NSLocalizedString(@"Demon Hunter", @"Demon Hunter");
            break;
        case kD3HeroClassMonk:
            heroClass = NSLocalizedString(@"Monk", @"Monk");
            break;
        case kD3HeroClassWitchDoctor:
            heroClass = NSLocalizedString(@"Witch Doctor", @"Witch Doctor");
            break;
        case kD3HeroClassWizard:
            heroClass = NSLocalizedString(@"Wizard", @"Wizard");
            break;
            
        default:
            break;
    }
    [heroLevelAndClass setText:[NSString stringWithFormat:@"%d %@", currentHero.heroLevel, heroClass]];
    
    if (currentHero.isHardcoreHero) {
        // a99877 or for hardcore #e60101
        [heroLevelAndClass setTextColor:[self colorWithHexString:@"e60101"]];
    } else {
        [heroLevelAndClass setTextColor:[self colorWithHexString:@"a99877"]];
    }
    
    /// Setting hero's elite kills
    [heroEliteKills setText:[NSString stringWithFormat:@"%d Elite Kills", currentHero.killsElites]];
    
    [[cell contentView] setBackgroundColor:[UIColor clearColor]];
    [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    D3Hero *currentHero = [self.userCareer.heroes objectAtIndex:[indexPath row] + 3];
    
    D3HeroGearVC *heroDetailsVC = [[D3HeroGearVC alloc] initWithNibName:@"D3HeroGearView"
                                                                 bundle:nil
                                                                   hero:currentHero];
    [[self navigationController] pushViewController:heroDetailsVC animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Support Methods
- (UIColor *)colorWithHexString:(NSString *)hex {
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

@end
