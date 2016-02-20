//
//  loginView.m
//  FRIEND
//
//  Created by macbookpro on 2/19/16.
//  Copyright (c) 2016 BrianVodicka. All rights reserved.
//

#import "loginView.h"

@implementation loginView

- (void) viewDidLoad {
    
    UIImage *hamburgerImage = [UIImage imageNamed:@"hamburger_icon.png"];
    UIButton *hamburgerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [hamburgerButton setImage:hamburgerImage forState:UIControlStateNormal];
    hamburgerButton.showsTouchWhenHighlighted = TRUE;
    hamburgerButton.frame = CGRectMake(0.0, 0.0, 20, 20);
    UIBarButtonItem *hamburger = [[UIBarButtonItem alloc] initWithCustomView:hamburgerButton];
    
    self.navigationController.navigationBar.titleTextAttributes = @{
                                                                    NSForegroundColorAttributeName: [UIColor colorWithRed:212/255.0 green:28/255.0 blue:36/255.0 alpha: 1],
                                                                    UITextAttributeFont: [UIFont fontWithName:@"Montserrat-Regular" size:18.0f]};
    self.navigationItem.title = @"FRIEND";
    self.navigationItem.leftBarButtonItem = hamburger;
    self.navigationController.navigationItem.leftBarButtonItem = hamburger;
    
}

- (IBAction)skipButton:(id)sender {
    
    [self performSegueWithIdentifier:@"loginSegue" sender:self];
    
}

@end
