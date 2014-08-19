# MGSwipeTabBarController

## Example Screenshots
![ScreenShot 1]()
![ScreenShot 2]() 

## Setup
CocoaPods is recommended.
#### CocoaPods 
- Add `pod 'MGSwipeTabBarController', '~>X.X'` in your `Podfile`.  Fill in `~>X.X` with the latest pod spec version or `:head` if you live dangerously.
- import via `#import <MGSwipeTabBarController/MGSwipeTabBarController.h>`

#### Old Style
- Drag and drop the MGSwipeTabBarController/MGSwipeTabBarController Folder into your iOS project
- import via `#import "MGSwipeTabBarController.h"`


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
There is a bug currently with transparent UI bars. The demo demonstrates this bug. 