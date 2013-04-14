//
//  MainViewController.m
//  CircularTimerDemo
//
//  Copyright (c) 2013 Crowd Studio.
//  Copyright (c) 2013 Luke Scott.
//  All rights reserved.
//
//  Distributed under MIT license, see LICENSE file
//

#import "MainViewController.h"
#import "DetailViewController.h"

@interface MainViewController () <UIPickerViewDelegate>
{
    UIDatePicker *datePicker;
    UIView *hidePickerView;
    NSTimeInterval seconds;
}
@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height + 250, 325, 250)];
    datePicker.countDownDuration = 30;
    datePicker.datePickerMode = UIDatePickerModeCountDownTimer;
    [self.view addSubview:datePicker];
}

- (IBAction)showPicker:(UIButton *)sender
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    [UIView animateWithDuration:0.3 animations:^{
        datePicker.frame = CGRectMake(0, screenRect.size.height - 230, 320, 250);
    }];
    [self addCancelView];
}

- (void)addCancelView
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    hidePickerView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0, 320, screenRect.size.height - 230)];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidePicker:)];
    [hidePickerView addGestureRecognizer:tap];
    hidePickerView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:hidePickerView];
}

- (void)hidePicker:(UITapGestureRecognizer *)sender
{
    [hidePickerView removeFromSuperview];
    datePicker.tag = 0;
    [UIView animateWithDuration:0.3 animations:^{
        datePicker.frame = CGRectMake(0, self.view.frame.size.height + 250, 325, 250);
    }];
}

- (IBAction)slideRadius:(UISlider *)sender
{
    NSString* formattedValue = [NSString stringWithFormat:@"%.f", sender.value];

    if (sender.tag == 303) {
        self.radiusLabel.text = [NSString stringWithFormat:@"Radius (%@)", formattedValue];
    } else if (sender.tag == 404) {
        self.internalRadiusLabel.text = [NSString stringWithFormat:@"Internal Radius (%@)", formattedValue];
    }
}

- (NSDate *)dateWithZeroSeconds:(NSDate *)date
{
    NSTimeInterval time = floor([date timeIntervalSinceReferenceDate] / 60.0) * 60.0;
    return  [NSDate dateWithTimeIntervalSinceReferenceDate:time];
}

- (UIColor *)getColorForSelectedSegmentedControl:(UISegmentedControl *)sg
{
    switch (sg.selectedSegmentIndex) {
        case 0:
            return [UIColor lightGrayColor];
            break;
        case 1:
            return [UIColor purpleColor];
            break;
        case 2:
            return [UIColor blackColor];
            break;
        case 3:
            return [UIColor redColor];
            break;
        default:
            break;
    }
    return nil;
}

#pragma mark
#pragma mark Segue
#pragma mark

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"detailSegue"]) {
        DetailViewController *detailViewController = [segue destinationViewController];
        detailViewController.radius = round(self.radiusSlider.value);
        detailViewController.internalRadius = round(self.internalRadiusSlider.value);
        detailViewController.countdownSeconds = datePicker.countDownDuration;
        detailViewController.foregroundColor = [self getColorForSelectedSegmentedControl:self.foregroundColorSegmentedControl];
        detailViewController.foregroundFadeColor = [self getColorForSelectedSegmentedControl:self.foregroundFadeColorSegmentedControl];
        detailViewController.backgroundColor = [self getColorForSelectedSegmentedControl:self.backgroundColorSegmentedControl];
        detailViewController.backgroundFadeColor = [self getColorForSelectedSegmentedControl:self.backgroundFadeColorSegmentedControl];
        detailViewController.direction = self.directionSegmentedControl.selectedSegmentIndex;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
