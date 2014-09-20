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

@interface YOHMainViewController () <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

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
    //if user logged in
    if (false) {
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:self.collectionvc];
        [self presentViewController:nav animated:YES completion:nil];
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

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return 3;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 1;
}

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers
{
    
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
