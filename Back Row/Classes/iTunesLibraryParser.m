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

@implementation iTunesLibraryParser

@synthesize loadedLibrary;

- (id)init
{
    self = [super init];
    if (self) {
			dispatch_queue_t queue = dispatch_get_global_queue(0,0);
			
			dispatch_async(queue, ^{
				iTunesLibrayLoader *library = [[iTunesLibrayLoader alloc] init];
				loadedLibrary = [NSMutableDictionary dictionaryWithDictionary:[[library loadLibrary:nil] objectForKey:@"Tracks"]];
				[library release];
			});
			dispatch_release(queue);
    }
    
    return self;
}

- (void) getTVShows {
	NSUInteger count = [loadedLibrary count];
	dispatch_queue_t queue = dispatch_get_global_queue(0,0);
	
	dispatch_apply(count, queue, ^(size_t i){
		id key = [[loadedLibrary allKeys] objectAtIndex:i];
		id object = [loadedLibrary objectForKey:key];
		int number = [[object valueForKey:@"TV Show"] intValue];
		if (number == 1) {
			NSLog(@"%@", [object valueForKey:@"Artist"]);
		}
	});
}

@end
