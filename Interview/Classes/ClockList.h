//
//  ClockList.h
//  Interview
//
//  Created by seppo on 11/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ClockList : UIViewController {
	IBOutlet UIScrollView* scroller;
	NSArray* allTimezones;
	NSArray* currentTimezones;
}

- (IBAction) changedFilter:(UISegmentedControl*)control;

@end
