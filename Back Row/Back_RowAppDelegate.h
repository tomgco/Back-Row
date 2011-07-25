//
//  Back_RowAppDelegate.h
//  Back Row
//
//  Created by Tom Gallacher on 25/07/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Back_RowAppDelegate : NSObject <NSApplicationDelegate> {
	NSWindow *window;
	NSDictionary *itunesLibrary;
	IBOutlet NSTextField *label;
}

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic, retain) NSDictionary *itunesLibrary;

- (void)loadLibrary;

@end
