# MGSwipeTabBarController
**UPDATE:** There is an updated version in the works to support auto layout, TableViews/TableViewControllers, CollectionViews/CollectionViewControllers, and more. Check back soon.


## Example Screenshots
![ScreenShot 1](http://farm9.staticflickr.com/8479/8278966578_c8532c456b.jpg)

![ScreenShot 2](http://farm9.staticflickr.com/8502/8277908927_bdba07fedf.jpg) 
![ScreenShot 3](http://farm9.staticflickr.com/8484/8277908843_092302bb8a.jpg)

## Setup
- Add the "MGSwipeTabBarController" Folder to your project
- import "MGSwipeTabBarControllerHeaders.h" in your project's "…-Prefix.pch" file

## Example Usage

### Create a MGSwipeTabBarController
There is a couple ways in setting up your SwipeTabBarController

Here is the way without a tabBar:
```objc
NSArray *viewControllers = . . . //your view controllers
MGSwipeTabBarController *tabController = [[MGSwipeTabBarController alloc] initWithViewControllers:viewControllers]; 
```
Here is the way with a tabBar:
```objc
NSArray *viewControllers = . . . //your view controllers
TabBar *customTabBar = . . . //your tab bar
MGSwipeTabBarController *tabController = [[MGSwipeTabBarController alloc] initWithViewControllers:viewControllers tabBar:tabBar]; 
```
Here is the way with a tabBar and a custom tabBar position
- Two options: MGTabBarPositionTop (Default) & MGTabBarPositionBottom

```objc
NSArray *viewControllers = . . . //your view controllers
TabBar *customTabBar = . . . //your tab bar
MGSwipeTabBarController *tabController = [[MGSwipeTabBarController alloc] initWithViewControllers:viewControllers tabBar:tabBar atPosition:MGTabBarPositionBottom]; 
```

#### Build your own custom TabBar
##### NOTE: TabBars are optional!
- Subclass MGSwipeTabBar
- remember to call the delegate method "[self.delegate swipeTabBarDidSelectIndex:YOUR_SELECTED_INDEX]" when a button was selected in tabBar
- DO NOT call "[self.delegate swipeTabBarDidSelectIndex:YOUR_SELECTED_INDEX]" in setSelectedIndex:

Check out the Example Demo for a guide/example in subclassing MGSwipeTabBar (very simple, two method implementation)
