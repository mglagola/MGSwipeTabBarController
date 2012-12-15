//
//  TabBar.m
//  SwipeTabBarController
//
//  Created by Mark Glagola on 12/15/12.
//  Copyright (c) 2012 Mark Glagola. All rights reserved.
//

#import "TabBar.h"

@implementation TabBar

- (void) setSelectedIndex:(NSUInteger)selectedIndex {
    
    UIButton *selectedButton = (UIButton*)[self viewWithTag:selectedIndex];
    CGRect sFrame = selectedView.frame;
    sFrame.origin.x = selectedButton.frame.origin.x;
    selectedView.frame = sFrame;
    
    [super setSelectedIndex:selectedIndex];
}

- (IBAction)viewButtonPressed:(UIButton*)sender {
    self.selectedIndex = sender.tag; //set in IB
    [self.delegate swipeTabBarDidSelectIndex:self.selectedIndex];
}

@end
