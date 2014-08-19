//
//  UIViewController+Init.h
//  Barista
//
//  Created by Mark Glagola on 7/24/14.
//  Copyright (c) 2014 Mark Glagola. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Init)

+ (instancetype) instantiate;

+ (UINavigationController*) instantiateWithNavigationController;

@end
