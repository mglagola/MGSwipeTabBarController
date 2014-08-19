//
//  ViewController.h
//  Demo
//
//  Created by Mark Glagola on 7/24/14.
//  Copyright (c) 2014 Mark Glagola. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *textLabel;

+ (instancetype) initWithText:(NSString*)text color:(UIColor*)color;

@end

