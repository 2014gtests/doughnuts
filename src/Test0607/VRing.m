//
//  VRing.m
//  Test0607
//
//  Created by Ern Al on 2014.06.07.
//  Copyright (c) 2014 2014Tests. All rights reserved.
//

#import "VRing.h"

@interface VRing()
@property (strong, nonatomic) UIColor *fgColor;
@property (strong, nonatomic) UIColor *bgColor;
@end

@implementation VRing

- (id)initWithFrame:(CGRect)frame fgColor:(UIColor *)inFgColor bgColor:(UIColor *)inBgColor;
{
  self = [super initWithFrame:frame];
  if (self)
  {
    self.fgColor = inFgColor;
    self.bgColor = inBgColor;
    self.backgroundColor = [UIColor clearColor];
  }
  return self;
}

- (void)drawRect:(CGRect)inRect
{
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGPoint center = CGPointMake(CGRectGetMidX(inRect), CGRectGetMidY(inRect));
  CGFloat radius = inRect.size.width/3;
  CGFloat bgWidth = inRect.size.width/3;
  CGFloat fgWidth = inRect.size.width/3 * 0.65;
  
  // Draw the background
  CGContextAddArc(context, center.x, center.y, radius, 0, M_PI*2, 0);
  CGContextSetStrokeColorWithColor(context, self.bgColor.CGColor);
  CGContextSetLineWidth(context, bgWidth);
  CGContextSetLineCap(context, kCGLineCapButt);
  CGContextDrawPath(context, kCGPathStroke);
  
  // Draw the foreground
  CGContextAddArc(context, center.x, center.y, radius, 0, M_PI*2, 0);
  CGContextSetStrokeColorWithColor(context, self.fgColor.CGColor);
  CGContextSetLineWidth(context, fgWidth);
  CGContextSetLineCap(context, kCGLineCapButt);
  CGContextDrawPath(context, kCGPathStroke);
}

@end
