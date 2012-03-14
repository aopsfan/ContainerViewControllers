//
//  DummyViewController.m
//  ContainerViewControllers
//
//  Created by Bruce Ricketts on 2/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DummyViewController.h"
#import "NavigationController.h"

@implementation DummyViewController
@synthesize navController=_navController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _navController = [[NavigationController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    float red = (float)rand() / RAND_MAX; // Random float between 0 and 1
    float green = (float)rand() / RAND_MAX;
    float blue = (float)rand() / RAND_MAX;
    
    self.view.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

- (IBAction)buttonPressed:(id)sender {
    UIButton *button = (UIButton *)sender;
    
    // Setting up the dummy
    DummyViewController *newVC = [[DummyViewController alloc] initWithNibName:@"DummyViewController" bundle:nil];
    newVC.navController = self.navController;
    
    // Pushing the dummy
    if ([button.titleLabel.text isEqualToString:@"Fade"]) {
        [self.navController pushViewController:newVC animations:Fade];
    } else if ([button.titleLabel.text isEqualToString:@"Modal"]) {
        [self.navController pushViewController:newVC animations:Modal];
    } else if ([button.titleLabel.text isEqualToString:@"Push"]) {
        [self.navController pushViewController:newVC animations:Push];
    }
}

@end
