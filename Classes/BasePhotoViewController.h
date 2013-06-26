//
//  BasePhotoViewController.h
//  PhotoScroller
//
//  Created by Stephanie Sharp on 19/06/13.
//

#import <UIKit/UIKit.h>

@interface BasePhotoViewController : UIViewController <UIPageViewControllerDataSource>
@property (nonatomic, strong) UIPageViewController * pageViewController;
@end
