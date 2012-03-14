//
//  NavigationController.m
//  ContainerViewControllers
//
//  Created by Bruce Ricketts on 2/14/12.
//  Copyright (c) 2012 THERE'S NO COPYRIGHT!!! All rights reserved.
//

#import "NavigationController.h"

@implementation NavigationController

- (id)initWithViewController:(UIViewController *)viewController {
    self = [super init];
    if (self) {
        [self addChildViewController:viewController];
        [self.view addSubview:viewController.view];
    }
    return self;
}

- (void)pushViewController:(UIViewController *)viewController animations:(AnimationType)animationType {
    // Access last view controller
    NSUInteger countOfLastViewController = [self.childViewControllers count] - 1;
    UIViewController *lastViewController = (UIViewController *)[self.childViewControllers objectAtIndex:countOfLastViewController];
    
    CGRect afterTransitionFrame = viewController.view.frame;
    CGRect beforeTransitionFrame = afterTransitionFrame;
    
    if (animationType == Modal) {
        // Put the view controller to present underneath the screen if the animation type is modal
        beforeTransitionFrame.origin.y += beforeTransitionFrame.size.height;
        viewController.view.frame = beforeTransitionFrame;
    } else if (animationType == Push) {
        // Put the view controller to present to the right of the screen if the animation type is push
        beforeTransitionFrame.origin.x += beforeTransitionFrame.size.width;
        viewController.view.frame = beforeTransitionFrame;
    } else if (animationType == Fade) {
        // Set the alpha of the view controller to present to 0.0 if the animation type is fade
        viewController.view.alpha = 0.0;
    }
    
    // Set up the view controller
    [self addChildViewController:viewController];
    [self.view addSubview:viewController.view];
    
    // Animate the transition if needed
    if (animationType != None) {
        [self transitionFromViewController:lastViewController
                          toViewController:viewController
                                  duration:0.5
                                   options:UIViewAnimationCurveEaseInOut
                                animations:^{
                                    viewController.view.frame = afterTransitionFrame;
                                    viewController.view.alpha = 1.0;
                                }
                                completion:^(BOOL finished) {
                                    
                                }];
    }
}

@end
