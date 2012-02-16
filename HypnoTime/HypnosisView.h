//
//  HypnosisView.h
//  Hypnotizer
//
//  Created by GALVEZZ on 2/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HypnosisView : UIView
{
    float xShift, yShift;
    UIColor *stripeColor;
}

@property (nonatomic, assign) float xShift; 
@property (nonatomic, assign) float yShift;

@end
