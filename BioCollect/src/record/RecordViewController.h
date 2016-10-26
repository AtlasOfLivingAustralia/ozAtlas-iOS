//
//  RecordViewController.h
//  Oz Atlas
//
//  Created by Sathish Babu Sathyamoorthy on 19/10/16.
//  Copyright © 2016 Sathya Moorthy, Sathish (CSIRO IM&T, Clayton). All rights reserved.
//

#import "FXForms.h"
#import "SpeciesSearchTableViewController.h"
#import <MapKit/MapKit.h>

@interface RecordViewController : FXFormViewController<CLLocationManagerDelegate>
@property (nonatomic, strong) SpeciesSearchTableViewController *speciesSearchVC;
@property (nonatomic, strong) UITableViewCell<FXFormFieldCell> *recordCell;
@property (nonatomic, strong) CLLocationManager *locationManager;
@end
