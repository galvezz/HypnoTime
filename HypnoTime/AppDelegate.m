//
//  AppDelegate.m
//  HypnoTime
//
//  Created by GALVEZZ on 2/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "HypnosisViewController.h" 
#import "CurrentTimeViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
  //  self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
 //   self.window.rootViewController = self.viewController;
    
    // Create the tabBarController 
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    // Create two view controllers 
    UIViewController *vc1 = [[HypnosisViewController alloc] init]; 
    UIViewController *vc2 = [[CurrentTimeViewController alloc] init];
    
    // Make an array containing the two view controllers 
    NSArray *viewControllers = [NSArray arrayWithObjects:vc1, vc2, nil];
    
    // The viewControllers array retains vc1 and vc2, we can release 
    // our ownership of them in this method 
 //   [vc1 release]; 
 //   [vc2 release];
    
    [tabBarController setViewControllers:viewControllers];
    
    // Set tabBarController as rootViewController of window 
    [[self window] setRootViewController:tabBarController];
    // The window retains tabBarController, we can release our reference 
   // [tabBarController release];
    

    
    
    // Get the device object 
    UIDevice *device = [UIDevice currentDevice];
    // Tell it to start monitoring the accelerometer for orientation 
    [device beginGeneratingDeviceOrientationNotifications];
    
    // Get the notification center for the app 
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    // Add yourself as an observer 
    [nc addObserver:self
      selector:@selector(orientationChanged:) 
               name:UIDeviceOrientationDidChangeNotification
                object:device];
 
    [self.window makeKeyAndVisible];
     
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}


- (void)orientationChanged:(NSNotification *)note {
    // Log the constant that represents the current orientation 
    NSLog(@"orientationChanged: %d", [[note object] orientation]);
}

@end
