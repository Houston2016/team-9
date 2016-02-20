//
//  TeaserPageViewController.h
//  FRIEND
//
//  Created by macbookpro on 2/19/16.
//  Copyright (c) 2016 BrianVodicka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TeaserController.h"

@interface TeaserPageViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *skipButton;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *mainLabel;
@property (weak, nonatomic) IBOutlet UILabel *subLabel;
@property NSString *titleText;
@property NSString *subText;
@property NSString *imageFile;
@property NSUInteger pageIndex;
@property NSString *buttonText;
@property TeaserController *parent;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIImageView *downArrow;

@end
