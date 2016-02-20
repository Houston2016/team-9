//
//  TeaserPageViewController.m
//  FRIEND
//
//  Created by macbookpro on 2/19/16.
//  Copyright (c) 2016 BrianVodicka. All rights reserved.
//

#import "TeaserPageViewController.h"

@implementation TeaserPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.image = [UIImage imageNamed:self.imageFile];
    self.mainLabel.text = self.titleText;
    self.subLabel.text = self.subText;
    //self.nextButton.titleLabel.text = self.buttonText;
    [self.nextButton setTitle:self.buttonText forState:UIControlStateNormal];
    if ([self.buttonText isEqualToString:@""]) {
        [self.downArrow setHidden:FALSE];
    } else {
        [self.downArrow setHidden:TRUE];
    }
    NSLog(@"%@", self.buttonText);
}

- (IBAction)buttonClick:(id)sender {
    [self.parent nextPage];
}

- (IBAction)skipTeasers:(id)sender {
    [self.parent performSegueWithIdentifier:@"TeaserToMain" sender:self.parent];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
