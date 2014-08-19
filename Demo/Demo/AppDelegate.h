//
//  AppDelegate.h
//  Demo
//
//  Created by Mark Glagola on 7/24/14.
//  Copyright (c) 2014 Mark Glagola. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+(instancetype) sharedDelegate;

@end

