//
//  SplashViewController.m
//  FRIEND
//
//  Created by macbookpro on 2/19/16.
//  Copyright (c) 2016 BrianVodicka. All rights reserved.
//

#import "SplashViewController.h"

@implementation SplashViewController

- (void) viewDidLoad {
    [[UIApplication sharedApplication] setStatusBarHidden:TRUE];
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    double delayInSeconds = 2.15;
    dispatch_time_t poptime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(poptime, dispatch_get_main_queue(), ^(void){
        // replace with splashSegue if you want traditional
        //[self performSegueWithIdentifier:@"thirdSplashSegue" sender:self];
        [self performSegueWithIdentifier:@"SplashToTeaser" sender:self];
    });
}

@end
