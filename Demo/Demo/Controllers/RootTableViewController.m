//
//  RootTableViewController.m
//  Demo
//
//  Created by Mark Glagola on 7/24/14.
//  Copyright (c) 2014 Mark Glagola. All rights reserved.
//

#import "RootTableViewController.h"
#import "SwipeTabBarController.h"
#import "UIViewController+Init.h"
#import "TableViewController.h"

@interface RootTableViewController ()

@property (nonatomic) NSArray *data;

@end

@implementation RootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.data = @[
                  @[@"Demo Plain", @"Demo w/ Navigation Bar Opaque", @"Non Storyboard Plain"],
                  @[@"Demo w/ Navigation Bar"]
                  ];
    
    self.title = @"Demo";
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBarHidden = NO;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ((NSArray*)self.data[section]).count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [self.data[indexPath.section] objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - Table view delegate
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    UIViewController *controller = nil;
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                controller = [SwipeTabBarController instantiate];
                [self.navigationController setNavigationBarHidden:YES animated:YES];
                break;
            case 1:
                controller = [SwipeTabBarController instantiate];
                self.navigationController.navigationBar.translucent = NO;
                break;
            case 2: {
                UIViewController *c1 = [[UIViewController alloc] init];
                c1.view.backgroundColor = [UIColor redColor];
                UIViewController *c2 = [[UIViewController alloc] init];
                c2.view.backgroundColor = [UIColor blueColor];
                controller = [[MGSwipeTabBarController alloc] initWithViewControllers:@[c1, c2]];
                break;
            }
                
            default:
                controller = nil;
                break;
        }
        
    } else if (indexPath.section == 1) {
        controller = [SwipeTabBarController instantiate];
        self.navigationController.navigationBar.translucent = YES;
    }
    
    if (controller)
        [self.navigationController pushViewController:controller animated:YES];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 66;
}

- (NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return section == 0 ? @"Working" : @"Buggy";
}

@end
