//
//  MGSwipeTabBar.m
//  SwipeTabBarController
//
//  Created by Mark Glagola on 12/15/12.
//  Copyright (c) 2012 Mark Glagola. All rights reserved.
//

#import "MGSwipeTabBar.h"

@implementation MGSwipeTabBar

@synthesize selectedIndex = _selectedIndex, delegate = _delegate;

- (void) setSelectedIndex:(NSUInteger)selectedIndex {
    _selectedIndex = selectedIndex;
}

@end
