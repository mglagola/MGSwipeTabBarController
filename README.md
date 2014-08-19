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
MGSwipeTabBarController *swipeController = . . . // initialized someway (i.e. storyboard, nib, etc).
swipeController.viewControllers = viewControllers;
```


## Limitations
There is a bug currently with transparent UI bars. The demo demonstrates this bug.  I could not find a fix for this issue and when I would seem to fix it for iOS 7, it would not work on iOS 8 and vice versa.
[The issue can be found here](https://github.com/mglagola/MGSwipeTabBarController/issues/8)
