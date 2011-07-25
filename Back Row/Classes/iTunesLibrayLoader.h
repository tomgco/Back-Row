//
//  iTunesLibrayLoader.h
//  Back Row
//
//  Created by Tom Gallacher on 25/07/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface iTunesLibrayLoader : NSObject

- (NSDictionary *)loadLibrary:(NSURL *)optionalLibraryLocation;

@end
