//
//  YOHSignupViewController.m
//  Youpin
//
//  Created by Sophia Anopa on 20.09.14.
//  Copyright (c) 2014 Aiiyoh. All rights reserved.
//

#import "YOHSignupViewController.h"

#import <Parse/Parse.h>

@interface YOHSignupViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end

@implementation YOHSignupViewController

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

- (IBAction)grouponPressed:(id)sender {
}

- (IBAction)instagramPressed:(id)sender {
}

- (IBAction)yelpPressed:(id)sender {
}

- (IBAction)signupPressed:(id)sender {
    PFUser *user = [PFUser user];
    user.username = self.usernameField.text;
    user.password = self.passwordField.text;
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            [self dismissViewControllerAnimated:YES completion:NULL];
        } else {
            NSString *errorString = [error userInfo][@"error"];
            NSLog(@"%@", errorString);
            NSLog(@"User couldn't sign up with credentials %@, %@", self.usernameField.text, self.passwordField.text);
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
