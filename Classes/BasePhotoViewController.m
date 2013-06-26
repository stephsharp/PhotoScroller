//
//  BasePhotoViewController.m
//  PhotoScroller
//
//  Created by Stephanie Sharp on 19/06/13.
//

#import "BasePhotoViewController.h"
#import "PhotoViewController.h"

@implementation BasePhotoViewController

@synthesize pageViewController;

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        PhotoViewController *pageZero = [PhotoViewController photoViewControllerForPageIndex:0];
        if (pageZero != nil)
        {
            self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:1
                                                                      navigationOrientation:0
                                                                                    options:nil];
            self.pageViewController.dataSource = self;
            
            [self.pageViewController setViewControllers:@[pageZero]
                                              direction:UIPageViewControllerNavigationDirectionForward
                                               animated:NO
                                             completion:NULL];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}

# pragma mark - UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pvc viewControllerBeforeViewController:(PhotoViewController *)vc
{
    NSUInteger index = vc.pageIndex;
    return [PhotoViewController photoViewControllerForPageIndex:(index - 1)];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pvc viewControllerAfterViewController:(PhotoViewController *)vc
{
    NSUInteger index = vc.pageIndex;
    return [PhotoViewController photoViewControllerForPageIndex:(index + 1)];
}

@end
