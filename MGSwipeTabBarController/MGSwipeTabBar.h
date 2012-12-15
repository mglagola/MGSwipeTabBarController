//
//  MGSwipeTabBar.h
//  SwipeTabBarController
//
//  Created by Mark Glagola on 12/15/12.
//  Copyright (c) 2012 Mark Glagola. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MGSwipeTabBarDelegate <NSObject>
- (void) swipeTabBarDidSelectIndex:(NSUInteger)selectedIndex;
@end

@interface MGSwipeTabBar : UIView

@property (nonatomic) id<MGSwipeTabBarDelegate> delegate;

@property (nonatomic) NSUInteger selectedIndex;

@end
