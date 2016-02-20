//
//  MainViewController.h
//  FRIEND
//
//  Created by macbookpro on 2/19/16.
//  Copyright (c) 2016 BrianVodicka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *table_view;

@property (nonatomic, copy) NSArray *feedItems;
@property (weak, nonatomic) IBOutlet UILabel *language_label;
@property (weak, nonatomic) IBOutlet UILabel *currently_viewing_label;
@property (weak, nonatomic) IBOutlet UILabel *head_label;


@end
