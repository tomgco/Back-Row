//
//  iTunesLibrayLoader.m
//  Back Row
//
//  Created by Tom Gallacher on 25/07/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "iTunesLibrayLoader.h"

@implementation iTunesLibrayLoader

- (id)init {
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (NSDictionary *)loadLibrary:(NSURL *)optionalLibraryLocation {
	NSString* libraryPath = @"";
	if (optionalLibraryLocation != nil) {
		libraryPath = [optionalLibraryLocation description];
	} else {
		NSUserDefaults* prefs = [NSUserDefaults standardUserDefaults];
		[prefs synchronize];
		NSDictionary* iAppsPrefs = [ prefs persistentDomainForName: @"com.apple.iApps" ];
		NSArray* recentPaths = [iAppsPrefs objectForKey: @"iTunesRecentDatabasePaths" ];
		if([recentPaths count] > 0) {
			libraryPath = [recentPaths objectAtIndex: 0];
		}
	}
	return [NSDictionary dictionaryWithContentsOfFile: libraryPath];
}

@end
