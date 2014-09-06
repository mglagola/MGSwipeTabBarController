//
//  BSSwipeTabBarController.m
//  Barista
//
//  Created by Mark Glagola on 7/24/14.
//  Copyright (c) 2014 Mark Glagola. All rights reserved.
//

#import "MGSwipeTabBarController.h"

@interface MGSwipeTabBarController ()

@property (nonatomic) NSDate *panStarted;

@property (nonatomic) NSArray *containerHorizontalConstraints;
@property (nonatomic) NSArray *containerVerticalConstraints;

@end

@implementation MGSwipeTabBarController

@synthesize selectedViewController = _selectedViewController, selectedIndex = _selectedIndex, viewControllers = _viewControllers, containerView = _containerView;
@synthesize containerHorizontalConstraints = _containerHorizontalConstraints, containerVerticalConstraints = _containerVerticalConstraints;

CGFloat const kBPDefaultSelectedIndexAnimationDuration = .35f;

#pragma mark - Setters/Getters
- (void) setSwipeInterval:(NSTimeInterval)swipeInterval {
    if (swipeInterval < 0)
        _swipeInterval = 0;
    _swipeInterval = swipeInterval;
}

- (void) setView:(UIView*)view constraints:(NSArray*)constraints to:(NSArray * __strong *)reference{
    if (*reference) [view removeConstraints:*reference];
    *reference = constraints;
    [view addConstraints:*reference];
}

- (void) setContainerHorizontalConstraints:(NSArray *)containerHorizontalConstraints {
    [self setView:self.containerView constraints:containerHorizontalConstraints to:&_containerHorizontalConstraints];
}

- (void) setContainerVerticalConstraints:(NSArray *)containerVerticalConstraints {
    [self setView:self.view constraints:containerVerticalConstraints to:&_containerVerticalConstraints];
}

- (void) setViewControllers:(NSArray *)viewControllers {
    [[_viewControllers valueForKey:@"view"] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [_viewControllers makeObjectsPerformSelector:@selector(removeFromParentViewController)];
    [self.view removeConstraints:self.view.constraints];
    
    NSUInteger count = viewControllers.count;
    
    if (!_containerView) {
        _containerView = [[UIView alloc] init];
        [self.view addSubview:_containerView];
        
        _containerView.translatesAutoresizingMaskIntoConstraints = NO;
        [self updateContainerConstraints:count];
    }
    
    NSMutableDictionary *viewBindings = [NSMutableDictionary dictionary];
    NSMutableString *autoLayoutString = [NSMutableString string];
    [viewControllers enumerateObjectsUsingBlock:^(UIViewController* controller, NSUInteger idx, BOOL *stop) {
        UIView *view = controller.view;
        [self.containerView addSubview:view];
        controller.view.layer.zPosition = count - idx;
        controller.swipeTabBarController = self;
        [self addChildViewController:controller];
        
        view.translatesAutoresizingMaskIntoConstraints = NO;
        [self.containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view)]];
        
        NSString *key = [NSString stringWithFormat:@"view%d",idx];
        [viewBindings setObject:view forKey:key];
        if (idx == 0) [autoLayoutString appendFormat:@"[%@]",key];
        else [autoLayoutString appendFormat:@"[%@(==%@)]",key, [NSString stringWithFormat:@"view%d",idx-1]];
    }];
    
    [viewBindings setObject:self.view forKey:@"parent"];
    NSString *controllersHorizontal = [NSString stringWithFormat:@"|%@|", [autoLayoutString copy]];
    [self.containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:controllersHorizontal
                                                                               options:0 metrics:nil views:[viewBindings copy]]];
    
    _viewControllers = viewControllers;
}

- (void) setSelectedViewController:(UIViewController *)selectedViewController {
    if (![self.viewControllers containsObject:selectedViewController])
        [NSException raise:NSInternalInconsistencyException format:@"%@ is not in viewControllers", selectedViewController];
    
    _selectedViewController = selectedViewController;
    CGRect bounds = self.view.bounds;
    bounds.origin.x = selectedViewController.view.frame.size.width*[self.viewControllers indexOfObject:selectedViewController];
    self.view.bounds = bounds;
}

- (void) setSelectedIndex:(NSInteger)selectedIndex {
    if (selectedIndex < 0) selectedIndex = 0;
    if (selectedIndex >= self.viewControllers.count) selectedIndex = self.viewControllers.count - 1;
    self.selectedViewController = [self.viewControllers objectAtIndex:selectedIndex];
    _selectedIndex = selectedIndex;
}

- (void) setSelectedIndex:(NSInteger)selectedIndex animated:(BOOL)animated {
    [self setSelectedIndex:selectedIndex animationDuration:animated ? kBPDefaultSelectedIndexAnimationDuration : 0 completion:NULL];
}

