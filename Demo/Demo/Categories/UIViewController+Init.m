//
//  UIViewController+Init.m
//  Barista
//
//  Created by Mark Glagola on 7/24/14.
//  Copyright (c) 2014 Mark Glagola. All rights reserved.
//

#import "UIViewController+Init.h"
#import "AppDelegate.h"

@implementation UIViewController (Init)

+ (instancetype) instantiate {
    return [[AppDelegate sharedDelegate].window.rootViewController.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([self class])];
}

+ (UINavigationController*) instantiateWithNavigationController {
    UIViewController *controller = [self instantiate];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
    return nav;
}

@end
