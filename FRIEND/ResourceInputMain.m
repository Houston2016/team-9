//
//  ResourceInputMain.m
//  FRIEND
//
//  Created by macbookpro on 2/19/16.
//  Copyright (c) 2016 BrianVodicka. All rights reserved.
//

#import "ResourceInputMain.h"
#import "SecondResourceViewController.h"
#import "AppDelegate.h"
#import "MBProgressHUD.h"
#import "JSONKit.h"

@implementation ResourceInputMain {
    NSArray* earnArray;
    NSArray* learnArray;
    NSArray* belongArray;
    NSArray* foundQuestions;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupHearts];
    
    [self fixRemainingLabel];
    
    /*NSArray *preferences = [[NSUserDefaults standardUserDefaults] objectForKey:@"weights"];
    self.costValue = [[preferences objectAtIndex:0] intValue];
    self.expValue = [[preferences objectAtIndex:1] intValue];
    self.proxValue = [[preferences objectAtIndex:2] intValue];*/
    
    //if (!self.costValue) {
    self.earnValue = 0;
    self.learnValue = 0;
    self.belongValue = 0;
    //}
    self.remaining = 9;
    //self.remaining = 9 - self.costValue - self.expValue - self.proxValue;
    [self fixRemainingLabel];
    [self fillHearts];
}

- (void) fixRemainingLabel {
    [self.remainingLabel setText:[NSString stringWithFormat:@"%i Hearts Remaining", self.remaining]];
    
    UIFont *regularFont19 = [UIFont fontWithName:@"Montserrat-Regular" size:19];
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:self.remainingLabel.text];
    [text addAttribute:NSFontAttributeName value:regularFont19 range:NSMakeRange(0,1)];
    [text addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:255/255.0 green:40/255.0 blue:81/255.0 alpha:1] range:NSMakeRange(0, 1)];
    self.remainingLabel.attributedText = text;
    if (self.remaining == 0) {
        [self.remainingHeart setImage:[UIImage imageNamed:@"heart_empty.png"]];
    } else {
        [self.remainingHeart setImage:[UIImage imageNamed:@"heart_icon.png"]];
    }
}

- (void) setupHearts {
    earnArray = [[NSArray alloc] initWithObjects:self.earnHeartA, self.earnHeartB, self.earnHeartC, self.earnHeartD, self.earnHeartE, nil];
    learnArray = [[NSArray alloc] initWithObjects:self.learnHeartA, self.learnHeartB, self.learnHeartC, self.learnHeartD, self.learnHeartE, nil];
    belongArray = [[NSArray alloc] initWithObjects:self.belongHeartA, self.belongHeartB, self.belongHeartC, self.belongHeartD, self.belongHeartE, nil];
}

- (void) fillHearts {
    [self fillEarnHearts];
    [self fillLearnHearts];
    [self fillBelongHearts];
}

- (void) fillEarnHearts {
    UIImage *heartImage = [UIImage imageNamed:@"heart_icon_teal.png"];
    UIImage *emptyHeartImage = [UIImage imageNamed:@"heartopen_icon_teal.png"];
    int count = 0;
    while (count < 5) {
        UIButton *temp = [earnArray objectAtIndex:count];
        if (count < self.earnValue) {
            [temp setImage:heartImage forState:UIControlStateNormal];
        } else {
            [temp setImage:emptyHeartImage forState:UIControlStateNormal];
        }
        count++;
    }
}

- (void) fillLearnHearts {
    UIImage *heartImage = [UIImage imageNamed:@"heart_icon_blue.png"];
    UIImage *emptyHeartImage = [UIImage imageNamed:@"heartopen_icon_blue.png"];
    int count = 0;
    while (count < 5) {
        UIButton *temp = [learnArray objectAtIndex:count];
        if (count < self.learnValue) {
            [temp setImage:heartImage forState:UIControlStateNormal];
        } else {
            [temp setImage:emptyHeartImage forState:UIControlStateNormal];
        }
        count++;
    }
}

- (void) fillBelongHearts {
    UIImage *heartImage = [UIImage imageNamed:@"heart_icon_purple.png"];
    UIImage *emptyHeartImage = [UIImage imageNamed:@"heartopen_icon_purple.png"];
    int count = 0;
    while (count < 5) {
        UIButton *temp = [belongArray objectAtIndex:count];
        if (count < self.belongValue) {
            [temp setImage:heartImage forState:UIControlStateNormal];
        } else {
            [temp setImage:emptyHeartImage forState:UIControlStateNormal];
        }
        count++;
    }
}

