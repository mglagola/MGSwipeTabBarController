//
//  UIViewController+MGSwipeSwizzle.m
//  Demo
//
//  Created by Mark Glagola on 7/25/14.
//  Copyright (c) 2014 Mark Glagola. All rights reserved.
//

#import "UIViewController+MGSwipeTabBarController.h"
#import <objc/runtime.h>
#import "MGSwipeTabBarController.h"

static char kMGSwipeTabBarControllerKey;

@implementation UIViewController (MGSwipeTabBarController)

@dynamic swipeTabBarController;

#pragma mark - Setters/Getters
- (void)setSwipeTabBarController:(MGSwipeTabBarController *)swipeTabBarController {
    objc_setAssociatedObject(self, &kMGSwipeTabBarControllerKey, swipeTabBarController, OBJC_ASSOCIATION_ASSIGN);
}

- (MGSwipeTabBarController*)swipeTabBarController {
    return objc_getAssociatedObject(self, &kMGSwipeTabBarControllerKey);
}

@end
