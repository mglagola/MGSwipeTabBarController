//
//  CustomCollectionViewController.h
//  Demo
//
//  Created by Mark Glagola on 7/25/14.
//  Copyright (c) 2014 Mark Glagola. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCollectionViewController : UIViewController  <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, weak) IBOutlet UICollectionView* collectionView;

@end
