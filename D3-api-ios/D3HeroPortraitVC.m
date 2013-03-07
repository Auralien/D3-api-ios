//
//  D3HeroPortraitVC.m
//  D3-api-ios
//
//  Created by Apple Developer on 01.03.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3HeroPortraitVC.h"
#import "D3API.h"

@interface D3HeroPortraitVC ()

@property (nonatomic, strong) D3Hero *hero;

@property (nonatomic, weak) IBOutlet UIImageView *heroBackgroundImageView;
@property (nonatomic, weak) IBOutlet UIImageView *heroPortraitImageView;
@property (nonatomic, weak) IBOutlet UILabel *heroNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *heroLevelLabel;
@property (nonatomic, weak) IBOutlet UILabel *heroEliteKillsLabel;

@end

@implementation D3HeroPortraitVC

@synthesize heroBackgroundImageView, heroPortraitImageView, heroNameLabel, heroLevelLabel, heroEliteKillsLabel;

- (void)prepareHeroImage {
    if (self.hero) {
        /// Set hero's portrait background
        if (![self.hero isHardcoreHero]) {
            [self.heroBackgroundImageView setImage:[UIImage imageNamed:@"NormalHeroPortraitActive.jpg"]];
        } else {
            [self.heroBackgroundImageView setImage:[UIImage imageNamed:@"HardcoreHeroPortraitActive.jpg"]];
        }
        
        /// Set hero's portrait
        switch ([self.hero heroClass]) {
            case kD3HeroClassBarbarian: {
                if ([self.hero heroGender] == kD3HeroGenderMale) {
                    [self.heroPortraitImageView setImage:[UIImage imageNamed:@"BarbarianMale.jpg"]];
                } else if ([self.hero heroGender] == kD3HeroGenderFemale) {
                    [self.heroPortraitImageView setImage:[UIImage imageNamed:@"BarbarianFemale.jpg"]];
                }
            } break;
            case kD3HeroClassDemonHunter:{
                if ([self.hero heroGender] == kD3HeroGenderMale) {
                    [self.heroPortraitImageView setImage:[UIImage imageNamed:@"DemonHunterMale.jpg"]];
                } else if ([self.hero heroGender] == kD3HeroGenderFemale) {
                    [self.heroPortraitImageView setImage:[UIImage imageNamed:@"DemonHunterFemale.jpg"]];
                }
            } break;
            case kD3HeroClassMonk:{
                if ([self.hero heroGender] == kD3HeroGenderMale) {
                    [self.heroPortraitImageView setImage:[UIImage imageNamed:@"MonkMale.jpg"]];
                } else if ([self.hero heroGender] == kD3HeroGenderFemale) {
                    [self.heroPortraitImageView setImage:[UIImage imageNamed:@"MonkFemale.jpg"]];
                }
            } break;
            case kD3HeroClassWitchDoctor:{
                if ([self.hero heroGender] == kD3HeroGenderMale) {
                    [self.heroPortraitImageView setImage:[UIImage imageNamed:@"WitchDoctorMale.jpg"]];
                } else if ([self.hero heroGender] == kD3HeroGenderFemale) {
                    [self.heroPortraitImageView setImage:[UIImage imageNamed:@"WitchDoctorFemale.jpg"]];
                }
            } break;
            case kD3HeroClassWizard:{
                if ([self.hero heroGender] == kD3HeroGenderMale) {
                    [self.heroPortraitImageView setImage:[UIImage imageNamed:@"WizardMale.jpg"]];
                } else if ([self.hero heroGender] == kD3HeroGenderFemale) {
                    [self.heroPortraitImageView setImage:[UIImage imageNamed:@"WizardFemale.jpg"]];
                }
            } break;
                
            default:
                break;
        }
        
        /// Set hero's name
        [self.heroNameLabel setText:[[self hero] heroName]];
        
        /// Set hero's level
        [self.heroLevelLabel setText:[NSString stringWithFormat:@"%d",[[self hero] heroLevel]]];
        
        /// Set hero's elite kills label
        [self.heroEliteKillsLabel setText:[NSString stringWithFormat:@"%d Elite Kills", [[self hero] killsElites]]];
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
                 hero:(D3Hero *)heroVal {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setHero:heroVal];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self prepareHeroImage];
}

@end
