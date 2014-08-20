# MGSwipeTabBarController

## Example Screenshots
![ScreenShot 1](https://raw.githubusercontent.com/mglagola/MGSwipeTabBarController/2.0/Screenshots/screen-combined.png)

## Demo
Check out the demo project. Follow the steps below and make sure cocoapods is installed.
```
$ git clone https://github.com/mglagola/MGSwipeTabBarController.git
$ cd MGSwipeTabBarController/Demo
$ pod install
$ open Demo.xcworkspace/
```


## Setup
CocoaPods is recommended.
#### CocoaPods 
- Add `pod 'MGSwipeTabBarController', '~>X.X'` in your `Podfile`.  Fill in `~>X.X` with the latest pod spec version or `:head` if you live dangerously.
- `#import <MGSwipeTabBarController/MGSwipeTabBarController.h>`

#### Old Style
- Drag and drop the `MGSwipeTabBarController/MGSwipeTabBarController` Folder into your iOS project
- `#import "MGSwipeTabBarController.h"`


## Example Usage

### Create a MGSwipeTabBarController
Option 1 - Init
```objc
NSArray *viewControllers = . . . //your view controllers
MGSwipeTabBarController *swipeController = [[MGSwipeTabBarController alloc] initWithViewControllers:viewControllers]; 
```

Option 2 - Setter
```objc
NSArray *viewControllers = . . . //your view controllers
MGSwipeTabBarController *swipeController = . . . // initialized some way (i.e. storyboard, nib, etc).
swipeController.viewControllers = viewControllers;
```

## Documentation
```objc
@protocol MGSwipeTabBarControllerDelegate <NSObject>
@optional

/*
 This method will be called prior to the start of the scroll animation.
 
 NOTE: there is no bounds checking for this method. 
 So if the user attempts to scroll out of bounds, lets say from index 0 to off screen left, 
 then @toIndex = -1 and @fromIndex = 0.
 This can be used to your advantage, see the Demo project.
*/
- (void) swipeTabBarController:(MGSwipeTabBarController*)swipeTabBarController
             willScrollToIndex:(NSInteger)toIndex
                     fromIndex:(NSInteger)fromIndex;

/*
 This method will be called after the scroll animation completes.
 There is bounds checking here, unlike swipeTabBarController:willScrollToIndex:fromIndex:
*/
- (void) swipeTabBarController:(MGSwipeTabBarController*)swipeTabBarController
              didScrollToIndex:(NSInteger)toIndex
                     fromIndex:(NSInteger)fromIndex;


- (void) swipeTabBarController:(MGSwipeTabBarController*)swipeTabBarController
                       panning:(CGFloat)pan;

@end

@interface MGSwipeTabBarController : UIViewController <UIGestureRecognizerDelegate>

extern CGFloat const kBPDefaultSelectedIndexAnimationDuration;

//The current view controller stack.
@property (nonatomic, strong) NSArray *viewControllers;

/*
 The current selected index of the controller stack
 Setting this property will also change the value of the 'selectedViewController'
 property accordingly.
 
 This cannot be set over the bounds of the viewController stack
 
 This also cannot be set directly.  Use the setters:
 setSelectedIndex:animated: and
 setSelectedIndex:animationDuration:completion:
*/
@property (nonatomic, readonly) NSInteger selectedIndex;

//Contains the value of the currently selected view controller of the controller stack
@property (nonatomic, weak, readonly) UIViewController *selectedViewController;

@property (nonatomic) id<MGSwipeTabBarControllerDelegate> delegate;

/*
 Default is 0.5 (in seconds)
 Value cannot be less than 0
 
 Responsible for detecting swipes. Swipes are determinded 
 via the swipeInterval. if the pan gesture ended within 
 0 and the swipeInterval, a swipe has been detected and 
 will animate to the new tab.
 */
@property (nonatomic) NSTimeInterval swipeInterval;

@property (nonatomic, readonly) UIView *containerView;

- (id) initWithViewControllers:(NSArray*)viewControllers;

- (void) setSelectedIndex:(NSInteger)selectedIndex animated:(BOOL)animated;
- (void) setSelectedIndex:(NSInteger)selectedIndex animationDuration:(CGFloat)animationDuration completion:(void(^)(BOOL finished))completion;

@end
``` 

## Limitations
There is a bug currently with transparent UI bars. The demo demonstrates this bug.  When I would seem to fix this issue for iOS 7, it would not work on iOS 8 and vice versa.
[The issue can be found here](https://github.com/mglagola/MGSwipeTabBarController/issues/8)
