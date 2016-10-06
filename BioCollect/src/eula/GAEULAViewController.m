//
//  GAEULAViewController.m
//  GreenArmy
//
//  Created by Sathya Moorthy, Sathish (Atlas of Living Australia) on 4/07/2014.
//  Copyright (c) 2014 Sathya Moorthy, Sathish (Atlas of Living Australia). All rights reserved.
//

#import "GAEULAViewController.h"
#import "GAAppDelegate.h"
#import "GASettings.h"

@interface GAEULAViewController ()

@end

@implementation GAEULAViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onClickAgree:(id)sender{
    [GASettings setEULA:kEULAAgreed];
    GAAppDelegate *appDelegate = (GAAppDelegate *)[[UIApplication sharedApplication] delegate];
  
    /*
    UIViewController* presentingViewController = self.presentingViewController;
    [self dismissViewControllerAnimated:NO completion:^{
        [presentingViewController presentViewController:appDelegate.loginViewController animated:NO completion:nil];
     
    }];
    */
    [appDelegate.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
    [UIView transitionWithView:appDelegate.window
                      duration:0.5
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{ appDelegate.window.rootViewController = appDelegate.loginViewController; }
                    completion:nil];
}

@end
