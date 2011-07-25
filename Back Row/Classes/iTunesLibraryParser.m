//
//  iTunesLibraryParser.m
//  Back Row
//
//  Created by Tom Gallacher on 25/07/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "iTunesLibraryParser.h"
#import "iTunesLibrayLoader.h"
#import <dispatch/dispatch.h>

#define TVSHOW 1

@implementation iTunesLibraryParser

@synthesize loadedLibrary, tvShows;

- (id)init
{
    self = [super init];
    if (self) {
			iTunesLibrayLoader *library = [[iTunesLibrayLoader alloc] init];
			loadedLibrary = [[NSMutableDictionary alloc] initWithDictionary:[[library loadLibrary:nil] objectForKey:@"Tracks"]];
			[library release];
			tvShows = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

- (NSDictionary*) getTVShows {
	for (id key in loadedLibrary) {
		id object = [loadedLibrary objectForKey:key];
		int mediaType = [[object valueForKey:@"TV Show"] intValue];
		if (mediaType == TVSHOW) {
			if ([tvShows objectForKey:[object valueForKey:@"Series"]] == nil) {
				NSMutableArray* showArray = [[NSMutableArray alloc] init];
				[showArray addObject:object];
				[tvShows setObject:showArray forKey:[object valueForKey:@"Series"]];
				[showArray release];
			} else {
				[[tvShows objectForKey:[object valueForKey:@"Series"]] addObject:object];
			}
		}
	}
	return tvShows;
}

- (void)dealloc {
	[tvShows release];
	[loadedLibrary release];
	[super dealloc];
}

@end
