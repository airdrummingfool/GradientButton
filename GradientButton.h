//
// GradientButton.h
//
// Created by Thomas Goode on 7/16/12.
// Copyright (c) 2012 Thomas Goode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface GradientButton : UIButton

@property (nonatomic, strong) UIColor* highColor;
@property (nonatomic, strong) UIColor* lowColor;
@property (nonatomic) NSString* text;
@property (nonatomic, assign) UIColor* textColor;

-(void)setupButton;

@end