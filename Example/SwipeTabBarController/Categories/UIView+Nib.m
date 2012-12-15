//
//  UIView+Nib.m
//  SwipeTabBarController
//
//  Created by Mark Glagola on 12/15/12.
//  Copyright (c) 2012 Mark Glagola. All rights reserved.
//

#import "UIView+Nib.h"

@implementation UIView (Nib)

- (id) initWithNib {
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
    return [views objectAtIndex:0];
}

@end
