//
//  personModelController.h
//  NameLess
//
//  Created by Nitesh on 6/18/14.
//  Copyright (c) 2014 Nitesh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class personDataViewController;

@interface personModelController : NSObject <UIPageViewControllerDataSource>

- (personDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(personDataViewController *)viewController;

@end
