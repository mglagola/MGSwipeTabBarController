//
//  UIViewController+MGSwipeSwizzle.h
//  Demo
//
//  Created by Mark Glagola on 7/25/14.
//  Copyright (c) 2014 Mark Glagola. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MGSwipeTabBarController;

@interface UIViewController (MGSwipeTabBarController)

@property (nonatomic, weak) MGSwipeTabBarController* swipeTabBarController;

@end
