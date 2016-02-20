//
//  ResourceTableCell.h
//  FRIEND
//
//  Created by macbookpro on 2/19/16.
//  Copyright (c) 2016 BrianVodicka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResourceTableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *questionTitle;
@property (weak, nonatomic) IBOutlet UIButton *firstheart;
@property (weak, nonatomic) IBOutlet UIButton *secondHeart;
@property (weak, nonatomic) IBOutlet UIButton *thirdHeart;
@property (weak, nonatomic) IBOutlet UIButton *fourthHeart;
@property (weak, nonatomic) IBOutlet UILabel *value_label;
@property (weak, nonatomic) IBOutlet UIButton *fifthHeart;

@end
