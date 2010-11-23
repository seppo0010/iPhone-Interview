//
//  ClockList.m
//  Interview
//
//  Created by seppo on 11/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ClockList.h"

@implementation ClockList

- (void) awakeFromNib {
	NSString* str = [[[NSString alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://dev2.bpcgames.com/~seppo/test/time.json"]] autorelease];
	NSDictionary* dict = [NSDictionary dictionaryWithJSONString:str];
	allTimezones = [[dict valueForKey:@"clocks"] retain];
	for (NSDictionary* t in allTimezones) {
		UIView* cell = [[[NSBundle mainBundle] loadNibNamed:@"ClockItem" owner:nil options:nil] objectAtIndex:0];
		[scroller addSubview:cell];
	}
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

- (void)viewDidLoad {
    [super viewDidLoad];
	NSString* str = [[[NSString alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://dev2.bpcgames.com/~seppo/test/time.json"]] autorelease];
	NSDictionary* dict = [NSDictionary dictionaryWithJSONString:str];
	currentTimezones = allTimezones = [[dict valueForKey:@"clocks"] retain];
	[self refresh];
}

- (IBAction) changedFilter:(UISegmentedControl*)control {
	if (control.selectedSegmentIndex == 0) {
		currentTimezones = allTimezones;
		[self refresh];
	} else {
		currentTimezones = nil;
		[self refresh];
	}
}

- (void) refresh {
	float y = 0.0;
	NSDate* date = [[NSDate alloc] init];
	NSDateFormatter* formatter = [[[NSDateFormatter alloc] init] autorelease];
	[formatter setTimeStyle:NSDateFormatterMediumStyle];
	for (NSDictionary* t in currentTimezones) {
		UIView* cell = [[[NSBundle mainBundle] loadNibNamed:@"ClockItem" owner:nil options:nil] objectAtIndex:0];
		cell.frame = CGRectMake(0, y, cell.frame.size.width, cell.frame.size.height);
		[formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:[[t valueForKey:@"time"] intValue] * 60 * 60]];
		[[cell viewWithTag:1] setText:[t valueForKey:@"city"]];
		[[cell viewWithTag:2] setText:[formatter stringFromDate:date]];
		[scroller addSubview:cell];
		y += cell.frame.size.height;
	}
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
