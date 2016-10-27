//
//  RecordViewController.m
//  Oz Atlas
//
//  Created by Sathish Babu Sathyamoorthy on 19/10/16.
//  Copyright © 2016 Sathya Moorthy, Sathish (CSIRO IM&T, Clayton). All rights reserved.
//

#import "RecordViewController.h"
#import "RecordForm.h"
#import "GAAppDelegate.h"


@implementation RecordViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]))
    {
        //set up form
        
        RecordForm *record = [[RecordForm alloc] init];
        record.surveyDate = [NSDate date];
        record.howManySpecies = 1;
        record.photoDate = [NSDate date];
    
        // location manager
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        [self.locationManager startUpdatingLocation];
        record.location = [self.locationManager location];
        
        self.formController.form = record;
        
        self.speciesSearchVC = [[SpeciesSearchTableViewController alloc] initWithNibName:@"SpeciesSearchTableViewController" bundle:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveSpeciesHandler:) name:@"SPECIESSEARCH SELECTED" object:nil];
        
    }
    return self;
}

//- (void) viewDidLoad{
//}

//these are action methods for our forms
//the methods escalate through the responder chain until
//they reach the AppDelegate

- (void)submitLoginForm
{
    RecordForm *record = self.formController.form;
    NSMutableDictionary *formValidity = [record isValid];
    NSNumber *valid = formValidity[@"valid"];
    if( [valid isEqualToNumber:[NSNumber numberWithInt: 0]] ) {
        [[[UIAlertView alloc] initWithTitle: @"Form not valid"
                                    message:[formValidity valueForKey:@"message"]
                                   delegate:nil
                          cancelButtonTitle:nil
                          otherButtonTitles:@"OK", nil] show];

    } else {
        GAAppDelegate *appDelegate = (GAAppDelegate *)[[UIApplication sharedApplication] delegate];
        NSMutableDictionary *status = [[appDelegate restCall] createRecord: record];
        NSNumber *statusCode = status[@"status"];
        if([statusCode isEqualToNumber: [NSNumber numberWithInt: 200]]){
            [[[UIAlertView alloc] initWithTitle:@"Successfully submitted."
                                        message:status[@"message"]
                                       delegate:nil
                              cancelButtonTitle:nil
                              otherButtonTitles:@"OK", nil] show];
        } else {
            [[[UIAlertView alloc] initWithTitle:@"Submission failed"
                                        message:status[@"message"]
                                       delegate:nil
                              cancelButtonTitle:nil
                              otherButtonTitles:@"OK", nil] show];

        }
    }
    //now we can display a form value in our alert
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


- (void)showSpeciesSearchTableViewController: (UITableViewCell *) sender {
    self.recordCell = sender;
    [self.navigationController pushViewController:self.speciesSearchVC animated:YES];
}

- (void)saveSpeciesHandler: (NSNotification *) notice{
    NSDictionary *selection = (NSDictionary *)[notice object];
    RecordForm *record = self.formController.form;
    if(selection[@"name"] != [NSNull null]){
        record.scientificName = selection[@"name"];
    } else {
        record.scientificName = nil;
    }
    
    if(![selection[@"commonName"] isEqual:@""]){
        record.commonName = selection[@"commonName"];
        if(record.scientificName){
            record.speciesDisplayName = [NSString stringWithFormat:@"%@ (%@)", record.scientificName, record.commonName];
        }
    } else {
        record.commonName = nil;
        record.speciesDisplayName = [NSString stringWithFormat:@"%@", record.scientificName];
    }
    
    if(selection[@"guid"] != [NSNull null]){
        record.guid = selection[@"guid"];
    } else {
        record.guid = nil;
    }
    
    self.recordCell.detailTextLabel.text = record.speciesDisplayName;
}

-(void) getLocation{
    if(self.locationManager == nil) {
        self.locationManager = [[CLLocationManager alloc] init];
        [self.locationManager requestWhenInUseAuthorization];
        
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    }
    
    [self.locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    RecordForm *record = self.formController.form;
    if (record.location == nil) {
        record.location = currentLocation;
    }
}

@end
