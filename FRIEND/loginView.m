//
//  loginView.m
//  FRIEND
//
//  Created by macbookpro on 2/19/16.
//  Copyright (c) 2016 BrianVodicka. All rights reserved.
//

#import "loginView.h"
#import "MBProgressHUD.h"

@implementation loginView

- (void) viewDidLoad {
    
    UIImage *hamburgerImage = [UIImage imageNamed:@"hamburger_icon.png"];
    UIButton *hamburgerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [hamburgerButton setImage:hamburgerImage forState:UIControlStateNormal];
    hamburgerButton.showsTouchWhenHighlighted = TRUE;
    hamburgerButton.frame = CGRectMake(0.0, 0.0, 20, 20);
    UIBarButtonItem *hamburger = [[UIBarButtonItem alloc] initWithCustomView:hamburgerButton];
    
    self.navigationController.navigationBar.titleTextAttributes = @{
                                                                    NSForegroundColorAttributeName: [UIColor colorWithRed:47/255.0 green:211/255.0 blue:148/255.0 alpha: 1],
                                                                    UITextAttributeFont: [UIFont fontWithName:@"Montserrat-Regular" size:18.0f]};
    self.navigationItem.title = @"FRIEND";
    self.navigationItem.leftBarButtonItem = hamburger;
    self.navigationController.navigationItem.leftBarButtonItem = hamburger;
    
}

- (IBAction)skipButton:(id)sender {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Authenticating...";
    [hud showWhileExecuting:@selector(test) onTarget:self withObject:nil animated:YES];
    
    
}

- (void) test {
    [NSThread sleepForTimeInterval:1.5];
    [self performSegueWithIdentifier:@"loginSegue" sender:self];
}

@end
