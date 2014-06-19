//
//  personDataViewController.m
//  NameLess
//
//  Created by Nitesh on 6/18/14.
//  Copyright (c) 2014 Nitesh. All rights reserved.
//

#import "personDataViewController.h"

@interface personDataViewController ()

@end

@implementation personDataViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.dataLabel.text = [self.dataObject description];
}

@end
