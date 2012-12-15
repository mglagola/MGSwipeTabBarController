//
//  MGSwipeTabBarController.h
//  SwipeTabBarController
//
//  Created by Mark Glagola on 12/15/12.
//  Copyright (c) 2012 Mark Glagola. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGSwipeTabBar.h"

typedef enum {
    MGTabBarPositionTop = 0,
    MGTabBarPositionBottom,
}MGTabBarPosition;

@interface MGSwipeTabBarController : UIViewController <UIScrollViewDelegate, MGSwipeTabBarDelegate> {
    MGTabBarPosition tabBarPosition;
}

@property (nonatomic, readonly) MGSwipeTabBar *tabBar;

@property (nonatomic, readonly) NSArray *viewControllers;

@property (nonatomic, readonly) UIViewController *selectedViewController;

@property (nonatomic) NSUInteger selectedIndex;

@property (nonatomic,readonly) UIScrollView *scrollView;

//not tabBar(nil) - swiping through tabs only
- (id) initWithViewControllers:(NSArray*)viewControllers;

//swiping with tab selection also - default tabBar position is top (MGTabBarPositionTop)
- (id) initWithViewControllers:(NSArray*)viewControllers tabBar:(MGSwipeTabBar*)tabBar;

- (id) initWithViewControllers:(NSArray*)viewControllers tabBar:(MGSwipeTabBar*)tabBar atPosition:(MGTabBarPosition)position;

@end
