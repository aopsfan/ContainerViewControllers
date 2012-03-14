//
//  DummyViewController.h
//  ContainerViewControllers
//
//  Created by Bruce Ricketts on 2/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NavigationController;

@interface DummyViewController : UIViewController
@property (strong, nonatomic) NavigationController *navController;

- (IBAction)buttonPressed:(id)sender;

@end
