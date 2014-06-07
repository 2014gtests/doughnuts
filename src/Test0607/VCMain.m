//
//  ViewController.m
//  Test0607
//
//  Created by Ern Al on 2014.06.06.
//  Copyright (c) 2014 2014Tests. All rights reserved.
//

#import "VCMain.h"
#import "VRing.h"
#import "VDoughnut.h"

//////////////////////////////////////////////////////////////////////
//
// Constants
//
//////////////////////////////////////////////////////////////////////
static const CGRect kFrame1 = {50,   20, 100, 100};
static const CGRect kFrame2 = {160,  20, 100, 100};
static const CGRect kFrame3 = {50,  130, 100, 100};
static const CGRect kFrame4 = {160, 130, 100, 100};
static const CGRect kFrame5 = {50,  240, 100, 100};
static const CGRect kFrame6 = {160, 240, 100, 100};
static const CGRect kFrame7 = {50,  350, 100, 100};
static const CGRect kFrame8 = {160, 350, 100, 100};

//////////////////////////////////////////////////////////////////////
//
// VCMain
//
//////////////////////////////////////////////////////////////////////
@interface VCMain ()
@end

@implementation VCMain

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  [self.view addSubview:[[VRing alloc] initWithFrame:kFrame1 fgColor:[UIColor redColor] bgColor:[UIColor blackColor]]];
  [self.view addSubview:[[VDoughnut alloc] initWithFrame:kFrame2 color:[UIColor redColor]]];
  [self.view addSubview:[[VRing alloc] initWithFrame:kFrame3 fgColor:[UIColor yellowColor] bgColor:[UIColor blackColor]]];
  [self.view addSubview:[[VDoughnut alloc] initWithFrame:kFrame4 color:[UIColor yellowColor]]];
  [self.view addSubview:[[VRing alloc] initWithFrame:kFrame5 fgColor:[UIColor blueColor] bgColor:[UIColor blackColor]]];
  [self.view addSubview:[[VDoughnut alloc] initWithFrame:kFrame6 color:[UIColor blueColor]]];
  [self.view addSubview:[[VRing alloc] initWithFrame:kFrame7 fgColor:[UIColor orangeColor] bgColor:[UIColor blackColor]]];
  [self.view addSubview:[[VDoughnut alloc] initWithFrame:kFrame8 color:[UIColor orangeColor]]];
}

@end
