//
//  registerViewController.m
//  NameLess
//
//  Created by Nitesh on 6/18/14.
//  Copyright (c) 2014 Nitesh. All rights reserved.
//

#import "registerViewController.h"

@interface registerViewController ()

@end

@implementation registerViewController

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
    
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
  
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)dismissKeyboard {
    [_usernameField resignFirstResponder];
    [_emailField resignFirstResponder];
    [_passwordField resignFirstResponder];
    [_reEnterPasswordField resignFirstResponder];
}


-(void) viewDidAppear:(BOOL)animated {
    PFUser *user = [PFUser currentUser];
    if(user.username != nil) {
        [self performSegueWithIdentifier:@"inside" sender:self];
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)registerAction:(id)sender {
    
    [self dismissKeyboard];
    [self checkFieldsComplete];
}

- (void) checkFieldsComplete {
    if([_usernameField.text isEqualToString:@""] || [_emailField.text isEqualToString:@""] || [_passwordField.text isEqualToString:@""] || [_reEnterPasswordField.text isEqualToString:@""] )
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Whoops" message:@"Fields are not yet complete. " delegate: nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }else {
        [self checkPasswordsMatch];
    }
}

- (void) checkPasswordsMatch {
    if(![_passwordField.text isEqualToString:_reEnterPasswordField.text]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Whoops" message:@"Password mismatch occurred." delegate: nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    } else {
        
        [self registerUser];
        
    }
}

- (void) registerUser {
    PFUser *newUser = [PFUser user];
    newUser.username = _usernameField.text;
    newUser.email = _emailField.text;
    newUser.password = _passwordField.text;
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if(!error) {
            NSLog(@"Registration Successful.");
            [self performSegueWithIdentifier:@"inside" sender:self];
        } else {
            NSLog(@"There was an error in registration. ");
        }
    }];
}
@end
