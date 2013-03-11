//
//  D3CareersDataSource.m
//  D3-api-ios
//
//  Created by Apple Developer on 11.03.13.
//  Copyright (c) 2013 Maxim Mikheev. All rights reserved.
//

#import "D3CareersDataSource.h"

NSString * const kCareerHistoryFilename     = @"careerHistory.plist";
NSString * const kCareerFavoritesFilename   = @"careerFavorites.plist";

@interface D3CareersDataSource ()

@property (nonatomic) D3CareersDataSourceType careersType;

@end

@implementation D3CareersDataSource

@synthesize careers, careersType;

#pragma mark - Support Methods

/// Method returns full path to file with @a fileName
- (NSString *)filePathForFileName:(NSString *)fileName {
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [path objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:fileName];
}

/// Method writes careers info to file
- (void)saveCareers {
    if (self.careersType == kD3CareersDataSourceTypeHistory) {
        [self.careers writeToFile:[self filePathForFileName:kCareerHistoryFilename] atomically:YES];
    } else {
        [self.careers writeToFile:[self filePathForFileName:kCareerFavoritesFilename] atomically:YES];
    }
}

#pragma mark - Init Methods

- (id)initWithCareersDataSourceType:(D3CareersDataSourceType)type {
    if (self = [super init]) {
        self.careersType = type;
        
        NSMutableArray *tempCareers;
        NSString *dataFile;
        
        if (self.careersType == kD3CareersDataSourceTypeHistory) {
            dataFile = [self filePathForFileName:kCareerHistoryFilename];
        } else {
            dataFile = [self filePathForFileName:kCareerFavoritesFilename];
        }
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:dataFile]) {
            tempCareers = [[NSMutableArray alloc] initWithContentsOfFile:dataFile];
        } else {
            tempCareers = [NSMutableArray array];
        }
        self.careers = tempCareers;
    }
    return self;
}

#pragma mark - TableView Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.careers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    static NSString *ChooseCareerViewCellID = @"ChooseCareerViewCellID";
    cell = [tableView dequeueReusableCellWithIdentifier:ChooseCareerViewCellID];
    
    //UIImageView *heroPortrait;
    UILabel *battleTag, *region;
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ChooseCareerViewCellID];
        
        battleTag = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 10.0, 390.0, 24.0)];
        [battleTag setTag:1];
        [battleTag setTextColor:[self colorWithHexString:@"d96500"]];
        [battleTag setBackgroundColor:[UIColor clearColor]];
        [[cell contentView] addSubview:battleTag];
        
        region = [[UILabel alloc] initWithFrame:CGRectMake(410.0, 10.0, 50.0, 24.0)];
        [region setTag:2];
        [region setTextColor:[self colorWithHexString:@"d96500"]];
        [region setTextAlignment:NSTextAlignmentCenter];
        [region setBackgroundColor:[UIColor clearColor]];
        [[cell contentView] addSubview:region];
    } else {
        battleTag = (UILabel *)[[cell contentView] viewWithTag:1];
        region = (UILabel *)[[cell contentView] viewWithTag:2];
    }
    [battleTag setText:[[self.careers objectAtIndex:[indexPath row]] objectForKey:@"battleTag"]];
    [region setText:[[[self.careers objectAtIndex:[indexPath row]] objectForKey:@"region"] uppercaseString]];
    
    [[cell contentView] setBackgroundColor:[UIColor clearColor]];
    [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"career = %@", [self.careers objectAtIndex:[indexPath row]]);
    [[NSNotificationCenter defaultCenter] postNotificationName:@"org.maxmikheev.d3armory.career.selected"
                                                        object:self
                                                      userInfo:[NSDictionary dictionaryWithObjectsAndKeys:[self.careers objectAtIndex:[indexPath row]], @"career", nil]];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.careers removeObjectAtIndex:[indexPath row]];
        [self saveCareers];
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
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
