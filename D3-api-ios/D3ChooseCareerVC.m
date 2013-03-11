//
//  D3ChooseCareerVC.m
//  D3-api-ios
//
//  Created by Maxim Mikheev on 09.03.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3ChooseCareerVC.h"
#import "D3CareersDataSource.h"
#import "D3CareerVC.h"
#import "D3API.h"

@interface D3ChooseCareerVC ()

@property (nonatomic, strong) D3CareersDataSource *careerHistoryDS;

@property (nonatomic, weak) IBOutlet UIImageView *topImage;
@property (nonatomic, weak) IBOutlet UITableView *history;
@property (nonatomic, weak) IBOutlet UITableView *favorites;

@property (nonatomic, weak) IBOutlet UITextField *battleTagTextField;

@end

@implementation D3ChooseCareerVC

@synthesize careerHistoryDS, battleTagTextField, topImage, history, favorites;

#pragma mark - Support Methods

- (IBAction)findCareer:(id)sender {
    if (![self.battleTagTextField.text isEqualToString:@""]) {
        __block NSDictionary *rawCareer;
        
        /// Create success block
        void (^successBlock)(D3Career *) = ^(D3Career *career){
            rawCareer = [NSDictionary dictionaryWithObjectsAndKeys:
                         career.battleTag, @"battleTag",
                         [D3DataManager getRegion:career.careerRegion], @"region", nil];
            [self.careerHistoryDS.careers insertObject:rawCareer atIndex:0];
            [self.careerHistoryDS saveCareers];
            
            [self.battleTagTextField resignFirstResponder];
            [self.history reloadData];
        };
        
        /// Create failure block
        void (^failureBlock)(NSError *) = ^(NSError *error){
            NSLog(@"Error happened: %@", [error localizedDescription]);
        };
        
        [D3Career fetchCareerForBattleTag:self.battleTagTextField.text
                                   region:kD3APIRegionEurope
                                  success:successBlock
                                  failure:failureBlock];
        
        [D3Career fetchCareerForBattleTag:self.battleTagTextField.text
                                   region:kD3APIRegionAmericas
                                  success:successBlock
                                  failure:failureBlock];
        
        [D3Career fetchCareerForBattleTag:self.battleTagTextField.text
                                   region:kD3APIRegionKorea
                                  success:successBlock
                                  failure:failureBlock];
        
        [D3Career fetchCareerForBattleTag:self.battleTagTextField.text
                                   region:kD3APIRegionTaiwan
                                  success:successBlock
                                  failure:failureBlock];
    }
}

/// Method shows career selected by user
- (void)showCareer:(NSNotification *)notification {
    D3CareerVC *careerVC = [[D3CareerVC alloc] initWithNibName:@"D3CareerView" bundle:nil];
    [careerVC setBattleTag:[[[notification userInfo] objectForKey:@"career"] objectForKey:@"battleTag"]];
    [careerVC setRegion:[D3DataManager getRegionCode:[[[notification userInfo] objectForKey:@"career"] objectForKey:@"region"]]];
    [[self navigationController] pushViewController:careerVC animated:YES];
}

#pragma mark - Lifecycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Auralien#2166
    // Las#2102
    // Kanonik#2981
    // Nuthill#2237
    // Mythliss#2442
    // Winterdark#2821
    // Irrelevance#2153
    
    self.careerHistoryDS = [[D3CareersDataSource alloc] initWithCareersDataSourceType:kD3CareersDataSourceTypeHistory];
    [self.history setDataSource:self.careerHistoryDS];
    [self.history setDelegate:self.careerHistoryDS];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showCareer:) name:@"org.maxmikheev.d3armory.career.selected" object:nil];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscape;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationLandscapeLeft;
}

@end
