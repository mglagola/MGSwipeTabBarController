//
//  ViewController.m
//  Demo
//
//  Created by Mark Glagola on 7/24/14.
//  Copyright (c) 2014 Mark Glagola. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+Init.h"
#import "MGSwipeTabBarController.h"

@interface ViewController ()
@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) UIColor *bgColor;

@end

@implementation ViewController

- (void) setText:(NSString *)text {
    _text = [text copy];
    self.textLabel.text = _text;
    self.title = _text;
}

- (void) setBgColor:(UIColor *)bgColor {
    _bgColor = bgColor;
    self.view.backgroundColor = _bgColor;
}

+ (instancetype) initWithText:(NSString*)text color:(UIColor*)color {
    ViewController *controller = [self instantiate];
    controller.text = text;
    controller.bgColor = color;
    return controller;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textLabel.text = self.text;
    self.view.backgroundColor = self.bgColor;
}

- (void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
