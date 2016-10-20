//
//  RecordViewController.h
//  Oz Atlas
//
//  Created by Sathish Babu Sathyamoorthy on 19/10/16.
//  Copyright © 2016 Sathya Moorthy, Sathish (CSIRO IM&T, Clayton). All rights reserved.
//

#import "FXForms.h"
#import "SpeciesSearchTableViewController.h"

@interface RecordViewController : FXFormViewController
@property (nonatomic, strong) SpeciesSearchTableViewController *speciesSearchVC;
@property (nonatomic, strong) UITableViewCell<FXFormFieldCell> *recordCell;
@end
