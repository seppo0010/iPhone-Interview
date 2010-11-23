//
//  InterviewAppDelegate.h
//  Interview
//
//  Created by seppo on 11/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ClockList;
@interface InterviewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	IBOutlet ClockList* controller;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property ClockList* controller;

@end

