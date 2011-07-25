//
//  Back_RowAppDelegate.m
//  Back Row
//
//  Created by Tom Gallacher on 25/07/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Back_RowAppDelegate.h"
#import "iTunesLibrayLoader.h"
#import <dispatch/dispatch.h>

@implementation Back_RowAppDelegate

@synthesize window, itunesLibrary;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	[self loadLibrary];
}


//Loads the iTunes Library data on a seperate thread.
- (void)loadLibrary {
	dispatch_queue_t queue = dispatch_get_global_queue(0,0);
	dispatch_queue_t main = dispatch_get_main_queue();
	
	dispatch_async(queue, ^{
		iTunesLibrayLoader *library = [[iTunesLibrayLoader alloc] init];
		NSDictionary* loadedLibrary = [library loadLibrary:nil];
		[library release];
		
		dispatch_async(main, ^{
			[label setStringValue:@"Loaded iTunes File."];
			itunesLibrary = [NSDictionary dictionaryWithDictionary:[loadedLibrary objectForKey:@"Tracks"]];
			[loadedLibrary release];
			NSLog(@"%@", itunesLibrary);
		});
	});
	dispatch_release(queue);
	dispatch_release(main);
}

@end
