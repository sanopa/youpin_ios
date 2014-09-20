//
//  YOHLoginViewController.m
//  Youpin
//
//  Created by Sophia Anopa on 20.09.14.
//  Copyright (c) 2014 Aiiyoh. All rights reserved.
//

#import "YOHLoginViewController.h"
#import "YOHRecentViewController.h"
#import "YOHCollectionViewController.h"
#import "YOHSearchViewController.h"
#import "YOHMainViewController.h"

@interface YOHLoginViewController ()

@end

@implementation YOHLoginViewController

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
}
- (IBAction)loginPressed:(id)sender {
    //do login stuff with Parse
    //if that succeeds, do login stuff with groupon/instagram/yelp if possible
    YOHMainViewController<UIPageViewControllerDelegate, UIPageViewControllerDataSource> *presentingvc =
        (YOHMainViewController<UIPageViewControllerDataSource,UIPageViewControllerDelegate> *)self.presentingViewController;
    [self dismissViewControllerAnimated:YES completion:^{
        //this stuff should not show up here - should show up only in main
        UIPageViewController *pagevc = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        pagevc.dataSource = presentingvc;
        pagevc.delegate = presentingvc;
        [pagevc setViewControllers:@[((YOHMainViewController *)presentingvc).recentvc] direction: UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:pagevc];
        [presentingvc presentViewController:nav animated:YES completion:nil];
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
