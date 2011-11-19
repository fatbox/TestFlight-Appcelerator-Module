/*
 * Copyright 2011 FatBox Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 *limitations under the License.
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

-(void)takeOff:(id)token {
    ENSURE_UI_THREAD_1_ARG(token);
    ENSURE_SINGLE_ARG(token, NSString);
    NSLog(@"[INFO] TestFlight takeOff (%@)", token);
    [TestFlight takeOff:token];
}

-(void)testException:(id)args {
     [NSException raise:@"Test" format:@"Testing Exceptions with TestFlight"];
}

-(void)passCheckpoint:(id)checkPoint {
    ENSURE_SINGLE_ARG(checkPoint, NSString)
    NSLog(@"[INFO] TestFlight Checkpoint: (%@)", checkPoint);
    [TestFlight passCheckpoint:checkPoint];
}

-(void)launchFeedback:(id)args {
    NSLog(@"[INFO] TestFlight opening feedback view");
    ENSURE_UI_THREAD_0_ARGS
    [TestFlight openFeedbackView];
}

@end
