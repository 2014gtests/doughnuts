//
//  VDoughnut.m
//  Test0607
//
//  Created by Ern Al on 2014.06.07.
//  Copyright (c) 2014 2014Tests. All rights reserved.
//

#import "VDoughnut.h"

@interface VDoughnut()
@property (strong, nonatomic) UIColor *color;
@end

@implementation VDoughnut

- (id)initWithFrame:(CGRect)frame color:(UIColor *)inColor
{
  self = [super initWithFrame:frame];
  if (self)
  {
    self.backgroundColor = [UIColor clearColor];
    self.color = inColor;
  }
  return self;
}

- (void)drawRect:(CGRect)inRect
{
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGPoint center = CGPointMake(CGRectGetMidX(inRect), CGRectGetMidY(inRect));
  
  // Draw the base
  CGContextAddArc(context, center.x, center.y, inRect.size.width/3, 0, M_PI*2, 0);
  CGContextSetStrokeColorWithColor(context, self.color.CGColor);
  CGContextSetLineWidth(context, inRect.size.width/3);
  CGContextSetLineCap(context, kCGLineCapButt);
  CGContextDrawPath(context, kCGPathStroke);
  
  // Get gradient color components
  const CGFloat *color = CGColorGetComponents(self.color.CGColor);
  CGFloat r = color[0];
  CGFloat g = color[1];
  CGFloat b = color[2];
  CGFloat a = 0.5;
  CGFloat componentsOuterToMiddle[] = { r, g, b, a, 1.0, 1.0, 1.0, a }; // Start with base color, end with white
  CGFloat componentsMiddleToInner[] = { 1.0, 1.0, 1.0, a, r, g, b, a }; // Start with white, end with base color

  // Create the 2 radial gradients, then draw them
  CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
  CGGradientRef gradientOuterToMiddle = CGGradientCreateWithColorComponents(colorSpace, componentsOuterToMiddle, NULL, 2);
  CGGradientRef gradientMiddleToInner = CGGradientCreateWithColorComponents(colorSpace, componentsMiddleToInner, NULL, 2);
  CGContextDrawRadialGradient(context, gradientOuterToMiddle, center, (inRect.size.width/2), center, (inRect.size.width/3), 0);
  CGContextDrawRadialGradient(context, gradientMiddleToInner, center, (inRect.size.width/3), center, (inRect.size.width/6), 0);
  
  CGColorSpaceRelease(colorSpace);
  CGGradientRelease(gradientOuterToMiddle);
  CGGradientRelease(gradientMiddleToInner);
  colorSpace = NULL;
  gradientOuterToMiddle = NULL;
  gradientMiddleToInner = NULL;
}

@end
