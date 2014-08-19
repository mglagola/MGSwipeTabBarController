//
//  TableViewController.m
//  Demo
//
//  Created by Mark Glagola on 7/24/14.
//  Copyright (c) 2014 Mark Glagola. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@property (nonatomic) NSArray *data;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"TableViewController";
    
    self.data = @[@"This is a subclass of",
                  @"UITableViewController",
                  @"Lorem ipsum dolor sit amet",
                  @"Lorem ipsum dolor sit amet",
                  @"Lorem ipsum dolor sit amet",
                  @"Lorem ipsum dolor sit amet",
                  @"Lorem ipsum dolor sit amet",
                  @"Lorem ipsum dolor sit amet",
                  @"Lorem ipsum dolor sit amet",
                  @"Lorem ipsum dolor sit amet",
                  @"Lorem ipsum dolor sit amet",
                  @"Lorem ipsum dolor sit amet",
                  @"Lorem ipsum dolor sit amet",
                  @"Lorem ipsum dolor sit amet",
                  @"Lorem ipsum dolor sit amet",
                  @"Lorem ipsum dolor sit amet",
                  ];
    
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = self.data[indexPath.row];
    return cell;
}

#pragma mark - Table view delegate
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0f;
}

@end
