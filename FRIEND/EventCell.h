//
//  EventCell.h
//  FRIEND
//
//  Created by macbookpro on 2/19/16.
//  Copyright (c) 2016 BrianVodicka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *main_label;
@property (weak, nonatomic) IBOutlet UILabel *sub_label;
@property (weak, nonatomic) IBOutlet UIImageView *table_img;

@end
