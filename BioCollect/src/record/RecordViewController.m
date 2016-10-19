//
//  RecordViewController.m
//  Oz Atlas
//
//  Created by Sathish Babu Sathyamoorthy on 19/10/16.
//  Copyright © 2016 Sathya Moorthy, Sathish (CSIRO IM&T, Clayton). All rights reserved.
//

#import "RecordViewController.h"

#import "RecordForm.h"


@implementation RecordViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]))
    {
        //set up form
        self.formController.form = [[RecordForm alloc] init];
    }
    return self;
}

//these are action methods for our forms
//the methods escalate through the responder chain until
//they reach the AppDelegate

- (void)submitLoginForm
{
    //now we can display a form value in our alert
    [[[UIAlertView alloc] initWithTitle:@"Login Form Submitted"
                                message:nil
                               delegate:nil
                      cancelButtonTitle:nil
                      otherButtonTitles:@"OK", nil] show];
}

- (void)submitRegistrationForm:(UITableViewCell<FXFormFieldCell> *)cell
{
    //we can lookup the form from the cell if we want, like this:
    RecordForm *form = cell.field.form;
    
    //we can then perform validation, etc
    if (form.recordedBy)
    {
        [[[UIAlertView alloc] initWithTitle:@"Record sightings Form Submitted"
                                    message:nil
                                   delegate:nil
                          cancelButtonTitle:nil
                          otherButtonTitles:@"OK", nil] show];
    }
    else
    {
        [[[UIAlertView alloc] initWithTitle:@"User Error"
                                    message:@"Please agree to the terms and conditions before proceeding"
                                   delegate:nil
                          cancelButtonTitle:nil
                          otherButtonTitles:@"Yes Sir!", nil] show];
    }
}

@end
