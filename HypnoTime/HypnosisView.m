//
//  HypnosisView.m
//  Hypnotizer
//
//  Created by GALVEZZ on 2/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView
@synthesize xShift, yShift;

- (void)drawRect:(CGRect)rect
{

    // What rectangle am I filling? 
    CGRect bounds = [self bounds];
    // Where is its center? 
    CGPoint center; 
    center.x = bounds.origin.x + bounds.size.width / 2.0; 
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    // From the center how far out to a corner? 
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    // Get the context being drawn upon 
    CGContextRef context = UIGraphicsGetCurrentContext();
    // All lines will be drawn 10 points wide 
    CGContextSetLineWidth(context, 10);
    // Set the stroke color to light gray 
    [stripeColor setStroke];
   // [[UIColor lightGrayColor] setStroke];
    // Draw concentric circles from the outside in 
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        center.x += xShift; 
        center.y += yShift;
        CGContextAddArc(context, center.x, center.y, currentRadius, 0.0, M_PI * 2.0, YES);
        CGContextStrokePath(context);
    }
}

- (id)initWithFrame:(CGRect)r {
    self = [super initWithFrame:r];
    if (self) { 
        // Notice we explicitly retain the UIColor instance 
        // returned by the convenience method lightGrayColor, 
        // because it is autoreleased and we need to keep it around 
        // so we can use it in drawRect:. 
        //stripeColor = [[UIColor lightGrayColor] retain];
        stripeColor = [UIColor lightGrayColor];
    } 
    return self;
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {

// Shake is the only kind of motion for now, 
    // but we should (for future compatibility) 
    // check the motion type. 
if (motion == UIEventSubtypeMotionShake) {
    NSLog(@"shake started"); float r, g, b;
    // Notice the trailing .0 on the dividends... this is necessary 
    // to tell the compiler the result is a floating point number.. otherwise
    // you will always get 0 
    r = random() % 256 / 256.0; 
    g = random() % 256 / 256.0; 
    b = random() % 256 / 256.0; 
    //[stripeColor release]; 
    stripeColor = [UIColor colorWithRed:r
                                  green:g blue:b
                                  alpha:1];
    //[stripeColor retain]; 
    [self setNeedsDisplay];
    }
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

@end
