//
//  UIViewController+MGSwipeTabBarController.m
//  SwipeTabBarController
//
//  Created by Mark Glagola on 12/15/12.
//  Copyright (c) 2012 Mark Glagola. All rights reserved.
//

#import "UIViewController+MGSwipeTabBarController.h"
#import "MGSwipeTabBarController.h"
#import <objc/runtime.h>

@implementation UIViewController (MGSwipeTabBarController)

NSString * const kMGSwipeTabBarControllerKey = @"MGSwipeTabBarControllerViewControllerObject";

@dynamic swipeTabBarController;

- (void)setSwipeTabBarController:(MGSwipeTabBarController *)swipeTabBarController {
	objc_setAssociatedObject(self, (__bridge const void *)(kMGSwipeTabBarControllerKey), swipeTabBarController, OBJC_ASSOCIATION_ASSIGN);
}

- (MGSwipeTabBarController*)swipeTabBarController {
	return objc_getAssociatedObject(self, (__bridge const void *)(kMGSwipeTabBarControllerKey));
}

@end
