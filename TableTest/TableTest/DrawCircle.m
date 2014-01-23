//
//  DrawCircle.m
//  TableTest
//
//  Created by Jian.Zhao on 14-1-23.
//  Copyright (c) 2014年 艺龙员工. All rights reserved.
//

#import "DrawCircle.h"
#import <QuartzCore/QuartzCore.h>

#define ToRad(deg) 		( (M_PI * (deg)) / 180.0 )


@implementation DrawCircle{

    CGFloat radius;
    int angle;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _unfilledColor = [UIColor blackColor];
        _filledColor = [UIColor redColor];
        
        _minimumValue = 0.0f;
        _maximumValue = 100.0f;
        _currentValue = 0.0f;
        _lineWidth = 5;
        
        angle = 0;
        radius = self.frame.size.height/2- _lineWidth/2 -10;
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    // Drawing code
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextAddArc(ctx, self.frame.size.width/2, self.frame.size.height/2, radius, 0, M_PI*2, 0);
    [_unfilledColor  setStroke];
    CGContextSetLineWidth(ctx, _lineWidth);
    CGContextSetLineCap(ctx, kCGLineCapButt);
    CGContextDrawPath(ctx, kCGPathStroke);
    
    
    /*
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    CGFloat colors[] =
    {
        204.0 / 255.0, 224.0 / 255.0, 244.0 / 255.0, 1.00,
        29.0 / 255.0, 156.0 / 255.0, 215.0 / 255.0, 1.00,
        0.0 / 255.0,  50.0 / 255.0, 126.0 / 255.0, 1.00,
    };
    CGGradientRef gradient = CGGradientCreateWithColorComponents(rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));
    CGColorSpaceRelease(rgb);
    CGContextDrawLinearGradient(ctx, gradient,CGPointMake(0.0,0.0) ,CGPointMake(0.0,self.frame.size.height),
                                kCGGradientDrawsBeforeStartLocation);
    */
    
    //
    angle = (self.currentValue/self.maximumValue)*360;
    
    CGContextAddArc(ctx, self.frame.size.width/2, self.frame.size.height/2, radius, 3*M_PI/2,3*M_PI/2+ToRad(angle), 0);
    [_filledColor  setStroke];
    CGContextSetLineWidth(ctx, _lineWidth);
    CGContextSetLineCap(ctx, kCGLineCapButt);
    CGContextDrawPath(ctx, kCGPathStroke);
}



-(void)setTheProgressWithGivenValue:(float)value{

    self.currentValue = value;
    [self setNeedsDisplay];
}

@end
