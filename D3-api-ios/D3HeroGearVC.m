//
//  D3HeroGearVC.m
//  D3-api-ios
//
//  Created by Apple Developer on 05.03.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//
/*
"head" : {
    "id" : "Helm_204",
    "name" : "Intrepid Guard",
    "icon" : "helm_204_barbarian_male",
    "displayColor" : "yellow",
    "tooltipParams" : "item/CmQI86-pQBIHCAQVe_lOXR3FnqiRHZS_NIodOqRQBx2ggROuIgsIABWtRAMAGBwgGjAJOIwEQABICFAMYI0EaiUKDAgAEJz64tiBgIDgNRIVCKT4zqoCEgcIBBX2ntirMAk4AEABGPbl99QLUAJYAA"
},
"torso" : {
    "id" : "ChestArmor_205",
    "name" : "Glistening Armor",
    "icon" : "chestarmor_205_barbarian_male",
    "displayColor" : "yellow",
    "tooltipParams" : "item/CpEBCKePsvgPEgcIBBUuIhlgHfZqUF8dHBJz4B2dsMzQHQZUBRcdP6RQByILCAAVrUQDABgUICQwCTjBA0AASBNQDmCJBGolCgwIABCkq-a6gICA4CYSFQiB-_GxDRIHCAQVSvWLXzAJOABAAWolCgwIABC4qea6gICA4CYSFQjy04mxChIHCAQVSvWLXzANOABAARjciMmBDFACWAA"
},
"feet" : {
    "id" : "Boots_206",
    "name" : "March Shelter",
    "icon" : "boots_206_barbarian_male",
    "displayColor" : "yellow",
    "tooltipParams" : "item/Cj4IivX9hwcSBwgEFZ5Fm38dPCtv8R0OF4DJHTRWjfQdIuzMuCILCAEVtUQDABgKICYwCTjGA0AASBJQDGCOBBi8ltr5D1ACWAA"
},
"hands" : {
    "id" : "Gloves_204",
    "name" : "Cured Carriers",
    "icon" : "gloves_204_barbarian_male",
    "displayColor" : "yellow",
    "tooltipParams" : "item/CkgIqJCbnAoSBwgEFcVbkqQdbNBu8h0FVtXuHZAm_qsd8ZRATB0RRT_iHaaTxPYiCwgAFcf-AQAYDCAEMAk42gNAAEgPUBBgpAQY9ZDttgtQAlgA"
},
"shoulders" : {
    "id" : "Shoulders_204",
    "name" : "Officer's Voyage",
    "icon" : "shoulders_204_barbarian_male",
    "displayColor" : "yellow",
    "tooltipParams" : "item/CkgIxZzz8w4SBwgEFc74yBUdRpPTiR2dbLMUHZAm_qsduzBICB2aNyDyHd564EwiCwgBFXJCAwAYBCAYMAk4owRAAEgJUBBg9QQYnOPH3AJQAlgA"
},
"legs" : {
    "id" : "Pants_204",
    "name" : "Horizon Immunity",
    "icon" : "pants_204_barbarian_male",
    "displayColor" : "yellow",
    "tooltipParams" : "item/CmoIm8Stnw8SBwgEFZuS1aUdElbV7h3FnqiRHZS_NIod9mpQXx2mk8T2IgsIARW1RAMAGAQgBDAJOL4DQABIAVAOYIUEaiUKDAgAEKmD-buAgICANhIVCP-Eq90CEgcIBBX1ntirMAk4AEABGMm106ILUAJYAA"
},
"bracers" : {
    "id" : "Bracers_105",
    "name" : "Guardian Marrow",
    "icon" : "bracers_105_demonhunter_male",
    "displayColor" : "yellow",
    "tooltipParams" : "item/CkYIyNPJrAESBwgEFZcoyssd3WH9HR0bjApWHb5b6Egd8ZRATB0Cf5IBHRFFP-IiCwgBFYpCAwAYBiAQMAk4qwNAAFAQYPADGNHdrsMGUAJYAA"
},
"mainHand" : {
    "id" : "Unique_Sword_1H_011_104",
    "name" : "Devil Tongue",
    "icon" : "unique_sword_1h_011_104_demonhunter_male",
    "displayColor" : "orange",
    "tooltipParams" : "item/CjgIn8D6IxIHCAQVAmArFR2HxBbvHSerFasdxMOCdB1DMvhUHePd4Aod576acTAJOPgCQABQEmC3AxiEgNvSAlACWAA"
},
"offHand" : {
    "id" : "Shield_207_104",
    "name" : "Intrepid Interceptor",
    "icon" : "shield_207_104_demonhunter_male",
    "displayColor" : "yellow",
    "tooltipParams" : "item/CkEIwKjo3QoSBwgEFWWbSewdPaRQBx1tQhfEHRJW1e4dH8pdSR2gbLMUIgsIABWtRAMAGBwgEDAJOLIEQABQDmCGBRi1krO7AlACWAA"
},
"waist" : {
    "id" : "Belt_204",
    "name" : "Copperlock Scar",
    "icon" : "belt_204_barbarian_male",
    "displayColor" : "yellow",
    "tooltipParams" : "item/CkEI7vi26w8SBwgEFbynQtQdcmCmzB1Gk9OJHSQqAW4dDheAyR2ebLMUIgsIARXGRAMAGAQgGjAJOJMDQABQDmDWAxiH4eq7BVACWAA"
},
"rightFinger" : {
    "id" : "Unique_Ring_011",
    "name" : "Natalya's Mark",
    "icon" : "unique_ring_011_demonhunter_male",
    "displayColor" : "green",
    "tooltipParams" : "item/CjQIhd_atwMSBwgEFVcFZdQdJd3tJx2at3U1HTT8j2sdTgc6Mh1AAOIGMAk47wJAAFASYK0DGNHq17kFUAJYAKAB0erXuQU"
},
"leftFinger" : {
    "id" : "Ring_22",
    "name" : "Vigorous Ring",
    "icon" : "ring_22_demonhunter_male",
    "displayColor" : "blue",
    "tooltipParams" : "item/CiAIzey34QsSBwgEFTNVXUQdbNBu8jAJOM4CQABQBmCJAxjm1OrFCFACWAA"
},
"neck" : {
    "id" : "Amulet14",
    "name" : "Vigorous Amulet",
    "icon" : "amulet14_demonhunter_male",
    "displayColor" : "blue",
    "tooltipParams" : "item/CiAI5-XhwggSBwgEFa3FRGQdbUIXxDAJONcCQABQBmCTAxjalqbEDFACWAA"
}
*/

