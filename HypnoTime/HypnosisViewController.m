//
//  HypnosisViewController.m
//  HypnoTime
//
//  Created by GALVEZZ on 2/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"

@implementation HypnosisViewController 


-(id)init
{
// Call the superclass's designated initializer 
    self = [super initWithNibName:nil
                        bundle:nil];
    if (self) { // Get the tab bar item 
        UITabBarItem *tbi = [self tabBarItem];
    // Give it a label 
        [tbi setTitle:@"Hypnosis"];
} 
    return self;
}

-(id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle
{
    
// Disregard parameters - nib name is an implementation detail 
    return [self init];

}

- (void)loadView {
    HypnosisView *hv = [[HypnosisView alloc] initWithFrame:CGRectZero]; 
    [hv setBackgroundColor:[UIColor whiteColor]]; 
    [self setView:hv]; 
    //[hv release];
}

- (void)viewDidLoad {

[super viewDidLoad]; 
    NSLog(@"Loaded the view for HypnosisViewController");
// Set the background color of the view so we can see it 
  //  [[self view] setBackgroundColor:[UIColor orangeColor]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"Monitoring accelerometer"); 
    UIAccelerometer *a = [UIAccelerometer sharedAccelerometer];
    // Receive updates every 1/10th of a second. 
    [a setUpdateInterval:0.1]; 
    [a setDelegate:self];
    [[self view] becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated]; 
    [[UIAccelerometer sharedAccelerometer] setDelegate:nil];
}

- (void)accelerometer:(UIAccelerometer *)meter didAccelerate:(UIAcceleration *)accel
{
    //NSLog(@"%f, %f, %f", [accel x], [accel y], [accel z]);
    HypnosisView *hv = (HypnosisView *)[self view]; 
    float xShift = [hv xShift] * 0.8 + [accel x] * 2.0; 
    float yShift = [hv yShift] * 0.8 - [accel y] * 2.0;
    [hv setXShift:xShift]; 
    [hv setYShift:yShift];
//    [hv setXShift:10.0 * [accel x]]; 
//    [hv setYShift:-10.0 * [accel y]];
    
    // Redraw the view 
    [hv setNeedsDisplay];
}


@end
