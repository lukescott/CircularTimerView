//
//  MainViewController.h
//  CircularTimerDemo
//
//  Copyright (c) 2013 Crowd Studio.
//  Copyright (c) 2013 Luke Scott.
//  All rights reserved.
//
//  Distributed under MIT license, see LICENSE file
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property (nonatomic, weak) IBOutlet UISegmentedControl *backgroundColorSegmentedControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *backgroundFadeColorSegmentedControl;
@property (nonatomic, weak) IBOutlet UISegmentedControl *foregroundColorSegmentedControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *foregroundFadeColorSegmentedControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *directionSegmentedControl;
@property (nonatomic, weak) IBOutlet UISlider *radiusSlider;
@property (nonatomic, weak) IBOutlet UISlider *internalRadiusSlider;
@property (nonatomic, weak) IBOutlet UIButton *initialDateButton;
@property (nonatomic, weak) IBOutlet UILabel *radiusLabel;
@property (nonatomic, weak) IBOutlet UILabel *internalRadiusLabel;

- (IBAction)showPicker:(id)sender;
- (IBAction)slideRadius:(id)sender;

@end