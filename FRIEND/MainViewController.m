//
//  MainViewController.m
//  FRIEND
//
//  Created by macbookpro on 2/19/16.
//  Copyright (c) 2016 BrianVodicka. All rights reserved.
//

#import "MainViewController.h"
#import "EventCell.h"
#import "ResourceInputMain.h"

static NSString * const eventID = @"EventId";
static NSString * const blankTableCell = @"blankTableCell";

@implementation MainViewController {
    NSArray *images;
    NSArray *titles;
    NSArray *subtitles;
    NSArray *attendingTexts;
    NSArray *times;
    
    UIImage *image;
    NSString *selectedTitle;
    NSString *selectedSubtitle;
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIFont *font = [UIFont fontWithName:@"Montserrat-Regular" size:17.0f];
    
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
    
    self.table_view.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.table_view.bounds.size.width, 0.01f)];
    
    
    images = [[NSArray alloc] initWithObjects: @"gender_neutral_icon.png", @"gender_neutral_icon.png", @"gender_neutral_icon.png", nil];
    attendingTexts = [[NSArray alloc] initWithObjects:@"4 friends attending", @"1 friend attending", @"", nil];
    titles = [[NSArray alloc] initWithObjects: @"Community Survey", @"Town Meeting", @"Volunteer Opportunity",nil];
    subtitles = [[NSArray alloc] initWithObjects: @"Posted three days ago", @"6:30 this Friday at the Community Center", @"Volunteer at your local library", nil];
    [self.table_view reloadData];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EventCell *cell = (EventCell *) [tableView cellForRowAtIndexPath:indexPath];
    
    image = cell.table_img.image;
    NSInteger tmpVal = indexPath.row / 2;
    selectedTitle = cell.main_label.text;
    selectedSubtitle = cell.sub_label.text;
    
    [self performSegueWithIdentifier:@"tableViewSelectedSegue" sender:self];
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
    return [titles count] * 2;
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

- (EventCell *)basicCellAtIndexPath:(NSIndexPath *)indexPath {
    EventCell *cell = [self.table_view dequeueReusableCellWithIdentifier:eventID forIndexPath:indexPath];
    [self configureBasicCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureBasicCell:(EventCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    NSInteger tmpVal = indexPath.row / 2;
    
    UIImage *tmpimage = [UIImage imageNamed: [images objectAtIndex:tmpVal]];
    [cell.table_img setImage:tmpimage];
    
    [cell.main_label setText:[titles objectAtIndex:tmpVal]];
    [cell.sub_label setText:[subtitles objectAtIndex:tmpVal]];
    NSString *tmpText = [attendingTexts objectAtIndex:tmpVal];
    [cell.attending_label setText:tmpText];
    if ([tmpText isEqualToString:@""]) {
        [cell.facebook_img setHidden:TRUE];
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 2 == 1) {
        return 10;
    } else {
        return 100;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"tableViewSelectedSegue"]) {
        ResourceInputMain *estimateViewController = [segue destinationViewController];
        // should we do anything here?
    }
}

@end
