//
//  YOHMainViewController.h
//  Youpin
//
//  Created by Sophia Anopa on 20.09.14.
//  Copyright (c) 2014 Aiiyoh. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "YOHCollectionViewController.h"
#import "YOHRecentViewController.h"
#import "YOHSearchViewController.h"

@interface YOHMainViewController : UIViewController
@property (nonatomic, strong) YOHRecentViewController *recentvc;
@property (nonatomic, strong) YOHCollectionViewController *collectionvc;
@property (nonatomic, strong) YOHSearchViewController *searchvc;
@end
