//
//  TeaserController.m
//  FRIEND
//
//  Created by macbookpro on 2/19/16.
//  Copyright (c) 2016 BrianVodicka. All rights reserved.
//

#import "TeaserController.h"
#import "TeaserPageViewController.h"

@implementation TeaserController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
    
    self.pageTitles = [[NSArray alloc] initWithObjects:@"Welcome to FRIEND", @"Get Involved", @"See Events", @"Voice your Opinion", nil];
    self.pageSubtitles = [[NSArray alloc] initWithObjects:@"FREIND helps you connect with your community", @"Learn how to give back to your community", @"See community events relative to your preferences", @"Help give back to your community with interest forms and surveys", nil];
    self.pageImages = [[NSArray alloc] initWithObjects:@"splash0.png", @"splash1.png", @"splash2.png", @"splash1.png", nil];
    
    // Create page view controller
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationVertical options:nil];
    self.pageViewController.dataSource = self;
    self.pageViewController.delegate = self;
    
    TeaserPageViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}

- (IBAction)nextButton:(id)sender {
    [self nextPage];
}

- (void) nextPage {
    UIViewController *visibleViewController = self.pageViewController.viewControllers[0];
    NSUInteger index = ((TeaserPageViewController*) visibleViewController).pageIndex;
    if (index == 3) {
        [self performSegueWithIdentifier:@"TeaserToResource" sender:self];
        return;
    }
    index++;
    TeaserPageViewController *temp = [self viewControllerAtIndex:index];
    NSArray *viewControllers = @[temp];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - PageViewController Delegate Methods

- (UIViewController *) pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = ((TeaserPageViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *) pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = ((TeaserPageViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (TeaserPageViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    TeaserPageViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"TeaserPage"];
    pageContentViewController.imageFile = self.pageImages[index];
    pageContentViewController.titleText = self.pageTitles[index];
    pageContentViewController.subText = self.pageSubtitles[index];
    pageContentViewController.pageIndex = index;
    pageContentViewController.parent = self;
    pageContentViewController.buttonText = @"";
    if (index == 3) {
        pageContentViewController.buttonText = @"Let's get started";
    }
    
    return pageContentViewController;
}

@end
