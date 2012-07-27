//
// GradientButton.m
//
// Created by Thomas Goode on 7/16/12.
// Copyright (c) 2012 Thomas Goode. All rights reserved.
//

#import "GradientButton.h"

@interface GradientButton ()

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

-(void)configureButtonLayer;
-(void)updateButton;

@end

@implementation GradientButton

@synthesize highColor = _highColor;
@synthesize lowColor = _lowColor;
@synthesize gradientLayer = _gradientLayer;

#pragma mark init and setup methods
-(id)initWithFrame:(CGRect)frame {
	if ( self = [super initWithFrame:frame] ) {
		[self setupButton];
	}
	return self;
}

-(void)awakeFromNib {
	[self setupButton];
}

-(void)setupButton {
	[self configureButtonLayer];
}

-(void)configureButtonLayer {
	[self.layer insertSublayer:self.gradientLayer atIndex:0];
	self.layer.cornerRadius = 7.0f;
	self.layer.masksToBounds = YES;
	self.layer.borderWidth = 0.0f;
}

-(void)updateButton {
	if (self.highColor && self.lowColor) {
        if ( self.highlighted ) {
			[self.gradientLayer setColors:[NSArray arrayWithObjects:(id)[self.lowColor CGColor], (id)[self.highColor CGColor], nil]];
		}
		else {
			[self.gradientLayer setColors:[NSArray arrayWithObjects:(id)[self.highColor CGColor], (id)[self.lowColor CGColor], nil]];
		}
    }
}

#pragma mark getters & setters
-(CAGradientLayer* )gradientLayer {
	if ( _gradientLayer == nil ) {
		_gradientLayer = [[CAGradientLayer alloc] init];
		_gradientLayer.bounds = [self bounds];
		_gradientLayer.position = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
	}

	return _gradientLayer;
}

-(void)setHighColor:(UIColor* )color {
    _highColor = color;
    [self updateButton];
}

- (void)setLowColor:(UIColor* )color {
    _lowColor = color;
    [self updateButton];
}

-(void)setHighlighted:(BOOL)highlighted {
	[super setHighlighted:highlighted];
	[self updateButton];
}

-(void)setText:(NSString *)text {
	[self setTitle:text forState:UIControlStateNormal];
}

-(NSString* )text {
	return self.titleLabel.text;
}

@end