#import "D3HeroGearVC.h"
#import <QuartzCore/QuartzCore.h>
#import "D3Hero.h"
#import "D3Item.h"

@interface D3HeroGearVC ()

@property (nonatomic, weak) IBOutlet UIImageView *backgroundImageView;

@property (nonatomic, weak) IBOutlet UIImageView *headImageView;
@property (nonatomic, weak) IBOutlet UIImageView *torsoImageView;
@property (nonatomic, weak) IBOutlet UIImageView *feetImageView;
@property (nonatomic, weak) IBOutlet UIImageView *handsImageView;
@property (nonatomic, weak) IBOutlet UIImageView *shouldersImageView;
@property (nonatomic, weak) IBOutlet UIImageView *legsImageView;
@property (nonatomic, weak) IBOutlet UIImageView *bracersImageView;
@property (nonatomic, weak) IBOutlet UIImageView *mainHandImageView;
@property (nonatomic, weak) IBOutlet UIImageView *offHandImageView;
@property (nonatomic, weak) IBOutlet UIImageView *waistImageView;
@property (nonatomic, weak) IBOutlet UIImageView *rightFingerImageView;
@property (nonatomic, weak) IBOutlet UIImageView *leftFingerImageView;
@property (nonatomic, weak) IBOutlet UIImageView *neckImageView;

