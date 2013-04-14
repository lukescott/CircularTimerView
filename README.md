# CircularTimerView

CircularTimerView is a class that creates a custom circular timer, showing the percentage completed between two dates.

## Installation
===

Drop the files `CircularTimerView.h` and `CircularTimerView.m` into your Xcode project.

## Usage
===

In your ViewController import the header file `CircularTimerView.h`, and create a CircularTimerView property to keep a reference:

`@property (nonatomic, strong) CircularTimerView *circularTimerView;`

Then, to create the object use a code like this:

```
self.circularTimerView =
[[CircularTimerView alloc] initWithPosition:CGPointMake(10.f, 10.f)
                                     radius:100
                             internalRadius:50];
    
// Light gray circle
self.circularTimerView.backgroundColor = [UIColor lightGrayColor];
self.circularTimerView.backgroundFadeColor = nil;

// Circle Fade from green to red
self.circularTimerView.foregroundColor = [UIColor greenColor];
self.circularTimerView.foregroundFadeColor = [UIColor redColor];
self.circularTimerView.direction = CircularTimerViewDirectionCounterClockwise;

// Text fade from green to red
self.circularTimerView.font = [UIFont systemFontOfSize:22];
self.circularTimerView.fontColor = [UIColor greenColor];
self.circularTimerView.fontFadeColor = [UIColor redColor];

// Display seconds - format text here
self.circularTimerView.frameBlock = ^(CircularTimerView *circularTimerView){
    circularTimerView.text = [NSString stringWithFormat:@"%f", [circularTimerView intervalLength]];
};

// 1 minute timer
[self.circularTimerView setupCountdown:60];
```                              

and add it as subview

```
[self.view addSubview:self.circularTimerView];
```

## Authors
===

  - Originally written by CROWD STUDIO
  - Rewritten by Luke Scott
    - Added options to fade from / to colors
    - Added option to customize starting angle
    - Added option to customize direction (clockwise, cc-clockwise, both)
    - Changed NSTimer to CADisplayLink for smooth animation
    - Calculated optimum frame interval using circle arc and time
    - Fixed circular retain between view and timer with willMoveToSuperview
    - Added customizable text (centered in circle)
    - Added convenient setupCountdown:seconds function
    - Changed init function to have fewer options
    - Added initWithFrame for IB (radius = width / 2, internalRadius = 0)
    - Added / moved properties to header file
    - Simplified date functions
    - Renamed to CircularTimerView
    
## Licence
===
  
See [LICENSE](https://github.com/lukescott/circulartimer/blob/master/LICENSE) file
