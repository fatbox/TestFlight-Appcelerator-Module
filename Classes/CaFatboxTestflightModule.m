/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "CaFatboxTestflightModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "TestFlight.h"


@implementation CaFatboxTestflightModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"86930373-f670-417e-8d00-8ae68de3b8b6";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"ca.fatbox.testflight";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(void)takeOff:(id)args {
    NSString *token = [args objectAtIndex:0];
    NSLog(@"[INFO] TestFlight takeOff (%@)", token);
    [TestFlight takeOff:token];
}

-(void)testException:(id)args {
     [NSException raise:@"Test" format:@"Testing Exceptions with TestFlight"];
}

-(void)passCheckpoint:(id)args {
    NSString *checkPoint = [args objectAtIndex:0];
    NSLog(@"[INFO] TestFlight Checkpoint: (%@)", checkPoint);
    [TestFlight passCheckpoint:checkPoint];
}

-(void)launchFeedback:(id)args {
    NSLog(@"[INFO] TestFlight opening feedback view");
    [TestFlight openFeedbackView];
}

@end