@property (nonatomic, weak) IBOutlet UIImageView *headBackgroundImageView;
@property (nonatomic, weak) IBOutlet UIImageView *torsoBackgroundImageView;
@property (nonatomic, weak) IBOutlet UIImageView *feetBackgroundImageView;
@property (nonatomic, weak) IBOutlet UIImageView *handsBackgroundImageView;
@property (nonatomic, weak) IBOutlet UIImageView *shouldersBackgroundImageView;
@property (nonatomic, weak) IBOutlet UIImageView *legsBackgroundImageView;
@property (nonatomic, weak) IBOutlet UIImageView *bracersBackgroundImageView;
@property (nonatomic, weak) IBOutlet UIImageView *mainHandBackgroundImageView;
@property (nonatomic, weak) IBOutlet UIImageView *offHandBackgroundImageView;
@property (nonatomic, weak) IBOutlet UIImageView *waistBackgroundImageView;
@property (nonatomic, weak) IBOutlet UIImageView *rightFingerBackgroundImageView;
@property (nonatomic, weak) IBOutlet UIImageView *leftFingerBackgroundImageView;
@property (nonatomic, weak) IBOutlet UIImageView *neckBackgroundImageView;

@property (nonatomic, strong) D3Hero *hero;

@end

@implementation D3HeroGearVC

@synthesize backgroundImageView, headImageView, torsoImageView, feetImageView, handsImageView, shouldersImageView, legsImageView, bracersImageView, mainHandImageView, offHandImageView, waistImageView, rightFingerImageView, leftFingerImageView, neckImageView;
@synthesize headBackgroundImageView, torsoBackgroundImageView, feetBackgroundImageView, handsBackgroundImageView, shouldersBackgroundImageView, legsBackgroundImageView, bracersBackgroundImageView, mainHandBackgroundImageView, offHandBackgroundImageView, waistBackgroundImageView, rightFingerBackgroundImageView, leftFingerBackgroundImageView, neckBackgroundImageView;
@synthesize hero;

/// Custom init method
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
    
    /// Setting correct background depending on hero's class and gender
    if (self.hero.heroGender == kD3HeroGenderMale) {
        switch (self.hero.heroClass) {
            case kD3HeroClassBarbarian:
                [self.backgroundImageView setImage:[UIImage imageNamed:@"BarbarianMaleBackground.jpg"]];
                break;
            case kD3HeroClassDemonHunter:
                [self.backgroundImageView setImage:[UIImage imageNamed:@"DemonHunterMaleBackground.jpg"]];
                break;
            case kD3HeroClassMonk:
                [self.backgroundImageView setImage:[UIImage imageNamed:@"MonkMaleBackground.jpg"]];
                break;
            case kD3HeroClassWitchDoctor:
                [self.backgroundImageView setImage:[UIImage imageNamed:@"WitchDoctorMaleBackground.jpg"]];
                break;
            case kD3HeroClassWizard:
                [self.backgroundImageView setImage:[UIImage imageNamed:@"WizardMaleBackground.jpg"]];
                break;
                
            default:
                break;
        }
    } else if (self.hero.heroGender == kD3HeroGenderFemale) {
        switch (self.hero.heroClass) {
            case kD3HeroClassBarbarian:
                [self.backgroundImageView setImage:[UIImage imageNamed:@"BarbarianFemaleBackground.jpg"]];
                break;
            case kD3HeroClassDemonHunter:
                [self.backgroundImageView setImage:[UIImage imageNamed:@"DemonHunterFemaleBackground.jpg"]];
                break;
            case kD3HeroClassMonk:
                [self.backgroundImageView setImage:[UIImage imageNamed:@"MonkFemaleBackground.jpg"]];
                break;
            case kD3HeroClassWitchDoctor:
                [self.backgroundImageView setImage:[UIImage imageNamed:@"WitchDoctorFemaleBackground.jpg"]];
                break;
            case kD3HeroClassWizard:
                [self.backgroundImageView setImage:[UIImage imageNamed:@"WizardFemaleBackground.jpg"]];
                break;
                
            default:
                break;
        }
    }
    
    /// Setting head item
    [self fetchImageForItem:self.hero.items[@"head"]
              intoImageView:self.headImageView
    withBackgroundImageView:self.headBackgroundImageView];
    
    /// Setting torso item
    [self fetchImageForItem:self.hero.items[@"torso"]
              intoImageView:self.torsoImageView
    withBackgroundImageView:self.torsoBackgroundImageView];
    
    /// Setting feet item
    [self fetchImageForItem:self.hero.items[@"feet"]
              intoImageView:self.feetImageView
    withBackgroundImageView:self.feetBackgroundImageView];
    
    /// Setting hands item
    [self fetchImageForItem:self.hero.items[@"hands"]
              intoImageView:self.handsImageView
    withBackgroundImageView:self.handsBackgroundImageView];
    
    /// Setting shoulders item
    [self fetchImageForItem:self.hero.items[@"shoulders"]
              intoImageView:self.shouldersImageView
    withBackgroundImageView:self.shouldersBackgroundImageView];
    
    /// Setting legs item
    [self fetchImageForItem:self.hero.items[@"legs"]
              intoImageView:self.legsImageView
    withBackgroundImageView:self.legsBackgroundImageView];
    
    /// Setting bracers item
    [self fetchImageForItem:self.hero.items[@"bracers"]
              intoImageView:self.bracersImageView
    withBackgroundImageView:self.bracersBackgroundImageView];
    
    /// Setting main hand item
    [self fetchImageForItem:self.hero.items[@"mainHand"]
              intoImageView:self.mainHandImageView
    withBackgroundImageView:self.mainHandBackgroundImageView];
    
    /// Setting off hand item
    [self fetchImageForItem:self.hero.items[@"offHand"]
              intoImageView:self.offHandImageView
    withBackgroundImageView:self.offHandBackgroundImageView];
    
    /// Setting waist
    [self fetchImageForItem:self.hero.items[@"waist"]
              intoImageView:self.waistImageView
    withBackgroundImageView:self.waistBackgroundImageView];

    /// Setting right finger item
    [self fetchImageForItem:self.hero.items[@"rightFinger"]
              intoImageView:self.rightFingerImageView
    withBackgroundImageView:self.rightFingerBackgroundImageView];

    /// Setting left finger item
    [self fetchImageForItem:self.hero.items[@"leftFinger"]
              intoImageView:self.leftFingerImageView
    withBackgroundImageView:self.leftFingerBackgroundImageView];

    /// Setting neck finger item
    [self fetchImageForItem:self.hero.items[@"neck"]
              intoImageView:self.neckImageView
    withBackgroundImageView:self.neckBackgroundImageView];
}

