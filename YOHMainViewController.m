//
//  YOHMainViewController.m
//  Youpin
//
//  Created by Sophia Anopa on 20.09.14.
//  Copyright (c) 2014 Aiiyoh. All rights reserved.
//

#import "YOHMainViewController.h"
#import "YOHLoginViewController.h"
#import "YOHCollectionViewController.h"
#import "YOHSignupViewController.h"

@interface YOHMainViewController ()

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
}

-(void)viewDidAppear:(BOOL)animated
{
    //if user logged in
    if (false) {
        YOHCollectionViewController *collectionvc = [[YOHCollectionViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:collectionvc];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
