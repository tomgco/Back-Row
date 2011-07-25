//
//  iTunesLibraryParser.h
//  Back Row
//
//  Created by Tom Gallacher on 25/07/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface iTunesLibraryParser : NSObject {
	NSMutableDictionary* loadedLibrary;
	NSMutableDictionary* tvShows;
}

- (NSDictionary*) getTVShows;

@property(nonatomic, retain) NSMutableDictionary* loadedLibrary;
@property(nonatomic, retain) NSMutableDictionary* tvShows;

@end
