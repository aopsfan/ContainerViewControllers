//
//  NavigationController.h
//  ContainerViewControllers
//
//  Created by Bruce Ricketts on 2/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    None = 0,
    Fade,
    Modal,
    Push
} AnimationType;

@interface NavigationController : UIViewController

- (id)initWithViewController:(UIViewController *)viewController;
- (void)pushViewController:(UIViewController *)viewController animations:(AnimationType)animationType;

@end