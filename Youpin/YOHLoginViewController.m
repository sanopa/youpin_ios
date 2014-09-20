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

#import <Parse/Parse.h>

@interface YOHLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

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
    if (self.usernameField.text && self.passwordField.text && ![self.usernameField.text isEqualToString:@""] && ![self.passwordField.text isEqualToString:@""]) {
        [PFUser logInWithUsernameInBackground:self.usernameField.text password:self.passwordField.text
                                        block:^(PFUser *user, NSError *error) {
                                            if (user) {
                                                // Do stuff after successful login.
                                                [self dismissViewControllerAnimated:YES completion:NULL];
                                            } else {
                                                // The login failed. Check error to see why.
                                                NSLog(@"%@", [error localizedDescription]);
                                                NSLog(@"Login failed using %@, %@", self.usernameField.text, self.passwordField.text);
                                            }
                                        }];
        //if that succeeds, do login stuff with groupon/instagram/yelp if possible

    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
