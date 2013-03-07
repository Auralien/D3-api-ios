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

/*
 Border-colors:
 white - #56402c
 blue - #6ba9ba
 yellow - #b1a73c
 orange - #c29337
 green - #87a73d
 
 Text-colors:
 white - #fff
 blue - #a0c3ff
 yellow - #ffff00
 orange - #fba412
 green - #a4df44
 */

#import "D3HeroGearVC.h"
#import "D3API.h"
#import <QuartzCore/QuartzCore.h>

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

@property (nonatomic, weak) IBOutlet UILabel *heroClassAndLevelLabel;
@property (nonatomic, weak) IBOutlet UILabel *heroNameLabel;

@property (nonatomic, weak) IBOutlet UILabel *headItemNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *torsoItemNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *feetItemNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *handsItemNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *shouldersItemNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *legsItemNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *bracersItemNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *mainHandItemNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *offHandItemNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *waistItemNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *rightFingerItemNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *leftFingerItemNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *neckItemNameLabel;

@property (nonatomic, strong) D3Hero *hero;

@end

@implementation D3HeroGearVC

@synthesize backgroundImageView, headImageView, torsoImageView, feetImageView, handsImageView, shouldersImageView, legsImageView, bracersImageView, mainHandImageView, offHandImageView, waistImageView, rightFingerImageView, leftFingerImageView, neckImageView;
@synthesize headBackgroundImageView, torsoBackgroundImageView, feetBackgroundImageView, handsBackgroundImageView, shouldersBackgroundImageView, legsBackgroundImageView, bracersBackgroundImageView, mainHandBackgroundImageView, offHandBackgroundImageView, waistBackgroundImageView, rightFingerBackgroundImageView, leftFingerBackgroundImageView, neckBackgroundImageView;
@synthesize hero;

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
    
    /// Setting hero's name
    [[self heroNameLabel] setText:[self.hero.heroName uppercaseString]];
    
    /// Setting hero's class and level
    NSString *heroClass = nil;
    switch (self.hero.heroClass) {
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
    [[self heroClassAndLevelLabel] setText:[NSString stringWithFormat:@"%d (%d) %@",
                                            self.hero.heroLevel,
                                            self.hero.heroParagonLevel,
                                            heroClass]];
    
    /// Setting head item
    [self fetchImageForItem:self.hero.items[@"head"]
              intoImageView:self.headImageView
    withBackgroundImageView:self.headBackgroundImageView
              itemNameLabel:self.headItemNameLabel];
    
    /// Setting torso item
    [self fetchImageForItem:self.hero.items[@"torso"]
              intoImageView:self.torsoImageView
    withBackgroundImageView:self.torsoBackgroundImageView
              itemNameLabel:self.torsoItemNameLabel];
    
    /// Setting feet item
    [self fetchImageForItem:self.hero.items[@"feet"]
              intoImageView:self.feetImageView
    withBackgroundImageView:self.feetBackgroundImageView
              itemNameLabel:self.feetItemNameLabel];
    
    /// Setting hands item
    [self fetchImageForItem:self.hero.items[@"hands"]
              intoImageView:self.handsImageView
    withBackgroundImageView:self.handsBackgroundImageView
              itemNameLabel:self.handsItemNameLabel];
    
    /// Setting shoulders item
    [self fetchImageForItem:self.hero.items[@"shoulders"]
              intoImageView:self.shouldersImageView
    withBackgroundImageView:self.shouldersBackgroundImageView
              itemNameLabel:self.shouldersItemNameLabel];
    
    /// Setting legs item
    [self fetchImageForItem:self.hero.items[@"legs"]
              intoImageView:self.legsImageView
    withBackgroundImageView:self.legsBackgroundImageView
              itemNameLabel:self.legsItemNameLabel];
    
    /// Setting bracers item
    [self fetchImageForItem:self.hero.items[@"bracers"]
              intoImageView:self.bracersImageView
    withBackgroundImageView:self.bracersBackgroundImageView
              itemNameLabel:self.bracersItemNameLabel];
    
    /// Setting main hand item
    [self fetchImageForItem:self.hero.items[@"mainHand"]
              intoImageView:self.mainHandImageView
    withBackgroundImageView:self.mainHandBackgroundImageView
              itemNameLabel:self.mainHandItemNameLabel];
    
    /// Setting off hand item
    [self fetchImageForItem:self.hero.items[@"offHand"]
              intoImageView:self.offHandImageView
    withBackgroundImageView:self.offHandBackgroundImageView
              itemNameLabel:self.offHandItemNameLabel];
    
    /// Setting waist
    [self fetchImageForItem:self.hero.items[@"waist"]
              intoImageView:self.waistImageView
    withBackgroundImageView:self.waistBackgroundImageView
              itemNameLabel:self.waistItemNameLabel];

    /// Setting right finger item
    [self fetchImageForItem:self.hero.items[@"rightFinger"]
              intoImageView:self.rightFingerImageView
    withBackgroundImageView:self.rightFingerBackgroundImageView
              itemNameLabel:self.rightFingerItemNameLabel];

    /// Setting left finger item
    [self fetchImageForItem:self.hero.items[@"leftFinger"]
              intoImageView:self.leftFingerImageView
    withBackgroundImageView:self.leftFingerBackgroundImageView
              itemNameLabel:self.leftFingerItemNameLabel];

    /// Setting neck finger item
    [self fetchImageForItem:self.hero.items[@"neck"]
              intoImageView:self.neckImageView
    withBackgroundImageView:self.neckBackgroundImageView
              itemNameLabel:self.neckItemNameLabel];
}