- (void) setSelectedIndex:(NSInteger)selectedIndex animationDuration:(CGFloat)animationDuration completion:(void(^)(BOOL finished))completion{
    NSInteger fromIndex = self.selectedIndex;
    if ([self.delegate respondsToSelector:@selector(swipeTabBarController:willScrollToIndex:fromIndex:)])
        [self.delegate swipeTabBarController:self willScrollToIndex:selectedIndex fromIndex:fromIndex];
    
    [UIView animateWithDuration:animationDuration animations:^{
        self.selectedIndex = selectedIndex;
    } completion:^(BOOL finished) {
        if (completion)
            completion(finished);
        if ([self.delegate respondsToSelector:@selector(swipeTabBarController:didScrollToIndex:fromIndex:)])
            [self.delegate swipeTabBarController:self didScrollToIndex:self.selectedIndex fromIndex:fromIndex];
    }];
}

- (void) setSelectedIndex:(NSInteger)selectedIndex animationDuration:(CGFloat)animationDuration initialSpringVelocity:(CGFloat)velocity completion:(void(^)(BOOL finished))completion
{
    NSInteger fromIndex = self.selectedIndex;
    if ([self.delegate respondsToSelector:@selector(swipeTabBarController:willScrollToIndex:fromIndex:)])
        [self.delegate swipeTabBarController:self willScrollToIndex:selectedIndex fromIndex:fromIndex];

    [UIView animateWithDuration:animationDuration delay:0 usingSpringWithDamping:1 initialSpringVelocity:velocity options:UIViewAnimationOptionAllowUserInteraction animations:^{
        self.selectedIndex = selectedIndex;
    } completion:^(BOOL finished) {
        if (completion)
            completion(finished);
        if ([self.delegate respondsToSelector:@selector(swipeTabBarController:didScrollToIndex:fromIndex:)])
            [self.delegate swipeTabBarController:self didScrollToIndex:self.selectedIndex fromIndex:fromIndex];
    }];
}

#pragma mark - Init
- (id) initWithViewControllers:(NSArray *)viewControllers {
    if (self = [super init]) {
        self.viewControllers = viewControllers;
    }
    return self;
}


#pragma mark - View Loads
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    
    self.swipeInterval = 0.5f;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    pan.maximumNumberOfTouches = 1;
    pan.delegate = self;
    [self.view addGestureRecognizer:pan];
}

- (void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    [self updateContainerConstraints:self.viewControllers.count];
}

- (void) viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.containerView.translatesAutoresizingMaskIntoConstraints = YES;
    CGRect frame = self.containerView.frame;
    frame.origin.x = 0;
    self.containerView.frame = frame;
    self.containerView.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void) updateContainerConstraints:(NSUInteger)controllersCount {
    NSString *format = [NSString stringWithFormat:@"[view(==%d)]", (int)(self.view.frame.size.width * controllersCount)];
    self.containerHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:format options:0 metrics:nil views:@{@"view":_containerView}];
    self.containerVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:nil views:@{@"view":_containerView}];
}

#pragma mark - Gestures
- (void) panGesture:(UIPanGestureRecognizer*)gesture {
    UIView *view = gesture.view;
    CGPoint translation = [gesture translationInView:view];

    CGRect bounds = view.bounds;
    bounds.origin.x -= translation.x;
    view.bounds = bounds;
    
    [gesture setTranslation:CGPointMake(0, 0) inView:view];

    if (gesture.state == UIGestureRecognizerStateBegan) {
        self.panStarted = [NSDate date];
    }
    
    else if (gesture.state == UIGestureRecognizerStateChanged) {
        if ([self.delegate respondsToSelector:@selector(swipeTabBarController:panning:)]) {
            CGFloat page = bounds.origin.x / bounds.size.width;
            NSLog(@"%f", page);
            [self.delegate swipeTabBarController:self panning:page];
        }
    }
    
    else if (gesture.state == UIGestureRecognizerStateEnded || gesture.state == UIGestureRecognizerStateCancelled ||
        gesture.state == UIGestureRecognizerStateFailed) {
        
        NSTimeInterval sinceStart = [[NSDate date] timeIntervalSinceDate:self.panStarted];
        NSInteger index;
        if (sinceStart <= self.swipeInterval) {
            BOOL movingRight = view.bounds.origin.x > self.selectedViewController.view.frame.origin.x;
            if (movingRight) {
                index = self.selectedIndex+1;
            } else {
                index = self.selectedIndex-1;
            }
        } else {
            index = floor((bounds.origin.x / bounds.size.width) + 0.5);
        }
        
        CGPoint velGest = [gesture velocityInView:view];
        CGFloat vel = velGest.x / bounds.origin.x;
        [self setSelectedIndex:index animationDuration:kBPDefaultSelectedIndexAnimationDuration initialSpringVelocity:vel completion:NULL];
        
        self.panStarted = nil;
    }
    
}

// gesture recognizer should only begin when horizontally panning
- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)panGestureRecognizer {
    CGPoint velocity = [panGestureRecognizer velocityInView:panGestureRecognizer.view];
    return fabs(velocity.x) > fabs(velocity.y);
}

@end
