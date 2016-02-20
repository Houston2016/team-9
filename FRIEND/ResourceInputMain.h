//
//  ResourceInputMain.h
//  FRIEND
//
//  Created by macbookpro on 2/19/16.
//  Copyright (c) 2016 BrianVodicka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResourceInputMain : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *remainingLabel;

@property (weak, nonatomic) IBOutlet UIButton *earnMinusButton;
@property (weak, nonatomic) IBOutlet UIButton *earnPlusButton;
@property (weak, nonatomic) IBOutlet UIButton *learnMinusButton;
@property (weak, nonatomic) IBOutlet UIButton *learnPlusButton;
@property (weak, nonatomic) IBOutlet UIButton *belongMinusButton;
@property (weak, nonatomic) IBOutlet UIButton *belongPlusButton;
@property (weak, nonatomic) IBOutlet UIButton *earnHeartA;
@property (weak, nonatomic) IBOutlet UIButton *earnHeartB;
@property (weak, nonatomic) IBOutlet UIButton *earnHeartC;
@property (weak, nonatomic) IBOutlet UIButton *earnHeartD;
@property (weak, nonatomic) IBOutlet UIButton *earnHeartE;
@property (weak, nonatomic) IBOutlet UIButton *learnHeartA;
@property (weak, nonatomic) IBOutlet UIButton *learnHeartB;
@property (weak, nonatomic) IBOutlet UIButton *learnHeartC;
@property (weak, nonatomic) IBOutlet UIButton *learnHeartD;
@property (weak, nonatomic) IBOutlet UIButton *learnHeartE;
@property (weak, nonatomic) IBOutlet UIButton *belongHeartA;
@property (weak, nonatomic) IBOutlet UIButton *belongHeartB;
@property (weak, nonatomic) IBOutlet UIButton *belongHeartC;
@property (weak, nonatomic) IBOutlet UIButton *belongHeartD;
@property (weak, nonatomic) IBOutlet UIButton *belongHeartE;
@property (weak, nonatomic) IBOutlet UIImageView *remainingHeart;

@property (nonatomic) int earnValue;
@property (nonatomic) int learnValue;
@property (nonatomic) int belongValue;
@property (nonatomic) int remaining;

@end
