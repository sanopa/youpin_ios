//
//  YOHMainViewController.m
//  Youpin
//
//  Created by Sophia Anopa on 20.09.14.
//  Copyright (c) 2014 Aiiyoh. All rights reserved.
//

#import "YOHMainViewController.h"
#import "YOHLoginViewController.h"
#import "YOHSignupViewController.h"
#import "YOHSettingsViewController.h"

#import <Parse/Parse.h>

@interface YOHMainViewController () <UIPageViewControllerDataSource, UIPageViewControllerDelegate>
@property (nonatomic, strong) UINavigationController *nav;
@end

@implementation YOHMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.recentvc = [[YOHRecentViewController alloc] init];
    self.collectionvc = [[YOHCollectionViewController alloc] initWithCollectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
    self.searchvc = [[YOHSearchViewController alloc] init];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        // do stuff with the user
        UIPageViewController *pagevc = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        pagevc.dataSource = self;
        pagevc.delegate = self;
        [pagevc setViewControllers:@[self.recentvc] direction: UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
        self.nav = [[UINavigationController alloc] initWithRootViewController:pagevc];
        pagevc.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(settingsPressed:)];
        [self presentViewController:self.nav animated:YES completion:nil];
    } else {
        // show the signup or login screen
    }

}
- (IBAction)loginPressed:(id)sender {
    YOHLoginViewController *loginvc = [[YOHLoginViewController alloc] init];
    [self presentViewController:loginvc animated:YES completion:nil];
}

- (IBAction)signupPressed:(id)sender {
    YOHSignupViewController *signupvc = [[YOHSignupViewController alloc] init];
    [self presentViewController:signupvc animated:YES completion:nil];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    if ([viewController isKindOfClass:[YOHRecentViewController class]])
        return self.collectionvc;
    if ([viewController isKindOfClass:[YOHSearchViewController class]])
        return self.recentvc;
    if ([viewController isKindOfClass:[YOHCollectionViewController class]])
        return nil;
    return viewController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    if ([viewController isKindOfClass:[YOHRecentViewController class]])
        return self.searchvc;
    if ([viewController isKindOfClass:[YOHSearchViewController class]])
        return nil;
    if ([viewController isKindOfClass:[YOHCollectionViewController class]])
        return self.recentvc;
    return viewController;
}

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers
{
    
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    
}

- (void)settingsPressed:(id)sender
{
    [self.nav pushViewController:[[YOHSettingsViewController alloc] init] animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
