//
//  DetailViewController.h
//  CircularTimerDemo
//
//  Copyright (c) 2013 Crowd Studio.
//  Copyright (c) 2013 Luke Scott.
//  All rights reserved.
//
//  Distributed under MIT license, see LICENSE file
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property float radius;
@property float internalRadius;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIColor *backgroundFadeColor;
@property (nonatomic, strong) UIColor *foregroundColor;
@property (nonatomic, strong) UIColor *foregroundFadeColor;
@property (nonatomic, assign) NSInteger direction;
@property (nonatomic, assign) NSTimeInterval countdownSeconds;

@property (nonatomic, weak) IBOutlet UILabel *statusLabel;

@end
