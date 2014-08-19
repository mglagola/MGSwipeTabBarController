//
//  BSSwipeTabBarController.h
//  Barista
//
//  Created by Mark Glagola on 7/24/14.
//  Copyright (c) 2014 Mark Glagola. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+MGSwipeTabBarController.h"

@class MGSwipeTabBarController;

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
