//
//  registerViewController.h
//  NameLess
//
//  Created by Nitesh on 6/18/14.
//  Copyright (c) 2014 Nitesh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface registerViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *reEnterPasswordField;
- (IBAction)registerAction:(id)sender;

@end
