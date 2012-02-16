//
//  CurrentTimeViewController.m
//  HypnoTime
//
//  Created by GALVEZZ on 2/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CurrentTimeViewController.h"

@implementation CurrentTimeViewController


-(id)init
{
 // Call the superclass's designated initializer 
   // self = [super initWithNibName:@"CurrentTimeViewController"
    self = [super initWithNibName:nil
                           bundle:nil];
    if (self) { // Get the tab bar item 
        UITabBarItem *tbi = [self tabBarItem];
        // Give it a label 
        [tbi setTitle:@"Time"];
        
        // Create a UIImage from a file 
        UIImage *i = [UIImage imageNamed:@"logo.png"];
        // Put that image on the tab bar item 
        [tbi setImage:i];
    } 
    return self;
}

-(id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle
{
// Disregard parameters - implementation detail return [self init];
    return [self init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"Loaded the view for CurrentTimeViewController");
// Set the background color of the view so we can see it 
    [[self view] setBackgroundColor:[UIColor yellowColor]];
}

- (IBAction)showCurrentTime:(id)sender
{
NSDate *now = [NSDate date];
// Static here means "only once." The *variable* formatter // is created when the program is first loaded into memory. 
    // The first time this method runs, formatter will 
    // be nil and the if-block will execute, creating
// an NSDateFormatter object that formatter will point to. 
    // Subsequent entry into this method will reuse the same 
    // NSDateFormatter object.
    NSLog(@"here");
static NSDateFormatter *formatter = nil;
if (!formatter) 
{ 
    formatter = [[NSDateFormatter alloc] init]; 
    [formatter setTimeStyle:NSDateFormatterShortStyle];
} 
    [timeLabel setText:[formatter stringFromDate:now]];
    }
@end