/// Method fetches image for item and inserts it into image view
- (void)fetchImageForItem:(D3Item *)item
            intoImageView:(UIImageView *)imageView
  withBackgroundImageView:(UIImageView *)itemBackgroundImageView {
    if (item) {
        [D3Item fetchItemImage:item.itemIcon
                       success:^(NSData *data){
                           [imageView setImage:[[UIImage alloc] initWithData:data]];
                           switch (item.itemDisplayColor) {
                               case kD3ItemDisplayColorWhite:
                                   [itemBackgroundImageView setImage:[UIImage imageNamed:@"ItemBrounBackground.png"]];
                                   break;
                               case kD3ItemDisplayColorBlue:
                                   [itemBackgroundImageView setImage:[UIImage imageNamed:@"ItemBlueBackground.png"]];
                                   break;
                               case kD3ItemDisplayColorYellow:
                                   [itemBackgroundImageView setImage:[UIImage imageNamed:@"ItemYellowBackground.png"]];
                                   break;
                               case kD3ItemDisplayColorOrange:
                                   [itemBackgroundImageView setImage:[UIImage imageNamed:@"ItemOrangeBackground.png"]];
                                   break;
                               case kD3ItemDisplayColorGreen:
                                   [itemBackgroundImageView setImage:[UIImage imageNamed:@"ItemGreenBackground.png"]];
                                   break;
                                   
                               default:
                                   break;
                           }
                           [[itemBackgroundImageView layer] setCornerRadius:4.0];
                           [[itemBackgroundImageView layer] setMasksToBounds:YES];
                           [[itemBackgroundImageView layer] setBorderColor:[UIColor orangeColor].CGColor];
                           [[itemBackgroundImageView layer] setBorderWidth:1.0f];
                       }
                       failure:^(NSError *error) {
                           NSLog(@"Error happened: %@", [error localizedDescription]);
                       }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