- (IBAction)minusClick:(id)sender {
    UIButton *btn = (UIButton*) sender;
    UIImage *heartImage;
    UIImage *emptyHeartImage;
    NSArray *array = earnArray;
    int value = 0;
    switch (btn.tag) {
        case 1:
            heartImage = [UIImage imageNamed:@"heart_icon_teal.png"];
            emptyHeartImage = [UIImage imageNamed:@"heartopen_icon_teal.png"];
            value = self.earnValue;
            if (value != 0) self.earnValue--;
            array = earnArray;
            break;
        case 2:
            heartImage = [UIImage imageNamed:@"heart_icon_blue.png"];
            emptyHeartImage = [UIImage imageNamed:@"heartopen_icon_blue.png"];
            value = self.learnValue;
            if (value != 0) self.learnValue--;
            array = learnArray;
            break;
        case 3:
            heartImage = [UIImage imageNamed:@"heart_icon_purple.png"];
            emptyHeartImage = [UIImage imageNamed:@"heartopen_icon_purple.png"];
            value = self.belongValue;
            if (value != 0) self.belongValue--;
            array = belongArray;
            break;
    }
    if (value == 0) {
        return;
    }
    value--;
    NSLog(@"%i", value);
    int count = 0;
    while (count < 5) {
        UIButton *temp = [array objectAtIndex:count];
        if (count < value) {
            [temp setImage:heartImage forState:UIControlStateNormal];
        } else {
            [temp setImage:emptyHeartImage forState:UIControlStateNormal];
        }
        count++;
    }
    self.remaining = self.remaining + 1;
    [self fixRemainingLabel];
}

- (IBAction)plusClick:(id)sender {
    UIButton *btn = (UIButton*) sender;
    UIImage *heartImage;
    UIImage *emptyHeartImage;
    NSArray *array = earnArray;
    int value = 0;
    NSLog(@"%i", self.earnValue);
    switch (btn.tag) {
        case 1:
            heartImage = [UIImage imageNamed:@"heart_icon_teal.png"];
            emptyHeartImage = [UIImage imageNamed:@"heartopen_icon_teal.png"];
            value = self.earnValue + 1;
            if (self.earnValue != 5 && self.remaining != 0) self.earnValue++;
            array = earnArray;
            break;
        case 2:
            heartImage = [UIImage imageNamed:@"heart_icon_blue.png"];
            emptyHeartImage = [UIImage imageNamed:@"heartopen_icon_blue.png"];
            value = self.learnValue + 1;
            if (self.learnValue != 5 && self.remaining != 0) self.learnValue++;
            array = learnArray;
            break;
        case 3:
            heartImage = [UIImage imageNamed:@"heart_icon_purple.png"];
            emptyHeartImage = [UIImage imageNamed:@"heartopen_icon_purple.png"];
            value = self.belongValue + 1;
            if (self.belongValue != 5 && self.remaining != 0) self.belongValue++;
            array = belongArray;
            break;
    }
    if (value == 6 || self.remaining == 0) return;
    int count = 0;
    while (count < 5) {
        UIButton *temp = [array objectAtIndex:count];
        if (count < value && self.remaining > 0) {
            [temp setImage:heartImage forState:UIControlStateNormal];
        } else {
            [temp setImage:emptyHeartImage forState:UIControlStateNormal];
        }
        count++;
    }
    self.remaining = self.remaining - 1;
    [self fixRemainingLabel];
}

- (IBAction)affordabilityHeartClick:(id)sender {
    UIImage *heartImage = [UIImage imageNamed:@"heart_icon_teal.png"];
    UIImage *emptyHeartImage = [UIImage imageNamed:@"heartopen_icon_teal.png"];
    UIButton *button = (UIButton*) sender;
    int count = 0;
    int max = 0;
    while (count < 5) {
        UIButton *temp = [earnArray objectAtIndex:count];
        if (count < self.earnValue && count < button.tag) {
            [temp setImage:heartImage forState:UIControlStateNormal];
            max = count + 1;
        } else if (count < button.tag && self.remaining > 0) {
            [temp setImage:heartImage forState:UIControlStateNormal];
            max = count + 1;
        } else {
            [temp setImage:emptyHeartImage forState:UIControlStateNormal];
        }
        if (count + 1 > self.earnValue && count + 1 <= button.tag) {
            self.remaining--;
        }
        count++;
    }
    int difference = self.earnValue - button.tag;
    if (difference > 0) self.remaining += difference;
    self.earnValue = max;
    self.remaining = MAX(self.remaining, 0);
    [self fixRemainingLabel];
}

