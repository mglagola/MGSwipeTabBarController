//
//  SwipeTabBarController.m
//  Demo
//
//  Created by Mark Glagola on 7/24/14.
//  Copyright (c) 2014 Mark Glagola. All rights reserved.
//

#import "SwipeTabBarController.h"
#import "ViewController.h"
#import "TableViewController.h"
#import "UIViewController+Init.h"
#import "CollectionViewController.h"
#import "CustomTableViewController.h"
#import "CustomCollectionViewController.h"

@interface SwipeTabBarController ()

@end

@implementation SwipeTabBarController

+ (instancetype) instantiate {
    SwipeTabBarController *controller = [super instantiate];
    [controller setViewControllers:@[[ViewController initWithText:@"Controller 1" color:[UIColor redColor]],
                               [TableViewController instantiate],
                               [CustomTableViewController instantiate],
                               [CollectionViewController instantiate],
                               [CustomCollectionViewController instantiate],
                               [ViewController initWithText:@"Controller 6" color:[UIColor blueColor]],
                               [ViewController initWithText:@"Controller 7" color:[UIColor orangeColor]],
                               ]];
    return controller;
}

- (void)viewDidLoad {
    [super viewDidLoad];
        
    self.title = @"Plain Demo";

    self.delegate = self;
}

#pragma mark - MGSwipeTabBarController
- (void) swipeTabBarController:(MGSwipeTabBarController *)swipeTabBarController didScrollToIndex:(NSInteger)toIndex fromIndex:(NSInteger)fromIndex {
    NSLog(@"toIndex %d, fromIndex %d", toIndex, fromIndex);
}

- (void) swipeTabBarController:(MGSwipeTabBarController *)swipeTabBarController willScrollToIndex:(NSInteger)toIndex fromIndex:(NSInteger)fromIndex {
    
    //There is no bounds checking, so you must check yourself.
    //Use this to your advantage. i.e. when toIndex < 0, we are popping the current view controller
    if (toIndex < 0) {
        [self.navigationController popViewControllerAnimated:YES];
    } else if (toIndex < swipeTabBarController.viewControllers.count) {
        UIViewController *currentController = self.viewControllers[toIndex];
        self.title = currentController.title;
    }
    
}

- (void) swipeTabBarController:(MGSwipeTabBarController *)swipeTabBarController panning:(CGFloat)pan {
    if (pan < -0.3) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
