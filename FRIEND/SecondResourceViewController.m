//
//  SecondResourceViewController.m
//  FRIEND
//
//  Created by macbookpro on 2/19/16.
//  Copyright (c) 2016 BrianVodicka. All rights reserved.
//

#import "SecondResourceViewController.h"
#import "ResourceTableCell.h"

static NSString * const resourceCell = @"resourceCell";
static NSString * const blankTableCell = @"blankTableCell";

@implementation SecondResourceViewController {
    NSArray *questions;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.titleTextAttributes = @{
                                                                    NSForegroundColorAttributeName: [UIColor colorWithRed:212/255.0 green:28/255.0 blue:36/255.0 alpha: 1],
                                                                    UITextAttributeFont: [UIFont fontWithName:@"Montserrat-Regular" size:18.0f]};
    self.navigationItem.title = @"FRIEND";
    
    self.table_view.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.table_view.bounds.size.width, 0.01f)];
    
    
    questions = [[NSArray alloc] initWithObjects: @"How much do you value community events about entrepreneurship?",
                 @"How much do you value community events about entrepreneurship?",
                 @"How much do you value community events about entrepreneurship?", nil];
    
    [self.table_view reloadData];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ResourceTableCell *cell = (ResourceTableCell *) [tableView cellForRowAtIndexPath:indexPath];
    
    
    /*AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
     appDelegate.currentPatient = cell.name_label.text;
     appDelegate.currentPatientTime = cell.time_label.text;
     appDelegate.currentReason = cell.time_label.text;*/
    
    
}

/*- (void) test {
 [NSThread sleepForTimeInterval:1.6];
 
 }*/

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self deselectAllRows];
}

# pragma mark - UITableView Delegate Methods

- (void)deselectAllRows
{
    for (NSIndexPath *indexPath in [self.table_view indexPathsForSelectedRows]) {
        [self.table_view deselectRowAtIndexPath:indexPath animated:NO];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [questions count] * 2;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"hi");
    if (indexPath.row % 2 == 1) {
        return [self simpleCellAtIndexPath:indexPath];
    } else {
        return [self basicCellAtIndexPath:indexPath];
    }
}

- (UITableViewCell *)simpleCellAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.table_view dequeueReusableCellWithIdentifier:blankTableCell forIndexPath:indexPath];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell setBackgroundColor:[UIColor clearColor]];
    return cell;
}

- (ResourceTableCell *)basicCellAtIndexPath:(NSIndexPath *)indexPath {
    ResourceTableCell *cell = [self.table_view dequeueReusableCellWithIdentifier:resourceCell forIndexPath:indexPath];
    [self configureBasicCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureBasicCell:(ResourceTableCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    NSInteger tmpVal = indexPath.row / 2;
    
    [cell.firstheart addTarget:self action:@selector(yourButtonClicked:cell:) forControlEvents:UIControlEventTouchUpInside];
    [cell.secondHeart addTarget:self action:@selector(yourButtonClicked:cell:) forControlEvents:UIControlEventTouchUpInside];
    [cell.thirdHeart addTarget:self action:@selector(yourButtonClicked:cell:) forControlEvents:UIControlEventTouchUpInside];
    [cell.fourthHeart addTarget:self action:@selector(yourButtonClicked:cell:) forControlEvents:UIControlEventTouchUpInside];
    [cell.fifthHeart addTarget:self action:@selector(yourButtonClicked:cell:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)yourButtonClicked:(UIButton*)sender andTableCell:(ResourceTableCell *) cell
{
    NSLog(@"works");
    if (sender.tag == 0)
    {
        // Your code here
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 2 == 1) {
        return 10;
    } else {
        return 400;
    }
}

@end