- (IBAction)performanceHeartClick:(id)sender {
    UIImage *heartImage = [UIImage imageNamed:@"heart_icon_blue.png"];
    UIImage *emptyHeartImage = [UIImage imageNamed:@"heartopen_icon_blue.png"];
    UIButton *button = (UIButton*) sender;
    int count = 0;
    int max = 0;
    while (count < 5) {
        UIButton *temp = [learnArray objectAtIndex:count];
        if (count < self.learnValue && count < button.tag) {
            [temp setImage:heartImage forState:UIControlStateNormal];
            max = count + 1;
        } else if (count < button.tag && self.remaining > 0) {
            [temp setImage:heartImage forState:UIControlStateNormal];
            max = count + 1;
        } else {
            [temp setImage:emptyHeartImage forState:UIControlStateNormal];
        }
        if (count + 1 > self.learnValue && count + 1 <= button.tag) {
            self.remaining--;
        }
        count++;
    }
    int difference = self.learnValue - button.tag;
    if (difference > 0) self.remaining += difference;
    self.learnValue = max;
    self.remaining = MAX(self.remaining, 0);
    [self fixRemainingLabel];
}

- (IBAction)proximityHeartClick:(id)sender {
    UIImage *heartImage = [UIImage imageNamed:@"heart_icon_purple.png"];
    UIImage *emptyHeartImage = [UIImage imageNamed:@"heartopen_icon_purple.png"];
    UIButton *button = (UIButton*) sender;
    int count = 0;
    int max = 0;
    while (count < 5) {
        UIButton *temp = [belongArray objectAtIndex:count];
        if (count < self.belongValue && count < button.tag) {
            [temp setImage:heartImage forState:UIControlStateNormal];
            max = count + 1;
        } else if (count < button.tag && self.remaining > 0) {
            [temp setImage:heartImage forState:UIControlStateNormal];
            max = count + 1;
        } else {
            [temp setImage:emptyHeartImage forState:UIControlStateNormal];
        }
        if (count + 1 > self.belongValue && count + 1 <= button.tag) {
            self.remaining--;
        }
        count++;
    }
    int difference = self.belongValue - button.tag;
    if (difference > 0) self.remaining += difference;
    self.belongValue = max;
    self.remaining = MAX(self.remaining, 0);
    [self fixRemainingLabel];
}

- (IBAction)submitPreferences:(id)sender {
    NSArray *array = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:self.earnValue], [NSNumber numberWithInt:self.learnValue], [NSNumber numberWithInt:self.belongValue], nil];
    [[NSUserDefaults standardUserDefaults] setObject:array forKey:@"weights"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSString *urlAsString = [NSString stringWithFormat:@"http://54.211.34.104:3000/api/questions"];
    
    NSURL *url = [[NSURL alloc] initWithString:urlAsString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self sendUrlRequest:request];
}

- (void) sendUrlRequest:(NSURLRequest*)request{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [NSURLConnection sendAsynchronousRequest: request
                                       queue: [NSOperationQueue mainQueue]
                           completionHandler: ^(NSURLResponse *response, NSData *data, NSError *error) {
                               // Check for errors first
                               if (error) {
                                   NSLog(@"Error in updateInfoFromServer: %@ %@", error, [error localizedDescription]);
                               } else if (!response) {
                                   NSLog(@"Could not reach server");
                               } else if (!data) {
                                   NSLog(@"Server did not return any data");
                               } else {
                                   NSLog(@"%@", data);
                                   [self analyzeData:data];
                                   
                               }
                           }];
}

- (void) analyzeData:(NSData*) data {
    JSONDecoder *decoder = [[JSONDecoder alloc]
                            initWithParseOptions:JKParseOptionNone];
    NSDictionary *results = [decoder objectWithData:data];
    NSLog(@"%@", results);
    
    NSDictionary *questionsDict = [results objectForKey:@"Questions"];
    
    NSLog(@"%@", questionsDict);
    
    NSMutableArray *tmp = [[NSMutableArray alloc] init];
    for (NSDictionary *item in questionsDict) {
        [tmp addObject:[item objectForKey:@"Questions"]];
    }
    foundQuestions = [tmp copy];
    NSLog(@"%@",tmp);
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [self performSegueWithIdentifier:@"ResourceToSecondResource" sender:self];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ResourceToSecondResource"]) {
        SecondResourceViewController *destinationViewController = (SecondResourceViewController *)segue.destinationViewController;
        destinationViewController.foundQuestions = foundQuestions;
        
        
    }
}


@end