/// Method fetches image for item and inserts it into image view
- (void)fetchImageForItem:(D3Item *)item
            intoImageView:(UIImageView *)imageView
  withBackgroundImageView:(UIImageView *)itemBackgroundImageView
            itemNameLabel:(UILabel *)itemNameLabel {
    if (item) {
        [D3Item fetchItemImage:item.itemIcon
                       success:^(NSData *data){
                           /// Getting image from data
                           [imageView setImage:[[UIImage alloc] initWithData:data]];
                           
                           /// Setting item name
                           [itemNameLabel setText:[item itemName]];
                           
                           /// Setting correct image and background image
                           switch (item.itemDisplayColor) {
                               case kD3ItemDisplayColorWhite: {
                                   [itemBackgroundImageView setImage:[UIImage imageNamed:@"ItemBrounBackground.png"]];
                                   [[itemBackgroundImageView layer] setBorderColor:[self colorWithHexString:@"56402c"].CGColor];
                                   [itemNameLabel setTextColor:[self colorWithHexString:@"ffffff"]];
                               }   break;
                               case kD3ItemDisplayColorBlue: {
                                   [itemBackgroundImageView setImage:[UIImage imageNamed:@"ItemBlueBackground.png"]];
                                   [[itemBackgroundImageView layer] setBorderColor:[self colorWithHexString:@"6ba9ba"].CGColor];
                                   [itemNameLabel setTextColor:[self colorWithHexString:@"a0c3ff"]];
                               }   break;
                               case kD3ItemDisplayColorYellow: {
                                   [itemBackgroundImageView setImage:[UIImage imageNamed:@"ItemYellowBackground.png"]];
                                   [[itemBackgroundImageView layer] setBorderColor:[self colorWithHexString:@"b1a73c"].CGColor];
                                   [itemNameLabel setTextColor:[self colorWithHexString:@"ffff00"]];
                               }   break;
                               case kD3ItemDisplayColorOrange: {
                                   [itemBackgroundImageView setImage:[UIImage imageNamed:@"ItemOrangeBackground.png"]];
                                   [[itemBackgroundImageView layer] setBorderColor:[self colorWithHexString:@"c29337"].CGColor];
                                   [itemNameLabel setTextColor:[self colorWithHexString:@"fba412"]];
                               }   break;
                               case kD3ItemDisplayColorGreen: {
                                   [itemBackgroundImageView setImage:[UIImage imageNamed:@"ItemGreenBackground.png"]];
                                   [[itemBackgroundImageView layer] setBorderColor:[self colorWithHexString:@"87a73d"].CGColor];
                                   [itemNameLabel setTextColor:[self colorWithHexString:@"a4df44"]];
                               }   break;
                                   
                               default:
                                   break;
                           }
                           [[itemBackgroundImageView layer] setCornerRadius:4.0];
                           [[itemBackgroundImageView layer] setMasksToBounds:YES];
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
