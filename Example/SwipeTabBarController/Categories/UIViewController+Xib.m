//
//  UIViewController+Xib.m
//  SwipeTabBarController
//
//  Created by Mark Glagola on 12/15/12.
//  Copyright (c) 2012 Mark Glagola. All rights reserved.
//

#import "UIViewController+Xib.h"

@implementation UIViewController (Xib)

- (id) initWithNib {
    return [self initWithNibName:NSStringFromClass([self class]) bundle:nil];
}

@end
