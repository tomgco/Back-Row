//
//  Back_RowAppDelegate.m
//  Back Row
//
//  Created by Tom Gallacher on 25/07/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Back_RowAppDelegate.h"
#import "iTunesLibraryParser.h"
#import <dispatch/dispatch.h>

@implementation Back_RowAppDelegate

@synthesize window, itunesLibrary;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	[self loadLibrary];
}


//Loads the iTunes Library data on a seperate thread.
- (void)loadLibrary {
	dispatch_queue_t queue = dispatch_get_global_queue(0,0);
	
	dispatch_async(queue, ^{
		iTunesLibraryParser *parser = [[iTunesLibraryParser alloc] init];
		itunesLibrary = [[NSDictionary alloc] initWithDictionary:[parser getTVShows]];
		[parser release];
	});
	
	dispatch_release(queue);
}

@end
