//
//  DetailViewController.m
//  CircularTimerDemo
//
//  Copyright (c) 2013 Crowd Studio.
//  Copyright (c) 2013 Luke Scott.
//  All rights reserved.
//
//  Distributed under MIT license, see LICENSE file
//

#import "DetailViewController.h"
#import "CircularTimerView.h"

@interface DetailViewController ()

@property (nonatomic, strong) CircularTimerView *circularTimer;

@end

@implementation DetailViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self createCircle];
}

- (void)dealloc
{

}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)createCircle
{
    self.circularTimer = [[CircularTimerView alloc] initWithPosition:CGPointMake(10.0f, 10.0f)
                                                          radius:self.radius
                                                  internalRadius:self.internalRadius];
    
    self.circularTimer.backgroundColor = self.backgroundColor;
    self.circularTimer.backgroundFadeColor = self.backgroundFadeColor;
    self.circularTimer.foregroundColor = self.foregroundColor;
    self.circularTimer.foregroundFadeColor = self.foregroundFadeColor;
    self.circularTimer.direction = self.direction;
    self.circularTimer.font = [UIFont systemFontOfSize:22];
    
    self.circularTimer.frameBlock = ^(CircularTimerView *circularTimerView){
        circularTimerView.text = [NSString stringWithFormat:@"%f", [circularTimerView intervalLength]];
    };
    [self.circularTimer setupCountdown:self.countdownSeconds];
    
    __weak typeof(self) weakSelf = self;
    self.circularTimer.startBlock = ^(CircularTimerView *circularTimerView){
        weakSelf.statusLabel.text = @"Running!";
    };
    self.circularTimer.endBlock = ^(CircularTimerView *circularTimerView){
        weakSelf.statusLabel.text = @"Not running anymore!";
    };
    self.statusLabel.text = ([self.circularTimer willRun]) ? @"Circle will run" : @"Circle won't run";
    
    [self.view addSubview:self.circularTimer];
}

- (IBAction)dismiss:(id)sender
{
    self.circularTimer = nil;
    [self.circularTimer removeFromSuperview];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
